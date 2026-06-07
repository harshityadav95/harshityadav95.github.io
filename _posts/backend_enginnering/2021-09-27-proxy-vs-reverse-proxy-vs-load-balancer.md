---
title: "Proxy vs Reverse Proxy vs Load Balancer"
author: harshityadav95
date: 2021-09-27 00:00:00 +0530
categories: [Backend Engineering]
tags: [proxy, reverse-proxy, load-balancer, network]
---

## Proxy vs Reverse Proxy vs Load Balancer

## TLDR;

**The position of a proxy — is what makes a proxy either a forward or reverse proxy.**The easiest way to remember the difference between these two proxy is -

A proxy can be described as a person who acts behalf another person to fulfil some purpose. In computer science context, a proxy also can be defined as a computer who acts behalf as another for making some communication.

- The proxy server can intercepts requests and act as serves back responses; it may forward the requests only or may modify it.

There are two kinds of proxies,

- forward proxy
- reverse proxy.

## **Forward Proxy**

- A forward proxy is one who acts as a different requestor, so this proxy encapsulates the original identity of the requestor.
- Forward proxy can be used by the client to bypass restrictions in purpose to visit websites that are blocked by government, company or etc.
- Another usage of forward proxy is it can also act as a cache server.
- If the content is downloading multiple times, the proxy can cache the content on the server so when next time someone is downloading the same content, the proxy will send the content that is previously stored.

If you have multiple machines in an internal network and you like to access the internet safely, then all these machines will go through a proxy. So all the external sites are requested by a proxy and once the proxy gets the response it will send the response to the right client. The proxy can be the point of control for all the requests. This proxy is called a forward proxy.

![Medium article image](/assets/img/posts/proxy-vs-reverse-proxy-vs-load-balancer/medium-image-55caf43fdac3.png)

## Proxy Server vs. VPN

On the surface, proxy servers and virtual private networks (VPNs) may seem interchangeable because they both route requests and responses through an external server. Both also allow you to access websites that would otherwise block the country you’re physically located in. However, VPNs provide better protection against hackers because they encrypt all traffic.

## **Reverse Proxy**

- A reverse proxy does the opposite of what a forward proxy does.
- A reverse proxy acts on behalf of servers that respond to the client request. Forward proxies can hide the identities of clients whereas reverse proxies can hide the identities of servers.

Reverse proxies have some use cases, like:

- Load balancing: distribute traffic to several servers
- Cache static content: offload the web servers by caching static content
- Compression: compress and optimize content to speed up load time

Similarly if a external user wants to access a server inside the network, then there can be a proxy server which will receive requests from the external client and then proxy the request to the server. This proxy can also be used as the single point of control and it can also be used for load balancing requests to a group of servers. This is called a reverse proxy.

![Medium article image](/assets/img/posts/proxy-vs-reverse-proxy-vs-load-balancer/medium-image-e57dddf8d3e4.png)

## **Reference :**

- [https://medium.com/@rzkmak/forward-vs-reverse-proxy-f97729cdb86e](https://medium.com/@rzkmak/forward-vs-reverse-proxy-f97729cdb86e)
- [https://medium.com/@thisisananth/forward-proxy-vs-reverse-proxy-487f850aab91](https://medium.com/@thisisananth/forward-proxy-vs-reverse-proxy-487f850aab91)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/proxy-vs-reverse-proxy-vs-load-balancer-e6792690f13c)
