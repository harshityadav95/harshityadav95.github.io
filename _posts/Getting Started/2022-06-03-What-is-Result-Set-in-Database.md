---
title: What is Result Set in Database ?
author: Harshit Yadav
date: 2022-06-03 00:00:00 +0530
categories: [Database Engineering]
tags: [Backend Development, Database]

---


```java
The SQL statements that read data from a database query, return the data in a result set.
```

## Overview

Consider a situation that there are 12 million  records of students in a database , if we implement a query to retrieve the students with marks between 90 and 100 ;

```java
select count(*) from grades where grades between 90 and 100;
```

the result is small with the just the count the value is still probably in millions at max , but if we run the query to return the ID of students with the marks matching the criteria 

```java
select ID  from grades where grades between 90 and 100;
```

when we execute the following query the database is doing a lot for in the background (to create the execution plan first find out which index to use , and then do the actual fetching )

1. first finding those records which match the condition and then return record to the output machine in case of client server machine 
2. using the TCP Protocol (Depends on database) to send back
3.  Wait for all the result to come back and store in memory all the result 

So Imagine running a query that return millions of records ? how to handle and receive and store the results being sent by the database 

Solution to this : Database Cursors (Server Side Cursor , Yes there are server side cursors also)

## What are Database Cursor ?

- We create database on the cursor telling them that we are about to fetch the result of the query but do not give the result right now  , just create a cursor for now
- We will then ask the cursor for the results , and when that happens , follow the query execution plan and index scan , bit scan and fetch the results and return the results i asked for

## Getting Started with Cursors

- Cursors have to work with “ Transactions”

```sql
postgres=#begin;
BEGIN
postgres=#declare c cursor for select * id from grades where g between 90 and 100;
DECLARE CURSOR

```

- When we execute that the query did not actually get executed it just created a plan
- Now to execute the cursor

```sql
 postgres=#fetch c;
```

- Now with each execution of the cursor “C “ will return exactly 1 row from the result

```sql
id
-
12
1(row)
```

- we can keep running the query again and again and the result will keep coming
- If we want the last record from the result we can run command

```sql
postgres=#fetch last c;
```

## Advantages of CURSOR ?

- **Saves Memory** on  client side (ie open a cursor and then process and results at the pace the backend can receive or transmit ie like process the first 100 and then discard them and fetch the next 100 )

eg : for sorting 1 billion rows, if they are coming from db to the application instead of working on it at once , as the data is coming take a batch of it at a time and process and clear of the memory and then receive more data 

- **Streaming** as we pull in rows to a socket connection or grpc connection continue pulling values .If you are going to access only some of the data in the result set, or access the data just a few times, a server-side cursor minimizes network traffic
- **Easy to Cancel** cursors are easy to cancel as when we run a query , in case we requested 1 million rows but want to stop after 100 queries cursor makes it easy to cancel .
- **Paging** , not easy to page application with cursor
- **PL/SQL** can be used to use cursors
- **Positioned updates** Server-side cursors support direct positioned updates, whereas ODBC simulates positioned cursor updates by generating an SQL search and update statement. Direct positioned updates are not only faster, they avoid the risk of unintended update collisions.
- **Additional cursor types** With server-side cursors, both keyset and dynamic cursors are available.

## Cons of Cursor

- **Stateful :** It means there is memory allocated for it in the database . and there is a corresponding transaction pointing to that cursor , if made request to another server that does not know that the cursor exists , cannot share cursor (property of transaction)
- **Long Transactions** : If we have to iterate through a cursor we have to do it via transaction , and transaction runs for long times , and if transactions are running on database cannot do DDL or index on the database at that time , even certain write operations can be stopped if transaction has acquired some shared lock

## **Client-Side Cursors Versus Server-Side Cursors**

- Every cursor uses temporary resources to hold its data
- These resources can be memory, a disk paging file, temporary disk files, or even temporary storage in the database.
- The cursor is called a client-side cursor when these resources are located on the client machine
- The cursor is called a server-side cursor when these resources are located on the server machine.

## Client Side Cursor

With a non-keyset client-side cursor, the server sends the entire result set across the network to the client machine. The client machine provides and manages the temporary resources needed by the cursor and result set. The client-side application can browse through the entire result set to determine which rows it requires.

 Static and keyset-driven client-side cursors may place a significant load on your workstation if they include too many rows. While all of the cursor libraries are capable of building cursors with thousands of rows, applications designed to fetch such large rowsets may perform poorly , There are exceptions, of course. For some applications, a large client-side cursor may be perfectly appropriate and performance may not be an issue.

One obvious benefit of the client-side cursor is quick response. After the result set has been downloaded to the client machine, browsing through the rows is very fast. Your application is generally more scalable with client-side cursors because the cursor's resource requirements are placed on each separate client and not on the server.

## **Server-Side Cursors**

With a server-side cursor, the server manages the result set using resources provided by the server machine. The server-side cursor returns only the requested data over the network. This type of cursor can sometimes provide better performance than the client-side cursor, especially in situations where excessive network traffic is a problem.

Server-side cursors also permit more than one operation on the connection. That is, once you create the cursor, you can use the same connection to make changes to the rows — without having to establish an additional connection to handle the underlying update queries.

However, it's important to point out that a server-side cursor is — at least temporarily — consuming precious server resources for every active client. You must plan accordingly to ensure that your server hardware is capable of managing all of the server-side cursors requested by active clients. Also, a server-side cursor can be  slow because it provides only single row access — there is no batch cursor available.

Server-side cursors are useful when inserting, updating, or deleting records. With server-side cursors, you can have multiple active statements on the same connection. With SQL Server, you can have pending results in multiple statement handles.

## Reference

- [https://youtu.be/C1Y6P6vDFts](https://youtu.be/C1Y6P6vDFts)

- [Client Side vs Server Side Cursors](https://knowledgebase.progress.com/articles/Article/6343#:~:text=Client-Side)
