---
title: Load Balancing Layer 4 vs Layer 7
author: harshityadav95
date: 2022-06-06 00:00:00 +0530
categories: [Networking & Communication]
tags: [Web Development, Network]
---


![harshityadav95](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Load%20Balancing%20Layer%204%20vs%20Layer%207/Untitled.png)

## What is Load Balancing

Load balancing is the process of balancing incoming requests to multiple machines, process or services in the backend 

## Layer 4 vs Layer 7

![harshityadav95](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Load%20Balancing%20Layer%204%20vs%20Layer%207/Untitled%201.png)

to get started start thinking let's work on this understanding

- Layer 3+ Layer 4 almost work together and intertwined
- Layer 3 and 4 is where TCP/UDP or IPV4 or IPv6 takes place
- Layer 7 is where the HTTP , SMTP , FTP , Headers , Cookies are

![harshityadav95](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Load%20Balancing%20Layer%204%20vs%20Layer%207/Untitled%202.png)

- Load Balancer can be a dedicated machine or virtual machine or software  on a desktop

## Layer 4 Load Balancer

![harshityadav95](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Load%20Balancing%20Layer%204%20vs%20Layer%207/Untitled%203.png)

In Layer 4 load balancer we know only the IP address or the port number so that is the only data visible to us, we don't know the data only the certain segments are visible to us

- the data might be encrypted or scrambled so cannot read the data at this layer
- It makes decision made on the algorithm such as round-robin or list connection etc to select the target machine it want to select for forwarding
- It keeps a Network Address Translation it keeps a table to keep the record of which server it sent the data too
- The Client only interacts with the server in front and not the machine the request is balanced to. (reverse proxy)
- So the Machine at the end does not know the incoming address of the client and the client does not know the actual machine that is processing/handling the  request

## Layer 4 Proxy Pros and Cons

### Pros

- Simple Load balancing
- Efficient (no data lookup)
- More Secure (Does not decrypt the data and read the data)
- One TCP Connection (between the destination and the source)
- Use NAT (stateful)

Cons

- No Smart Load balancing (cannot re-write URL, cookies, etc)
- **Not Applicable for Microservices** as these forward service requests based on the path as /auth will take to other server /setting will go to other server or backend
- *Sticky per segment (if a large request is coming all the requests has to be sent to the same server destination and cannot send part of the packet segment to one server) Once a connection is established, it goes to one server at the backend. All packets flowing to this connection go to one server. The next connection will then pick another server based on the algorithm.
- No Caching since cannot cache it
- Maintains only one connection between client and server NATed so your load balancer can serve a maximum number of TCP connections = to (number of servers * max connections per server)

## Layer 7 Load Balancer

![harshityadav95](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Load%20Balancing%20Layer%204%20vs%20Layer%207/Untitled%204.png)

- Can decrypt the data and use it to make the decision to forward the data
- Same Reverse Proxy concept to hide the backend
- Client ←→ Connection to balanced (Ingres) ←→ connection to the backend
- Two connections are used the client handshakes with the balanced and the balancer establishes a connection with the backend to communicate

### Pros

- Smart Load Balancing
- Caching if /about is asked more that can be cached
- Great for Microservice

Cons

- More expensive
- Requires decrypting
- In terms of security, you have to share your certificate with the load balancers. If an attacker gets access to the load balancer, they automatically have access to all your data.
- Its proxy creates multiple connections—client, to proxy/proxy server—so you are bounded by the max TCP connection on your load balancer.


### Reference :

- Video [https://youtu.be/aKMLgFVxZYk](https://youtu.be/aKMLgFVxZYk)
- [https://www.resonatenetworks.com/2020/04/29/layer-4-vs-layer-7-load-balancing/](https://www.resonatenetworks.com/2020/04/29/layer-4-vs-layer-7-load-balancing/)
- [https://medium.com/@harishramkumar/difference-between-layer-4-vs-layer-7-load-balancing-57464e29ed9f](https://medium.com/@harishramkumar/difference-between-layer-4-vs-layer-7-load-balancing-57464e29ed9f)
- [https://freeloadbalancer.com/load-balancing-layer-4-and-layer-7/](https://freeloadbalancer.com/load-balancing-layer-4-and-layer-7/)
- [https://www.snapt.net/glossary/layer-4-vs-layer-7-load-balancing-explained](https://www.snapt.net/glossary/layer-4-vs-layer-7-load-balancing-explained)
