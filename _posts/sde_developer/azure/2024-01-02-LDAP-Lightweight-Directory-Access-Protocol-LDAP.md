---
title: Lightweight directory access protocol LDAP
author: harshityadav95
date: 2024-01-02 00:00:00 +0530
categories: [Azure]
tags: [Azure, LDAP]

---

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/c3a2817d-90b3-4808-ae7a-f12eb5c036ee)

**Lightweight directory access protocol (LDAP**) is a protocol that makes it possible for applications to query user information rapidly.

## Why need LDAP ?

Someone within your office wants to do two things: Send an email to a recent hire and print a copy of that conversation on a new printer. LDAP (lightweight directory access protocol) makes both of those steps possible.

## What is LDAP ?

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/9acd0108-e693-4eb0-b727-e25fdeeec291)

- Companies store usernames, passwords, email addresses, printer connections, and other static data within directories.
- LDAP is an open, vendor-neutral application protocol for accessing and maintaining that data.
- LDAP can also tackle authentication, so users can sign on just once and access many different files on the server.

[LDAP](https://www.okta.com/integrations/ldap/) is a protocol, so it doesn't specify how directory programs work. Instead, it's a form of language that allows users to find the information they need very quickly.

## LDAP Examples

- It is used in Docker
- Jenkins
- OpenVPN

## Working

- Works on plain text over TCP IP over port 389
- LDP + SSL/TLS = LDAPS over port 636

LDAP is vender-neutral, so it can be used with a variety of different directory programs. Typically, a directory [contains data that is](https://tldp.org/HOWTO/LDAP-HOWTO/whatisldap.html):

- **Descriptive.** Multiple points, such as name and location, come together to define an asset.
- **Static.** The information doesn’t change much, and when it does, the shifts are subtle.
- **Valuable.** Data stored within the directory is critical to core business functions, and it's touched over and over again.

An LDAP query typically involves:

- **Session connection.** The user connects to the server via an LDAP port.
- **Request.** The user submits a query, such as an email lookup, to the server.
- **Response.** The LDAP protocol queries the directory, finds the information, and delivers it to the user.
- **Completion.** The user disconnects from the LDAP port.

Before any search commences, the LDAP must authenticate the user. Two methods are available for that work:

- **Simple.** The correct name and password connect the user to the server.
- **Simple Authentication and Security Layer (SASL).** A secondary service, such as Kerber

 Most LDAP communication is sent without scrambling or encryption, and that could cause security problems. Most companies use Transport Layer Security (TLS) to ensure the safety of LDAP messages.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/09e0beea-286d-4da4-91ac-61f2254ea230)


People can tackle all sorts of operations with LDAP. They can:

- **Add.** Enter a new file into the database.
- **Delete.** Take out a file from the database.
- **Search.** Start a query to find something within the database.
- **Compare.** Examine two files for similarities or differences.
- **Modify.** Make a change to an existing entry.

## **LDAP Terms to Understand**

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/57b783e5-62c0-4b2b-ad7b-25f91161d706)

- **Distinguished name (DN).** This is a unique identifier of each entry that also describes location within the information tree.
- **Modifications.** These are requests LDAP users make to alter the data associated with an entry. [Defined modification types](https://ldap.com/basic-ldap-concepts/) include adding, deleting, replacing, and increasing.
- **Relative distinguished name (RDN).** This is a way of tying DNs together while specifying relative location.
- **Schema.** The coding that underpins your LDAP is known as schema.
- Domain Component (DC) . part of the LDAP domain name
- Organizational unit (OU). a container for other objects in LDAP
- Common Name (CN) . [CN stands for common name, an attribute that identifies the name of an entry in LDAP](https://stackoverflow.com/questions/18756688/what-are-cn-ou-dc-in-an-ldap-search)

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/ee59c930-d648-4ecc-8815-08e28daf927a)


## LDAP 2024 ?

Sometimes, people use LDAP in concert with other systems throughout the workday. For example, your employees may use LDAP to connect with printers or verify passwords. Those employees may then switch to Google for email, which doesn't rely on LDAP at all.

## LDAP

- LDAP stands for **Lightweight Directory Access Protocol**. It's a software protocol that lets users find information about people, organizations, and other resources on a network. LDAP can be used on the public internet or a corporate intranet.
- LDAP's main goals are to store data in the LDAP directory and authenticate users to access it. LDAP is not a database, and it doesn't store data in a table or row format like traditional relational databases
- LDAP is a standard application protocol, while Active Directory (AD) is a proprietary product.
- LDAP is an interface for communicating with directory services, such as AD. AD is a directory server that uses the LDAP protocol.
- LDAP authentication follows a client-server model. The client, usually an application or service, initiates the authentication process by sending a request to the LDAP server. The LDAP server receives the request and verifies the provided credentials against its database

## LDAP vs Directory Service

- LDAP is a protocol that defines how to communicate with and query directory services, which are databases of network resources and users.
- Directory service is a generic term for any service that provides such a database, such as Active Directory, which is a Microsoft product that also offers security and management features

## **LDAP vs. Active Directory**

- LDAP = Protocol
- Active Directory is Database

LDAP is a protocol that can read Active Directory, but you can also use it with other programs, including those based on Linux. As a vendor-neutral protocol, you could use this tool to work with all kinds of products that have nothing to do with Windows.

So LDAP and Active Directory work together to help users. But they don't compete with one another, and they don't do exactly the same thing.

## Lightweight Directory Service DS

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/d0421b3e-d912-418e-878d-c6a93241bb1a)


- AD LDS stands for Active Directory Lightweight Directory Services, which is a directory service that supports directory-enabled applications without the dependencies and limitations of AD DS.
- AD LDS can run on any Windows server or client, does not require DNS or domain controllers, and can have multiple instances with different schemas on one server.

## LDAP vs SAML

- LDAP and SAML are both authentication protocols, but they have different use cases.
- LDAP is used for accessing on-premises resources, such as servers, applications, or devices, by installing a client on the user’s device and connecting to a directory service.
- SAML is used for accessing cloud-based resources, such as web applications, by exchanging information between an identity provider and a service provider, without storing credentials on the service provider

## LDAP vs Kerberos

Kerberos is a protocol for network authentication, using secret-key cryptography for secure communication. It’s designed for strong authentication and supports Single Sign-On (SSO). [On the other hand, LDAP is used for locating and managing directories in a network, optimized for lookups and read operations](https://www.geeksforgeeks.org/difference-between-ldap-and-kerberos/)

## Apache Directory Studio

Apache Directory Studio is a complete directory tooling platform intended to be used with any LDAP server however it is particularly designed for use with ApacheDS.

[https://directory.apache.org/studio/](https://directory.apache.org/studio/)

## Reference :

- [https://www.okta.com/identity-101/what-is-ldap/](https://www.okta.com/identity-101/what-is-ldap/)
- [https://www.youtube.com/watch?v=0FwOcZNjjQA](https://www.youtube.com/watch?v=0FwOcZNjjQA)
