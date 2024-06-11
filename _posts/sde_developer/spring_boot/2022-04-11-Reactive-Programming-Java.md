---
title: Reactive Programming Java
author: harshityadav95
date: 2022-04-11 00:00:00 +0530
categories: [Java]
tags: [SpringBoot, webdevelopment]

---

{% include embed/youtube.html id='A5nCPqPH3Fc' %}

What? Why? When? Advantages? 

## Core Feature of Reactive Programming

1.  New Programming Paradigm
2. Asynchronous and non blocking
3. Functional Style code
4. Data Flow as an Event-driven stream
5. Backpressure on data streams

## Recap

### Synchronous and Blocking

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/8f0cebaa-8ea1-4bb9-9d64-292175a93c78)


- The restaurant is blocked until  the cook completes one dish only then the restaurant takes another order

## Asynchronous and Non-Blocking

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/5e1ba5c3-a978-4247-b3a6-adbf0b3f220f)


## Thread per Request model: Traditional REST API

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/4449b751-e762-4c3e-9ceb-01b02d0484e0)


- One request one per thread, limited by the thread pool
- if more requests come have to wait until more threads are available to start the task
- reactive programming came into the picture
- Horizontal scaling is needed to add more threads
- By default, Tomcat sets maxThreads to 200, which represents the maximum number of threads allowed to run at any given time.

## Reactive Programming

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/cb3d6d88-057b-40bc-939e-700139696d2f)


- The request comes to application and is assigned to thread 1
- Thread one comes to fetch the value from the database to get the
- The advantage here is it will not wait for the database to respond back to the result, it will inform the database the thread is not waiting
- Whenever the database job is complete and the response is ready, then send that response to the available thread and publish the previous thread a complete event
- In this case, the thread pool and threads are free and accept more events as no thread is blocked in the event loop.
- With this approach, lots of concurrent requests can be handled with significantly fewer threads, which is asynchronous and non-blocking

## Functional Style code Vs Rest Code

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/6141869e-ab81-44bc-824a-3f0ec16b6784)

- The syntax is similar to JAVA 8 Stream API

## Data Flow and Event-Driven Stream

### REST Approach

- The client sends the request to the application, the request then goes to the database to process the data, and finally, the request is sent back to the client
- WHAT IF? If there are few records inserted or updated in the middle, then the client will not have the updated value, to get the information the client has to again do a separate REST API call

### Reactive Programming

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/b16edad0-a058-41e7-b4c8-2d4bd64af3bc)


- If there is any change in the database it will immediately publish an event that there is an update in the data, now whoever subscribed to the data will update the data
- Subscriber: Client
- Publisher: Database client
- The connection will be always in the open state

Ex : Cricket Live score update 

## Backpressure on Data Streams

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/0a069ddb-de55-4e1f-8ac6-d8cfb4d78f4a)


### Traditional API

- If one has to get all the items from the inventory
- The application sends the request to the database
- Database send requests as a large volume of data
- The Application might now be able to handle a large volume of data and crash with a memory error
- No Back pressure feature available with traditional API

### Reactive Programming

- There is this feature of backpressure if the database is sending large amount of data and the application cannot handle it
- WE can tell database to slow down the response until processing is done by the application before accepting more data (🤔 Cursor in DB ?)
- implemented by adding a limitation on the database driver configuration  on how much data can be expected by slowing down the database driver to slow down the data coming

## Advantages of Reactive Programming

- Achieve proper CPU utilization
- No Application downtime
- The flow of execution can be concurrent since code is asynchronous and nonblocking
- Streaming database publisher and subscriber model

## Reference :

- [https://youtu.be/A5nCPqPH3Fc](https://youtu.be/A5nCPqPH3Fc)
- [https://youtu.be/EExlnnq5Grs](https://youtu.be/EExlnnq5Grs)

