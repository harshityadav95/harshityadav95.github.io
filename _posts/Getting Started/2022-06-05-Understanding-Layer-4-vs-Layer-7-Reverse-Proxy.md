---
title: Understanding Layer 4 vs Layer 7 Reverse Proxy
author: Harshit Yadav
date: 2022-06-05 00:00:00 +0530
categories: [Networking & Communication]
tags: [Web Development, Network]
---

## Proxy vs Reverse Proxy

![](https://github.com/harshityadav95/staticfiles/blob/main/Understanding%20Layer%204%20vs%20Layer%207%20Reverse%20Proxy/Untitled.png?raw=true)

## Layer 7 Proxying

![](https://github.com/harshityadav95/staticfiles/blob/main/Understanding%20Layer%204%20vs%20Layer%207%20Reverse%20Proxy/Untitled%201.png?raw=true)

Consider the scenario

- There is a client that wants to connect to Server H1
- The client establishes a TCP connection to the server and completes the Handshake
- The client sends the git request /employee to list  all the names of the employee working in a company
- The total request we send is divided into 3 packets which are sent to the server
- The Server the 3 Packets and acknowledges receiving the 3 packets
- Only After the Server has received all the 3 packets it will consider the complete request as received since 1 request (in our case 3 packets all 3 have to reach the server to receiver complete request)
- Since the balancing is L7 the balancing server will be read by the server to read and decide which server to forward the request to
- Now after reading the data it will know the which server to hit in the backend
- Consider the H1 server implementing Round Robin Algorithm (next time it can send it to H2 it can do this since HTTP is stateless)
- H1 will establish a TCP connection to S1 (some reverse proxy already have TCP request and does not create it upon receiving the packet and already have a connection pool in place)
- Now the server makes brand new 3 request packets and sends them to backend S1, then these 3 requests once received by S1 it will start working on it
- Meanwhile, all this process is happening the client is waiting due to Asynchronous not  blocked
- After the Backend S1 has finished processing the backend will send back the empty 2 packets (result response ) to the balancing server  H1 which will be again made brand new packets and sent to the client

## Layer 4 Proxying

![](https://github.com/harshityadav95/staticfiles/blob/main/Understanding%20Layer%204%20vs%20Layer%207%20Reverse%20Proxy/Untitled%202.png?raw=true)

Consider the following scenario

- The server sends the 3 packets to the balancing server H1
- The Server is implemented a round-robin algorithm and picks the S1 server, establishes a connection with the S1 server, and immediately keeps sending all the incoming packets coming from the client to the S1 backend server as soon as they arrive
- L4 Proxy does not open the packet** to read the data inside it whether it's/GET  request or a /Post request coming to the server, just blindly forwarding the packets based on the IP
- Since its Sticky as long as the client address is the same all the requests coming from the same client will be sent to the same server
- After processing the request the S1 returns the response in 2 packets which are being sent back to the load balancer H1, which same packets are being sent to the client
- L4 proxy can work irrespective of the underlying protocol

## TLS in Layer 4 Proxy** (1 of implementation)

![](https://github.com/harshityadav95/staticfiles/blob/main/Understanding%20Layer%204%20vs%20Layer%207%20Reverse%20Proxy/Untitled%203.png?raw=true)

Consider the following scenario

- The client sends the request to the H1 Server to establish a TCP connection
- Despite being Layer 4 Proxy the server needs to look at the packet to see the TCP connection type and establish a connection with the Backend H1
- As the Hello Packets are being received by the H1 they are being sent to S1 and the Hello packets response sent by S1 back to H1 are immediately sent back to the client
- So during the Handshake, the Client will know the key and the backend S1 will know the key but the H1 balancer in between will not know the key
- The Certificate is Sent by S1 and not the H1 balancer
- There are other implementations where the S1 does not have the TLS and H1 will have to terminate the connection

## Reference :

- Video [https://youtu.be/ylkAc9wmKhc](https://youtu.be/ylkAc9wmKhc)
