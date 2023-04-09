---
title: DNS Domain Name Server Notes
author: Harshit Yadav
date: 2023-01-03 00:00:00 +0530
categories: [Networking & Communication]
tags: [Web Development, Network]

---

# DNS Domain Name Server: Note

{% include embed/youtube.html id='UVR9lhUGAyU' %}

## DNS Resolver Providers

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/DNS%20Domain%20Name%20Server%20Note/Untitled%201.png)

## What is Software that makes DNS Server work

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/DNS%20Domain%20Name%20Server%20Note/Untitled%202.png)

- [Bind V9](https://www.isc.org/bind/)
- [NDS](https://www.nlnetlabs.nl/projects/nsd/about/)
- [KNOTS DNS](https://www.knot-dns.cz/)

## Why only 13 root DNS servers ?

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/DNS%20Domain%20Name%20Server%20Note/Untitled%203.png)

- A common misconception is that there are only 13 root servers in the world.
- In reality, there are many more, but still only 13 IP addresses used to query the different root server networks.
- Each has associated with it an IP address (and shortly some will have more than one as IPv6 is further rolled out)
- There are 13 logical root name servers specified, with logical names in the form [letter.root-servers.net](http://letter.root-servers.net/), where the letter ranges from a to m.
- which specifies a maximum packet size of 512 bytes when using the User Datagram Protocol (UDP).
- Technically, however, fourteen name servers fit into an IPv4 packet.
- The addition of IPv6 addresses for the root name servers requires more than 512 bytes, which is facilitated by the EDNS0 extension to the DNS standard.

## Types of DNS Servers

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/DNS%20Domain%20Name%20Server%20Note/Untitled%204.png)

- **Recursive server**
- **Root name server**
- **TLD serve**
- **Authoritative name server**

Reference : [types of dns servers](https://www.notion.so/The-Benefits-of-the-3-Tier-Architecture-e-g-REST-API-8bc6a4efdbd44c6e89b3dccde1c49157)

## DNS Query Flow

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/DNS%20Domain%20Name%20Server%20Note/Untitled%205.png)

The diagram below illustrates how DNS lookup works under the hood:

1. [harshityadav.in](http://harshityadav.in/) is typed into the browser, and the browser sends the domain name to the DNS resolver.
2. The resolver queries a DNS root name server.
3. The root server responds to the resolver with the address of a TLD DNS server. In this case, it is .in.
4. The resolver then makes a request to the .in TLD.
5. The TLD server responds with the IP address of the domain’s name server, [harshityadav.in](http://harshityadav.in/) (authoritative name server).
6. The DNS resolver sends a query to the domain’s nameserver.
7. The IP address for harshityadav.in is then returned to the resolver from the nameserver.
8. The DNS resolver responds to the web browser with the IP address (142.251.46.238) of the domain requested initially.

DNS lookups on average take between 20-120 milliseconds to complete (according to YSlow).

## DNS Caching

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/DNS%20Domain%20Name%20Server%20Note/Untitled%206.png)

## DNS by Cloud Providers

- Azure : Azure DNS >> Azure Private DNS >> Azure DNS Private Resolver
- Google: Cloud DNS
- Amazon:  Amazon Route 53

## DNS over HTTPS (DOH) :

- DNS maps a domain name to an IP address, which is done by sending a UDP packet to the DNS resolver on port 53
- The data is sent un-encrypted and ISP can snoop in
- DNS over HTTPS establishes a TLS connection with a DNS resolver to stop anyone from tracking
- DNS resolved have to decrypt to read the data hence ISP can monitor

Solution: Oblivious HTTPS over DNS  ODOH

- It adds a proxy layer in the middle so that the client interacts with proxy layer and the entire process is encrypted end to end

## Recap 

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/DNS%20Domain%20Name%20Server%20Note/Untitled.png)w

## Video Reference

{% include embed/youtube.html id='27r4Bzuj5NQ' %}

{% include embed/youtube.html id='tgWx81_NGcg' %}

{% include embed/youtube.html id='flnw78uhFkE' %}


## Reference :

- [https://www.cloudflare.com/learning/dns/glossary/dns-root-server/#:~:text=A common misconception is that,addresses in the root zone](https://www.cloudflare.com/learning/dns/glossary/dns-root-server/#:~:text=A%20common%20misconception%20is%20that,addresses%20in%20the%20root%20zone).
- [https://www.lifewire.com/dns-root-name-servers-3971336](https://www.lifewire.com/dns-root-name-servers-3971336)
- [https://www.icann.org/en/blogs/details/there-are-not-13-root-servers-15-11-2007-en](https://www.icann.org/en/blogs/details/there-are-not-13-root-servers-15-11-2007-en)
- [https://en.wikipedia.org/wiki/Root_name_server](https://en.wikipedia.org/wiki/Root_name_server)
- [https://www.iana.org/domains/root/servers](https://www.iana.org/domains/root/servers)
- [https://www.lifewire.com/what-is-a-dns-server-2625854](https://www.lifewire.com/what-is-a-dns-server-2625854)
- [https://blog.bytebytego.com/p/how-does-the-domain-name-system-dns](https://blog.bytebytego.com/p/how-does-the-domain-name-system-dns)
