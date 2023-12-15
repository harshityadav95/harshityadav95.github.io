---
title: Notes Azure Front Door
author: harshityadav95
date: 2023-08-04 00:00:00 +0530
categories: [Software Development]
tags: [Azure, AzureFrontDoor]

---

![harshityadav95](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/236809a6-a602-4266-93a2-1543431cd0b3)


> Navigating Azure Front Door : [https://learn.microsoft.com/en-us/azure/frontdoor/](https://learn.microsoft.com/en-us/azure/frontdoor/)
> 

## ****What is the difference between Azure Front Door and Azure Application Gateway?****

- Azure Front Door and Azure Application Gateway are both load balancers for HTTP/HTTPS traffic, but they have different scopes.
- **Front Door is a global servic**e that can distribute requests across regions, while Application Gateway is a regional service that can balance requests within a region.
- Azure Front Door works with scale units, clusters, or stamp units, while Azure Application Gateway works with VMs, containers, or other resources in the same scale unit.

also …..

### Q. ****When should I deploy an Application Gateway behind Front Door?****

### Q. ****Can I deploy Azure Load Balancer behind the Front Door?****

> [https://learn.microsoft.com/en-us/azure/frontdoor/front-door-faq#what-is-the-difference-between-azure-front-door-and-azure-application-gateway-](https://learn.microsoft.com/en-us/azure/frontdoor/front-door-faq#what-is-the-difference-between-azure-front-door-and-azure-application-gateway-)
> 

# Advantages

### Layer 7 Load Balancing

- A Layer 7 load balancer is a network device that distributes traffic based on the content of the messages, such as the URL, cookie, or header.
- It can make smart routing decisions and apply optimizations or transformations to the traffic, such as compression, encryption, or caching.
- It also uses buffering to offload slow connections from the servers, which improves performance.

### Faster Failover

Faster failover in load balancing is a feature that allows the load balancer to quickly detect and redirect traffic from a failed or unhealthy server to a healthy one

- Faster failover can be achieved by using various methods, such as:
    - Active health checks: The load balancer periodically sends requests to the servers and monitors their responses
    - Passive health checks: The load balancer analyzes the traffic from the servers and detects any errors or anomalies.
    - Feedback loops: The load balancer receives feedback from the servers or other components about their status and performance

### Dynamic Site Acceleration (DSA)

Dynamic Site Acceleration (DSA) is a technique used to improve the performance and responsiveness of websites, especially for users located far from the origin server.

- Optimizing the connection between the user and the server, by using techniques like TCP multiplexing, HTTP keep-alive, and SSL offloading.
- Prefetching and caching some parts of the dynamic content, such as images, scripts, or stylesheets, that are common across different pages or users.
- Compressing and minifying the dynamic content to reduce its size and bandwidth consumption
- Routing the dynamic content through the optimal network path, by using techniques like route optimization, edge computing, and anycast.

### TLS/ SSL offloading

- TSL/SSL offloading is a technique that reduces the processing load on the web server by delegating the encryption and decryption of the traffic to another device, such as a load balancer or a proxy. This way, the web server can focus on its main tasks and improve its performance and resource utilization
- TSL/SSL offloading can also enable additional features, such as traffic inspection, malware detection, or protocol enhancement

## Firewall + DDoS protection

- It is a stateful firewall that can filter traffic based on rules, protocols, ports, and IP addresses.
    - A stateful firewall is a kind of firewall that keeps track of and monitors the state of active network connections while analyzing incoming traffic and looking for potential threats
- It also supports threat intelligence, TLS inspection, and intrusion detection and prevention.

### Cookie-based affinity

- Cookie-based affinity is a feature that allows a load balancer to direct subsequent traffic from a user session to the same server for processing.
- It works by setting a cookie in the user’s browser that contains a hash value of the server’s identifier. The load balancer can then read the cookie and route the traffic to the same server.
- [This feature is useful when the session state is saved locally on the server and needs to be maintained for the user session](https://learn.microsoft.com/en-us/azure/application-gateway/how-to-troubleshoot-application-gateway-session-affinity-issues)

### Caching

- Caching in Azure Front Door can be configured on a per-route basis, by enabling caching and specifying the query string caching behavior.
- You can also enable compression for Front Door to compress the responses to the client. Caching in Azure Front Door relies on the HTTP headers of the origin responses, such as Cache-Control, Expires, **and ETag**, to determine the caching behavior and validity of the content.

## Reference :

- [https://learn.microsoft.com/en-us/azure/frontdoor/front-door-overview](https://learn.microsoft.com/en-us/azure/frontdoor/front-door-overview)
