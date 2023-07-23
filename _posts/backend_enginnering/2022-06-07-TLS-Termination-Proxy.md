---
title: TLS Termination Proxy
author: harshityadav95
date: 2022-06-07 00:00:00 +0530
categories: [Networking & Communication]
tags: [Web Development, Network]
---


TLS or SSL  Termination proxy is a proxy that terminates the TLS session and sends the unencrypted traffic to the main server 

- This offloads the load of the task of decrypting the packet from the main server to the proxy server

TLS 1.2 Recap

![](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/TLS%20Termination%20Proxy/Untitled.png)

- The goal is to establish an HTTPS connection
- Before that, we establish a TCP connection
- Client Sends the Hello message telling which all security versions, and protocols it supports
- The server agrees to it and sends the public key back to the client
- The client will create the key and encrypt it with the server public key and send it across
- The Key has to be symmetric since it is faster and less costly

## TLS Termination Proxy

![](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/TLS%20Termination%20Proxy/Untitled%201.png)

- A proxy that is facing the client and the proxy will agree on the key and exchange encrypted traffic
- The Proxy could be a load balancer/service mesh proxy
- We can skip the proxy but we add it for better analytics, intrusion system, caching, etc
- We decrypt the data for better decision, load balancing (L7)
- Once we terminate the proxy we send the data to the backend server unencrypted

![](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/TLS%20Termination%20Proxy/Untitled%202.png)

## TLS Forward Proxy

![](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/TLS%20Termination%20Proxy/Untitled%203.png)

- To encrypt the traffic between proxy to backend we can encrypt it again
- We can negotiate another proxy session between proxy and backend
- This adds cost to the backend server for encryption
- The majority of clouds (Azure, AWS )use TLS forward proxy but we can keep it decrypted if the backend server is internal, etc

## TLS Termination Pros and Cons

### Pros

- Offloads crypt processing, faster for backend comparatively
- TLS close to the  client (in the case of TLS 1.2  does not matter in 1.3) (can be made geographically )
- Can Use HTTP Accelerator (Varnish), rewrite JS, compress, optimize
- Intrusion Detection system
- Load Balancing / Service Mesh

### Cons

- Limited by the max connection of Proxy (between client and balancer and balancer and backend), L4 does not have this problem, have to use multiple proxies or extra L4, or DNS load balancer, etc for management
- If Compromised all data is available

## Resource :

- Video [https://youtu.be/H0bkLsUe3no](https://youtu.be/H0bkLsUe3no)
