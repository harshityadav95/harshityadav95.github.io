---
title: Redo, Undo, and Write Ahead Logs WAL in Database
author: harshityadav95
date: 2024-01-04 00:00:00 +0530
categories: [Backend Engineering]
tags: [Backend Development, Database]

---

{% include embed/youtube.html id='uHvR7nOu5m4' %}

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/314731f6-260d-492a-bb0d-a20095639d8a)


Database logs are a critical part of any database system to ensure 

- Durability
- Crash Recovery

There are different types of Logs such as Write ahead Logs WAL, Redo logs, Undo Logs, etc.

WAL is identical to Redo logs

If we think about the durability of the system the vital thing to think about is how do we persist the data in the DB, we know data is stored in tables which is in turn stored using data structures that are stored in the file system or even block system. How  we keep these files and implement saving of these files ie storing the index in one file or storing indexes in different files all depends upon the implementation 

When we start making changes or updating the data in the table it will start making changes in indexes, and indexes need to be updated, also the data exists in pages that live in memory and need to be committed 

## What does commit Operation in DB mean?

Whatever data is stored in the DB which lies on the page right now should persist and be available in the future with the same value. Whenever we change data the page (~6KB to 8 KB) is fetched in memory and edited or inserted in memory in the same page that exists in the memory and we keep writing it to it when the client tells us to commit we flush the data back to the drive with the changes.

If we have written a lot of data it will take a long time also to write the data back into the memory, the cost is not the writing time back to the disk but what if the database crash and the data is not written back successfully to the disk or is half-written, should follow and adhere to the ACID transaction (ACIDITY complete or non )

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/681502ed-9fea-4146-8714-0982bb3b98a8)

### Solution

As we are writing the changes we keep a journal/record, so when we are writing back the changes do not send just the single changed value or column for a few bytes  we send the entire page, the minimum page/block/sector (set by disk type)size that needs to be written back  

We keep a log of every change and write it to disk and keep it as a source of truth for all the changes and value changes in the database this is called (Write Ahead Log ie knowing ahead in time what is going to change when the page is going to be written ), now with help of these we can keep dirty pages in memory and before commit action, there is already a journal written on disk that has it recorded so in case the page commit is not successful we can replay the whole page write a scenario with data changes.

In case the commit is false the page with old persistent data can be loaded again by syncing the pages and the WAL log can be used to restore the state.  Now the thought process comes why not just read this from the journal and send the data in case the request came (well possible but not feasible to implement as it only has changed)

We can reconstruct the page with the WAL log and flush it and commit it back to disk again without failing 

- How often to Flush Data is configurable by DBA, there is an upper limit on WAL size before it can be purged and started over
- The purpose of WAL is to restore in case of DB flush fails and purged itself when it's successful
- There are both OS cache and DB cache in the picture (2 Layers of cache in Postgresql)
- Flushing of Pages is called Checkpointing and is random since it is IO and data Intensive and costly as things need to be paused when this is happening as WAL cannot grow when we are purging it
- This Checkpoint can be happening at the most transaction-heavy moments and high resource usage times but are to be done and not much can be done about it
- Glossary: Fsync, WAL parameters

We also don't write back the page back to disk, we keep it back in memory anticipating more writes so the more writes a single page receives the better it will be since no new fetching or different page is being fetched from disk

## Fsync

It is disabled by default  the changes go to the cache but if it enables all and every single change to be sent to the disk, makes it a write-through cache, and no WAL used so in case of a crash hard to recover 

## Undo Log

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/849f1584-6bd4-4aed-8dab-ff48ec394e1c)


Not every database has it, Postgresql does not have it. It gives the state of the transaction before the change started like another transaction needed the state before we changed it (Oracle and MYSQL have this model, Postgres does not have it since it uses versioning ie when an update happens a new row lies on top of the older row and the old data is present in page) so in  this model, if someone needs older value we read this log and undo the changes on the value to see the older state (more work to see older transaction) all this on a transaction that is not committed 

## Redo Log / WAL

Is the opposite of Undo Log, it contains the newer  state to be restored in case of commit failure 

Why do we have to undo it if we have to redo it?  Answer because it does not store which transaction did what change on the value so traveling back to a certain transaction is not possible 

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/e1a8fcd9-578c-458f-ac8e-028b77b30e66)



  
