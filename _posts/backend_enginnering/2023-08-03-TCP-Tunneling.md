---
title: TCP Tunneling
author: harshityadav95
date: 2023-08-03 00:00:00 +0530
categories: [Backend Engineering]
tags: [Backend Development, Networking]

---

{% include embed/youtube.html id='iR4jLbG9KXw' %}

- Tunneling is the process of converting protocol A to protocol B usually protocol one of the protocols is blocked or unavailable

### TCP Connection

![image](/assets/img/posts/2023-08-03-TCP-Tunneling/2e6980ea-a609-4d1a-89aa-34a18c8be888.png)


- Client C1 wants to connect to System S1, IP address with an open port on 22
- To establish a bi-directional connection
- We add the frames to date with info on the source, client, port of receiver, and port from the receiver and send it to the client and server processes the request and sends back the data response in the similar format

### TCP Tunneling

- We want to reach the destination that is blocked from the client, it can be blocked by a firewall or internal network
- we can establish a standard tcp connection on port 22 , but instead of sending the data we send another TCP packet inside the data
  
![image](/assets/img/posts/2023-08-03-TCP-Tunneling/67bfcc3b-cd95-4e69-9198-2a2668ebfeeb.png)


- If we send the data its completely legitimate but inside the data we are sending another request that no one else can see since the data itself is another data packet with encryption, so the firewall allows this packet to smuggle another packet to go through

![image](/assets/img/posts/2023-08-03-TCP-Tunneling/ea4560a4-f113-4abd-b55e-99c6ecc7ac3e.png)


- The S2 has no idea the packet is coming from S1 and for it receiving as it is coming from C1

![image](/assets/img/posts/2023-08-03-TCP-Tunneling/d355b3b4-501c-4c8c-95ce-1a4568b55afc.png)


- The identity of S1 remains unknown, when the response is received the data response is smuggled again and the packet is sent over

![image](/assets/img/posts/2023-08-03-TCP-Tunneling/b6b86565-d76f-4a51-8e62-ea0a7dd0a2a4.png)


- The Client received the data response as  intended as if it was receiving the response from S2
- There are a lot of TCP connections going

## Applications

- By bypassing the firewall on blocked ports, the firewall can see the TCP port and cannot see the data and the port number being smuggled into the pocket
![image](/assets/img/posts/2023-08-03-TCP-Tunneling/3c5bf05b-ed9c-4985-98d0-af4a955ea972.png)


- Solution Local port forwarding tunnel

![image](/assets/img/posts/2023-08-03-TCP-Tunneling/8e2483e4-f35e-4477-8ff1-6fd8c68e3286.png)


- Internal IP problem: local IP cannot be accessed from outside the network

![image](/assets/img/posts/2023-08-03-TCP-Tunneling/22ecc26b-16f7-4977-a847-6f76cfc6f785.png)


- Solution: Reverse Port Forwarding Tunnel

![image](/assets/img/posts/2023-08-03-TCP-Tunneling/be6afd2a-f3a1-4067-bd0e-79e2e508a889.png)


- Blocked Website

![image](/assets/img/posts/2023-08-03-TCP-Tunneling/92ec973c-527b-4a05-8738-aa87ade90e3f.png)


- SOCKS proxy (dynamic port) tunneling, we create a proxy on a machine and make all the requests coming from our machine go through that proxy (Used by Fiddler for HTTP proxy debugging) all our traffic goes through the proxy and captures it
- We make a request to Server 1 and [localhost](http://localhost) 8080 to smuggle the requests, all the traffic goes through it (similar to VPN) , ISP is not aware of it

![image](/assets/img/posts/2023-08-03-TCP-Tunneling/ff490ee1-a2e5-4d06-95af-a0a36144d1b8.png)


## Pros and Cons
![image](/assets/img/posts/2023-08-03-TCP-Tunneling/222ea9dd-7997-43bc-b900-eba851c4f883.png)
