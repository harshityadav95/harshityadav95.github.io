---
title: What is SSL/TLS ?
author: harshityadav95
date: 2022-03-25 00:00:00 +0530
categories: [Backend Engineering]
tags: [Web Development, Network]

---


```sql
"SSL is the equivalent of arranging an armored car to deliver credit card information from someone living in a cardboard box to someone living on a park bench"
```

## Getting Started

Transport Layer Security, the successor of the now-deprecated Secure Sockets Layer, is a cryptographic protocol designed to provide communications security over a computer network.

So to clear up the difference between [SSL and TLS with ELI5 found this post on Hackernews](https://news.ycombinator.com/item?id=26561507)

> Could you please ELI5 the difference between SSL and TLS? My office is also moving to tlsTLS1.2 and the communication seemed to use both SSL and TLS interchangeably. The Windows registry has entrees for both SSL and TLS. I am confused. ?
> 

- There is no difference. SSL was invented by Netscape, when they brought it to IETF (Internet Engineering Task Force) to get standardized Microsoft did not want to use the name Netscape has advertised, so they forced a name change.
- Thus "SSL 3.1" (IETF update to SSL 3) was called "TLS 1.0". This was in 1999.
TLS 1.1 uses a version encoded in two bytes that should mean "SSL 3.2", TLS 1.2 uses bytes that should mean "SSL 3.3". TLS 1.3 pretends to be TLS 1.2 to pass through proxies but internally uses two bytes that should mean SSL 3.4 to indicate its version.
- **In short, *TECHNICALLY* the only thing that exists is TLS.**
- The implementation history is SSL 3.0 < TLS 1.0 ... 1.3

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Untitled.png)

However, SSL is still used colloquially in conversation, e.g. "SSL certificate" and in many legacy config flags For best clarity, check the details of all those settings, even the SSL ones. But TLS is the term for modern standards.

## Why do we need a Certificate?

[Video Explanation: What are SSL/TLS Certificates? Why do we need them? Work?](https://youtu.be/r1nJT63BFQ0)

- Suppose I want to visit ABC.XYZ and want to consume content from the server
- I will send the GET request to the server
- Since the request can be intercepted by anyone in the middle, therefore, we don't send the request in plain text therefore we encrypt it.

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Untitled%201.png)

There are two types of Encryption - Symmetric, and Asymmetric 

- So how do we  generate a key to lock the request data which when reaching the server, the server also has the key to unlock the requested data
- The first thought will be to send the key first before sending in the data but if we send the key first then if there is someone in the middle intercepting the message then the key will also be intercepted and used to unlock and read the message by the person in the middle
- Thus we came up with the idea of Public Key Encryption

### **Asymmetric Encryption**

- Public Key Encryption: Server has 2 Keys RED (Private)key and BLUE (public) key \
- If Public Key is used for Encryption the Private Key can Decrypt
- Can also use Private key to Encrypt and Public key to also Decrypt
- The Client will generate a new GREEN Key to use for Encryption and we need to send it to the server without being read in between by any middle man intercepting the traffic

### Key Exchange (OLD Method)

- The Client Says it wants to establish a connection with the server, so it sends a request to the server asking  “ want to establish connection “
- The Server will reply back here is my BLUE Key (Public Key)  take it
- Now we as clients will Encrypt the Green key with BLUE (Public Key of the Server) and send it to the server which can only be decrypted by the RED Private key of the Server
- From then on all the communication between client and server will be encrypted using the GREEN Key

![Screenshot 2022-03-17 at 7.42.37 PM.png](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Screenshot_2022-03-17_at_7.42.37_PM.png)

### Problems with Key Exchange (OLD Method)

- What if the message got intercepted in between and when we're asking the server for its public key by a Middleman called Thanos and he sends his public key pretending to be [youtube.com](https://youtube.com) server whose public key we wanted
- And we accept Thanos Public key and start communicating with it thinking of it as a youtube server
- So how to verify that the Server is Youtube one Thanos One ?, we need a certificate along with the response that we can verify is coming from the genuine Youtube Server and not the Thanos Server  (Answer Meet Certificate Authority)

### Where are HTTPS and HTTP in this Picture?

- Let's see we have a client-side server  (Port 443) and server (www.google.com) , set up a TCP Connection (Stateful) now to get data we create a TLS handshake to share data between client and server without anyone in the middle reading the data (sharing the same key across to exchange data)
- HTTPS is one of the many applications of SSL/TLS: when you interact with an HTTPS (S for ‘secure’) website like [https://harshityadav.in](https://harshityadav.in), it is SSL/TLS that secures the web-traffic (made of HTTP interactions) between your browser and the website.

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Untitled%202.png)

- Client Sends Data encrypted using the shared key and the server decrypts it using  the shared key
- The server then Sends back the data to the client again in encrypted form using the key which can be decrypted by the client

## How TLS Relates to TCP/IP Protocol Stack

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Untitled%203.png)

- As illustrated by the yellow box in the figure, it sits between application layer protocols such as HTTP, SMTP, FTP, NNTP, LDAP, and POP, and the transport protocol TCP. Sitting in the middle of the two layers, TLS secures application layer data transmitted over TCP. For instance, in HTTPS, TLS secures HTTP traffic transmitted over TCP.
- DTLS — a sibling of TLS — is to UDP what TLS is to TCP.

## Message Flow in Full Handshake Protocol

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Untitled%204.png)

[Video Explanation : Youtube](https://youtu.be/64geP_LAZ5U)

### What is Certificate Authority?

Video Explanation: [Certificates and Certificate Authority Explained](https://www.youtube.com/watch?v=x_I6Qc35PuQ)

- How as a client to make sure that you are actually communicating and connecting to the original [www.google.com](https://www.google.com) server instead of someone acting as a google server by intercepting the request in the middle and pretending to be google and sniffing through your data and giving the results it fetches from google by establishing a connection with google.com
- (You ←——> Thanos ←———→ [google.com](https://google.com) ) Thanos Intercepting like Man in Middle
- To solve the problem of verifying that the person we are communicating to is Not Thanos in the Middle we introduce Certificate Authority which proves the identity of [google.com](https://google.com) and everyone trusts the Authority
- Certificate Authority Like IdenTrust, DigiCert, Sectigo, Lets Encrypt, GoDaddy
- So when establishing a Server for the First time say [google.com](https://google.com) talks to the certificate authority (ex Lets’ Encrypt), telling the address details (like getting a passport, in this case, public Key of Google ) which when are encrypted by the private key of the certificate authority is called the signed certificate which is also previously signed by a root authority

### How Does Certificate Work in General?

- Let's Suppose I am the client and want to establish a TLS connection between the server and Server and Client we do a handshake
- In Handshake, we exchange the public key of the server and the server sends the certificate
- The certificate has some information signed by the “ Certificate Authority “ which is in turn signed by “ root certificate “ which is in turn self-signed (Chain of Trust)
- ie so when talking to [google.com](https://google.com) we receive a certificate from google signed by (Let’s Encrypt ) verifying google identity and we trust the  (Let’s Encrypt Claim) since it was signed by Root Certificate which we already have on client-side pre-installed

![Screenshot 2022-03-17 at 4.19.05 PM.png](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Screenshot_2022-03-17_at_4.19.05_PM.png)

- Once the TLS Certificate reach the client, the client validates the certificate (the Certificate in the Browser or OS does the validation)

### How does Certificate Validation Works

- The client takes a look at the certificate and checks if encrypted and signed by which certificate authority but does the client trust the certificate authority? who signed the certificate authority, the root certificate (which is self-signed)  so how to validate who signed the root certificate?
- Root Certificate is pre-installed in the client (mobile device, computer)
- These Root Certificates are trusted globally
- Hard to fake a signature since no one else has the private key of the certificate authority

![Screenshot 2022-03-17 at 4.48.57 PM.png](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Screenshot_2022-03-17_at_4.48.57_PM.png)

### Now Consider the Scenario

- Someone taps in the middle and intercepted using techniques like DNS poisoning, terminating the traffic
- the communication and served a shady clone of the website (from the stolen code of the website )with same API and interface and (like serving [aa.com](https://aa.com) instead of [ab.com](https://ab.com) ) which is intruders own website that has a certificate signed by self-signed or  certificate authority and root certificate that is trusted by the end-user (client)
- If this happens then our laptop will validate the website and accept the (aa.com instead of [abc.com](https://ab.com) ) as the genuine website or even ab.com if the attack was done using DNS poisoning
- The attacker will terminate the connection in the middle and intercept the traffic on behalf of the original server and can steal the data

![Screenshot 2022-03-17 at 5.13.37 PM.png](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Screenshot_2022-03-17_at_5.13.37_PM.png)

### Note :

```sql
If Super paranoid check the certificate authority of the page when connected to public wifi or WorkMachine
```

## SSL/TLS Certificate Pinning

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Untitled%205.png)

- More Concerned with Frontend Application and focusing and delivering to the end-user (What about how we secure and establish trust between backend Applications)
- The attacker can always easily install a wrong certificate in the client device in the device like android that will make the client trust the incoming certificate from a malicious website
- The solution, we hash the certificate along with the URL it points to and stores it locally
- When we visit the website [ab.com](https://ab.com) we verify the certificate locally using the methods listed above  as the first layer but further checks the hashed certificate stored in the application layer to match the authenticity if it does not match we fail the connection

## What are the Cases when the Certificate don't match?

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/231bb7d052f98a46396553e11eb9cb05846ff42d/2022-03-25%2021e4c/Untitled%206.png)

- If someone is intercepting in the middle the certificate sent by them won't match, ie the certificate validation will pass but at runtime when the code kicks in  the hashed certificate won't match  thus detecting man the middle attack

### Advantage

- Can use self-signed certificate not using any certificate authority, hash it and store it in the application, the SSL will accept it but at the code level, it can be rejected. or not by using — ignore (not recommended but still people use it)
- If using a gaming app one knows it will be connecting the one server where certificate pinning makes sense, but does not make sense to implement it in browser applications as the browser should be able to connect to any web server
- It is only useful in use cases where one knows that the application has to connect with only a limited range of servers and nothing else.

### Disadvantage

- If the certificates expired or the certificate has been revoked, then the certificate has to be rehashed and updated at the end client application.
- If not the client will still be trusting the old certificate. if the update does not reach the end client

These may seem like limitations but there are good practices to it that can be done at the application layer to implement this make better and more secure mobile application 

## Credit for Explanation

Hussein Nasser, [Youtube Channel](https://www.youtube.com/c/HusseinNasser-software-engineering/about) , [https://www.husseinnasser.co](https://www.husseinnasser.com/)m , twitter: @hnasr

## Reference

- [SSL and TLS with ELI5 found this post on Hackernews](https://news.ycombinator.com/item?id=26561507)
- [eli5_what_are_online_security_certificates_ssl/](https://www.reddit.com/r/explainlikeimfive/comments/jsq3m/eli5_what_are_online_security_certificates_ssl/)
- [TLS/SSL Certificate Pinning Explained](https://www.youtube.com/watch?v=3coPpYJgFro)
- [Making Sense of SSL/TLS](https://medium.com/demystifying-security/making-sense-of-ssl-tls-b600133f52bc)
