---
layout: post
title: "Cloudflare Durable Objects"
date: 2026-10-28 00:00:00 +0530
categories: [Backend, System Design]
tags: [cloudflare, durable-objects, distributed-systems, sqlite, edge-computing, websockets, concurrency]
description: "How Cloudflare Durable Objects coordinate shared state, persist data with SQLite, and handle concurrency, WebSockets, and failures."
author: harshityadav95
image:
  path: /assets/img/posts/cloudflare-durable-objects/image.png
  alt: Cloudflare Durable Objects
published: true
---

## TLDR;

{% include embed/youtube.html id='KDJxfpyU0z4' %}

# Cloudflare Durable Objects

Imagine you're building a collaborative document editor.

You have two users.

One is sitting in Tokyo. The other is sitting in London.

Both are editing the same document at exactly the same time.

Now, because you're a clever backend engineer, you've decided to deploy your application on Cloudflare Workers.

Your Tokyo user's request goes to a nearby Cloudflare edge location. Your London user's request also goes to a nearby edge location.

Beautiful.

Low latency. No traditional application servers to manage. Your code executes close to the users.

But here's my question.

**Who decides which user's edit happens first?**

And that's where things get interesting.

Because just because your code runs close to your users doesn't mean your shared state is close to everyone.

This is fundamentally a distributed systems problem.

And Cloudflare Durable Objects are one way to address it.

---

## 1. The Problem Nobody Talks About When They Talk About Edge Computing

Forget collaborative editors for a second.

Let's build something simpler.

A movie ticket booking system.

There is exactly one seat remaining.

Two users attempt to reserve that seat at the same time.

Your backend looks something like this:

![image.png](/assets/img/posts/cloudflare-durable-objects/image-1.png)

Congratulations.

You've just sold the same seat twice.

What happened?

Nothing particularly unusual. Both requests read the same state before either successfully changed it.

This is a classic **check-then-act race condition**.

The problem is not that Cloudflare Workers are slow.

The problem is not that JavaScript is single-threaded.

The problem is that two independent execution environments made decisions about the same shared resource.

### Why can't we just use a global variable?

You might try:

```
let seatAvailable = true;
```

And then check that variable before accepting a reservation.

But ordinary Cloudflare Workers don't guarantee that all requests execute inside the same isolate or even the same machine.

Your application may have multiple active instances.

Each instance has its own memory.

So your global variable is only global within that particular JavaScript execution environment.

It is not globally authoritative.

**Memory inside a Worker is a cache, not a distributed coordination mechanism.**

### What would a traditional backend do?

Usually, we'd send both requests to a shared database.

For example:

```
UPDATE seats
SET available = false
WHERE id = 42
  AND available = true
RETURNING id;
```

This is important.

The database atomically checks the condition and performs the update.

Only one competing request can successfully reserve that seat.

You don't necessarily need a distributed lock.

You don't need two-phase commit.

And you certainly don't need to introduce CRDTs just to reserve one seat.

![image.png](/assets/img/posts/cloudflare-durable-objects/image-2.png)

A properly designed conditional update or transaction is sufficient.

But now you have a different architectural question.

**Where should this coordination take place, and how many network round trips does it require?**

---

## 2. The Network Is Part of Your Database Architecture

Think about what happens when your edge application talks to a centralized database.

![image.png](/assets/img/posts/cloudflare-durable-objects/image-3.png)

The Worker may execute in milliseconds.

But the database is somewhere else.

Every database interaction has costs:

- Network propagation and round-trip latency
- Connection management and pooling
- Database scheduling and query execution
- Serialization and deserialization
- Transaction and durability overhead

Now, don't misunderstand this.

A database query does not automatically establish a new TCP connection or perform a new TLS handshake.

Modern database clients reuse connections.

Connection pooling changes the economics considerably.

But physical distance is still physical distance.

If your application makes multiple sequential database calls over a long-distance network connection, those round trips can dominate your request time.

For example, imagine this workflow:

1. Read the document version.
2. Validate the user's operation.
3. Update the document.
4. Write an event.
5. Return the new version.

If each step depends on the result of a separate remote database request, you're creating a latency chain.

This is why the location of state coordination matters.

And this brings us to Durable Objects.

---

## 3. Durable Objects: What If the Coordinator and the Database Were Together?

A Cloudflare Durable Object is a logical instance of your application code associated with a specific identity and its own durable storage.

Think of it as a coordinator for a particular entity.

Not your entire application.

Not every user in your system.

One logical entity.

For example:

- Document `document:42`
- Chat room `room:42`
- Multiplayer match `match:9001`
- Rate limiter `tenant:acme`
- Shopping cart `cart:123`

Now all requests that need to modify the same document can be directed to the same logical object.

![image.png](/assets/img/posts/cloudflare-durable-objects/image-4.png)

Notice what changed.

We didn't magically eliminate the network.

Both users still have to communicate with the Durable Object.

And if the object is geographically closer to Tokyo, the London user may have a longer journey.

What we changed is **where the authoritative decision happens**.

Instead of independent Workers making conflicting decisions, they send commands to a common logical authority.

This makes coordination much easier.

It is also a very different scaling model from a centralized application server.

---

## 4. How Does Cloudflare Know Which Durable Object to Invoke?

This is where identity becomes important.

A Durable Object has a class, a namespace, and an identity.

The class defines the behavior.

The namespace groups the available identities for that binding.

The identity determines which logical object receives your request.

For example:

```
const room = env.ROOMS.getByName("room:42");

const result = await room.getStatus();
```

What's happening here?

First, we're obtaining a stub for the identity `room:42`.

The name deterministically identifies the same logical object within that namespace.

Obtaining the stub does not itself require executing the object's constructor.

When you invoke the object, Cloudflare routes that request to the corresponding logical authority, activating it if necessary.

This means:

```
Worker A -> room:42
Worker B -> room:42
Worker C -> room:42
```

All target the same logical identity.

But:

```
Worker A -> room:42
Worker B -> room:43
```

These are independent objects.

They can execute separately.

And that's an important design property.

**Your object identity is effectively your partitioning strategy.**

If you create one object per chat room, different rooms can scale independently.

If you create one object for your entire messaging platform, you've created one enormous coordination bottleneck.

![image.png](/assets/img/posts/cloudflare-durable-objects/image-5.png)

We'll return to that problem later.

---

## 5. Is a Durable Object an Actual Server?

Here's a common misconception.

You might imagine every Durable Object getting its own dedicated server, process, or virtual machine.

That's not how you should model it.

Cloudflare Workers run JavaScript using V8 isolates.

An isolate is a lightweight execution environment inside a runtime process.

Multiple isolates can share the underlying infrastructure.

A Durable Object therefore does not imply:

- A dedicated physical server
- A dedicated operating-system process
- A permanently allocated CPU core
- An always-running in-memory instance

Instead, it provides a logical execution and storage boundary.

Cloudflare handles the underlying scheduling, placement, activation, and lifecycle.

And this distinction matters because your JavaScript object can disappear from memory while its durable data remains available.

The identity is persistent.

The JavaScript heap is not.

---

## 6. Single-Threaded JavaScript Does Not Mean Race-Condition-Free JavaScript

This is probably one of the most important concepts in the entire architecture.

People hear *single-threaded JavaScript* and conclude:

"Great. No concurrency problems."

Not quite.

JavaScript executes one synchronous segment at a time within that object.

But asynchronous operations can yield control.

Consider this simplified operation:

```
async function reserveSeat() {
  if (this.available) {
    await fetch("https://example.com/check");
    this.available = false;
    return "reserved";
  }
}
```

Now imagine two requests.

```
Time       Request A             Request B
------------------------------------------------
T1         Read available=true
T2         Await external API
T3                               Read available=true
T4                               Await external API
T5         Resume
T6         Set available=false
T7                               Resume
T8                               Set available=false
```

Both requests saw the seat as available.

There were never two JavaScript statements physically executing simultaneously in the object.

Yet we still have a race.

Why?

Because **concurrency is about overlapping operations, not merely parallel CPU execution**.

An `await` introduces a point where another request may make progress.

This distinction is essential when designing anything with asynchronous I/O.

### So how does Cloudflare protect storage operations?

Cloudflare Durable Objects provide two important mechanisms.

**Input gates**

Under the default storage behavior, input gates prevent other events from being delivered while relevant storage operations are pending.

This protects common read-modify-write patterns involving Durable Object storage.

**Output gates**

Output gates delay outgoing messages while storage writes are pending.

Why?

Imagine your database write hasn't been durably confirmed yet, but you've already sent an HTTP 200 response.

If that write subsequently fails, the client believes the operation succeeded even though the state wasn't committed.

Output gates help prevent that situation.

But here's the subtlety.

These mechanisms don't turn arbitrary JavaScript containing multiple external network calls into one transaction.

They don't make remote API side effects atomic with SQLite.

And they don't eliminate every possible race between concurrently started asynchronous tasks.

For complex workflows, you still need a proper state machine, version checks, reservations, or application-level coordination.

Cloudflare also provides `blockConcurrencyWhile()` for short asynchronous critical operations and initialization.

But holding that block while waiting on a slow external API can stall the entire object. The documented timeout is 30 seconds, after which the object is reset.

**The runtime provides primitives. Your application is still responsible for its concurrency model.**

![image.png](/assets/img/posts/cloudflare-durable-objects/image-6.png)

---

## 7. SQLite Inside a Durable Object Changes the Performance Model

Now let's discuss the database.

Normally, when a backend engineer thinks about SQL, the mental picture looks like this:

```
Application
    |
    | Database protocol
    |
    v
Database Server
    |
    v
Query Engine
    |
    v
Storage
```

But SQLite works differently.

SQLite is an embedded database engine.

It runs as a library inside the application's execution environment.

There is no separate database server process you must communicate with for ordinary SQL execution.

With SQLite-backed Durable Objects, SQL execution occurs locally to the object.

Consider a counter:

```
import { DurableObject } from "cloudflare:workers";

export class Counter extends DurableObject {
  constructor(ctx, env) {
    super(ctx, env);

    ctx.storage.sql.exec(
      `CREATE TABLE IF NOT EXISTS counter (
        id INTEGER PRIMARY KEY,
        value INTEGER NOT NULL
      )`
    );

    ctx.storage.sql.exec(
      `INSERT OR IGNORE INTO counter
       (id, value) VALUES (1, 0)`
    );
  }

  increment() {
    return this.ctx.storage.sql.exec(
      `UPDATE counter
       SET value = value + 1
       WHERE id = 1
       RETURNING value`
    ).one().value;
  }
}
```

Look carefully at the increment.

```
UPDATE counter
SET value = value + 1
WHERE id = 1
RETURNING value;
```

This is one atomic SQL statement.

We are not doing:

```
const oldValue = await database.read();
await database.write(oldValue + 1);
```

We're asking SQLite to perform the mutation atomically.

There is no asynchronous JavaScript gap between reading the current value and updating it.

For multiple statements that must succeed or fail together, SQLite-backed Durable Objects offer synchronous transactions through `transactionSync()`.

But there's another interesting question.

**If SQLite executes locally, how does the data survive a machine failure?**

That takes us into the storage architecture.

---

## 8. The Hidden Network Behind Embedded SQLite

This is the part that makes the system especially interesting for backend engineers.

Embedded SQLite removes the need for a separate database-server round trip during SQL execution.

But it doesn't mean writes exist only on the local machine.

Durable state still needs to survive infrastructure failure.

In Cloudflare's published 2024 architecture, a component called the **Storage Relay Service (SRS)** handles replication of SQLite write-ahead-log changes.

The described design uses five follower replicas, with write confirmation after three acknowledge.

It also stores batches of log changes and snapshots in object storage.

These are published implementation details, not guarantees that every future version must preserve exactly the same replica count.

Conceptually:

```
        Durable Object
              |
              v
      Embedded SQLite
              |
              v
       Write-Ahead Log
              |
              v
     Storage Relay Service
              |
       +------+------+------+
       |      |      |      |
       v      v      v      v
     Replica Replica Replica ...
              |
              v
      Log batches / snapshots
              |
              v
         Object Storage
```

Here's where it gets subtle.

A synchronous SQL call can finish executing while the durability confirmation is still pending.

The JavaScript code may continue.

But the output gate prevents a successful response from escaping before the relevant pending writes are confirmed.

Think about the timeline:

```
T1  Client sends increment request
 |
T2  Durable Object executes SQL
 |
T3  SQLite returns new counter value
 |
T4  JavaScript prepares success response
 |
T5  Replication confirmation completes
 |
T6  Output gate allows response
 |
T7  Client receives success
```

This means two things can be true at the same time:

1. SQL execution avoids a remote database-server round trip.
2. Client-visible write latency can still include network durability costs.

This is an incredibly important performance distinction.

**Local execution is not the same thing as zero network latency, and synchronous SQL return is not automatically the same thing as durable acknowledgment.**

When benchmarking Durable Objects, measure the entire request lifecycle.

Don't just time the SQL statement.

---

## 9. WebSocket Hibernation: Keeping Connections Without Keeping JavaScript Alive

![image.png](/assets/img/posts/cloudflare-durable-objects/image-7.png)

Now imagine you're building a real-time chat application.

Each room has a Durable Object.

Hundreds of users connect using WebSockets.

But here's the problem.

Most chat rooms are idle most of the time.

People connect, read messages, occasionally type, and then disappear for a while.

Keeping an application instance continuously active just to maintain idle connections can waste resources.

Cloudflare provides WebSocket hibernation.

The idea is simple:

**Keep the network connection alive without requiring the Durable Object's JavaScript instance to remain active.**

You opt into server-side hibernation with:

```
this.ctx.acceptWebSocket(serverSocket);
```

When the object becomes eligible for hibernation, Cloudflare can remove its JavaScript instance from memory while maintaining the client connections.

When a new event arrives, the object is reconstructed.

```
Active Durable Object
        |
        v
Clients connected
        |
        v
Idle and eligible
        |
        v
JavaScript instance evicted
        |
        | WebSockets remain connected
        |
        v
New WebSocket message arrives
        |
        v
Object constructor executes
        |
        v
Connection state reconstructed
        |
        v
Message processed
```

Notice something important.

This is not a heap snapshot.

Cloudflare isn't freezing every JavaScript object and restoring it exactly as it was.

Your class fields are initialized again.

So imagine you had:

```
this.users = new Map();
```

After hibernation, that map starts fresh.

Cloudflare offers APIs such as `getWebSockets()`, `serializeAttachment()`, and `deserializeAttachment()` to help reconstruct connection-specific metadata.

But durable business data should still be stored in durable storage.

And don't confuse hibernation with guaranteed perpetual connectivity. Deployments, shutdowns, and connection failures can still disconnect clients.

Also, outgoing WebSocket connections don't support this hibernation mechanism.

The key lesson:

**A connection can outlive the JavaScript instance responsible for handling it.**

Your application architecture has to account for that.

---

## 10. The Scaling Trap: One Object Can Become Your Bottleneck

![image.png](/assets/img/posts/cloudflare-durable-objects/image-8.png)

That's the fundamental trade-off.

**The smaller your consistency boundary, the easier it is to scale independently. But the more boundaries you introduce, the more difficult cross-boundary coordination becomes.**

A useful rule is to make the object represent the smallest entity whose state must be consistent together.

Also remember that an object has storage and execution limits. The supplied platform notes cite a 10 GB SQLite storage limit per object; verify the latest published limit when sizing production workloads.

Millions of objects do not make one individual object an unlimited database.

---

## 11. Distributed Transactions Haven't Disappeared

Suppose you're building a banking system.

You have:

```
Account A ---> Durable Object A

Account B ---> Durable Object B
```

Now the user wants to transfer ₹5,000 from Account A to Account B.

You debit Account A.

Success.

Then you credit Account B.

But the second operation fails.

Now what?

You have successfully implemented a partial transfer.

Each Durable Object has local transactional capabilities, but that doesn't mean you automatically have an atomic transaction across both objects.

You cannot assume:

```
BEGIN TRANSACTION

Debit Object A
Credit Object B

COMMIT
```

works as one global transaction.

It doesn't.

You need to design the cross-object protocol.

Depending on the use case, options include:

- Put both pieces of state inside one transactional boundary.
- Use a transaction coordinator or a carefully designed reservation protocol.
- Use a saga with compensating operations.
- Model transfers using an append-only ledger and reconciliation.
- Accept eventual consistency where the business domain allows it.

And here's something worth emphasizing.

A CRDT is not a universal answer to this problem.

A CRDT is useful for specific classes of mergeable replicated state.

A financial transfer requires stronger business invariants than merely merging two replicas.

The right design depends on what consistency guarantees the application actually needs.

---

## 12. The Most Dangerous Failure: The Database Committed, but the Client Never Found Out

![image.png](/assets/img/posts/cloudflare-durable-objects/image-9.png)

---

## 13. What Happens When the Durable Object Crashes?

![image.png](/assets/img/posts/cloudflare-durable-objects/image-10.png)

Let's say your object is processing messages.

You keep pending messages inside a JavaScript array.

```
this.pendingMessages = [];
```

It works fine.

Until the instance is restarted.

That memory is gone.

Durable Objects can be restarted because of deployments, eviction, infrastructure failures, and other lifecycle events.

So ask yourself:

What state must survive?

If the answer is "we cannot lose it," then it should not exist only in class fields.

Persist it.

There is no reliable shutdown hook you can depend on to flush all your in-memory work just before the instance disappears.

For deferred operations, Cloudflare Durable Object alarms can wake an object for scheduled work.

But alarms require idempotent handlers because execution is at least once and retries are finite.

You need durable progress markers and a recovery strategy for unfinished work.

### And what about failover?

A host failure or network partition can temporarily interrupt availability.

Cloudflare's published SRS design describes a mechanism by which followers can fence an unreachable instance from confirming further writes before replacement authority takes over.

That matters because simply running a second copy isn't sufficient.

You must prevent two independent instances from both believing they can commit authoritative state.

That's the classic split-brain problem.

The important production takeaway is that failover must preserve a single committing authority, even if availability is temporarily interrupted.

---

## 14. The Performance Problems You'll Actually See in Production

### Problem A: CPU-heavy work blocks unrelated requests within the same object

![image.png](/assets/img/posts/cloudflare-durable-objects/image-11.png)

### Problem B: Requests arrive faster than they can be processed

![image.png](/assets/img/posts/cloudflare-durable-objects/image-12.png)

### Problem C: Retry storms make outages worse

![image.png](/assets/img/posts/cloudflare-durable-objects/image-13.png)

### Problem D: Geographic placement isn't magic

![image.png](/assets/img/posts/cloudflare-durable-objects/image-14.png)

---

## 15. When Should a Backend Engineer Actually Use Durable Objects?

Durable Objects are especially attractive when your application's natural partitioning unit also corresponds to a natural consistency boundary.

| Use case | Why it fits |
| --- | --- |
| Collaborative documents | One logical coordinator for document changes and versions |
| Chat rooms | Centralized room state and connection management |
| Multiplayer matches | Authoritative match state and command ordering |
| Per-tenant rate limiting | Counters and rules scoped to one tenant |
| Shopping carts | Consistent cart-level mutations |
| Real-time sessions | Stateful coordination with WebSocket support |

But not everything belongs inside one.

If you're building a giant analytical system, you probably don't want to scan millions of Durable Objects to answer every reporting query.

An analytics pipeline or separate reporting store may be a better choice.

If your workload is naturally stateless, ordinary Workers may be enough.

If all you need is one atomic operation in an existing database, you may not need Durable Objects at all.

And if your primary operation spans several independent consistency boundaries, you still need distributed systems design.

### Five questions before choosing your object identity

1. **What state must be strongly coordinated?** Identify the exact business invariant.
2. **Can the work be partitioned naturally?** Rooms, documents, matches, accounts, or tenants?
3. **What's the hottest possible object?** Estimate the worst case, not the average case.
4. **What happens if the instance disappears halfway through an operation?** Define persistence, recovery, and idempotency.
5. **Does the workflow need to modify multiple objects or external services atomically?** If yes, a single-object transaction isn't enough.

---