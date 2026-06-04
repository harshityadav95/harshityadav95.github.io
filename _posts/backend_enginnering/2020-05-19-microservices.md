---
title: "Microservices"
author: harshityadav95
date: 2020-05-19 00:00:00 +0530
categories: [Backend Engineering]
tags: [microservices, architecture, backend]
---

## Microservices

MONOLITHIC ARCHITECTURE

More Info :[Drawbacks and advantages](https://docs.microsoft.com/en-us/azure/architecture/guide/architecture-styles/microservices)

![Medium article image](/assets/img/posts/microservices/medium-image-8b10f6fca93d.png)

MICROSERVICE ARCHITECTURE

Link :[Scalable Approach](https://microservices.io/patterns/microservices.html)

![Medium article image](/assets/img/posts/microservices/medium-image-d0ee16b116c4.png)

MICROSERVICE

Microservices — is an architectural style that structures an application as a collection of services that are  
• Highly maintainable and testable  
• Loosely coupled  
• Independently deployable  
• Organized around business capabilities  
• Owned by a small team  
The microservice architecture enables the rapid, frequent and reliable delivery of large, complex applications. It also enables an organization to evolve its technology stack.

COMPARISON

![Medium article image](/assets/img/posts/microservices/medium-image-73d2254a301e.png)

MICROSERVICES ARCHITECTURE STYLE

A microservices architecture consists of a collection of small, autonomous services. Each service is self-contained and should implement a single business capability.

Link :[Microservice Architecture Style](https://docs.microsoft.com/en-us/azure/architecture/guide/architecture-styles/microservices)

![Medium article image](/assets/img/posts/microservices/medium-image-34549b95d4f3.png)

**OTHER COMPONENTS OF MICROSERVICES ARCHITECTURE**

**Management**. The management component is responsible for placing services on nodes, identifying failures, rebalancing services across nodes, and so forth.  
**Service Discovery**. Maintains a list of services and which nodes they are located on.  
Enables service lookup to find the endpoint for a service.  
**API Gateway.**The API gateway is the entry point for clients. Clients don’t call services directly. Instead, they call the API gateway, which forwards the call to the appropriate services on the back end. The API gateway might aggregate the responses from several services and return the aggregated response.

## CHARACTERISTICS OF A MICROSERVICE

- In a microservices architecture, services are small, independent, and loosely coupled.
- Each service is a separate codebase, which can be managed by a small development team.
- Services can be deployed independently. A team can update an existing service without rebuilding and redeploying the entire application.
- Services are responsible for persisting their own data or external state. This differs from the traditional model, where a separate data layer handles data persistence.
- Services communicate with each other by using well-defined APIs. Internal implementation details of each service are hidden from other services.
- Services don’t need to share the same technology stack, libraries, or frameworks.

## Aspects of services within an enterprise that must be described by SOA

![Enterprise perspective of SOA](/assets/img/posts/microservices/medium-image-397cab9733b0.png)

_Enterprise perspective of SOA_

SOA needs to describe the following aspects of services within an enterprise:  
1. A definition of services, the granularity, and types of services  
2. How services are constructed and used  
3. How existing packaged and legacy systems are integrated into the  
service environment  
4. How services are combined into processes  
5. How services communicate at a technical level (i.e., how they connect to  
each other and pass information)  
6. How services interoperate at a semantic level (i.e., how they share com-  
mon meanings for that information)  
7. How services align with the businesses strategy and goals  
8. How to use the architecture

## **Basic Service Architecture**

![Basic service architecture — the service implementation model](/assets/img/posts/microservices/medium-image-b1ee8588146e.png)

_Basic service architecture — the service implementation model_

- **The service interface layer implements**the service contract (or interface)the operations provided by the service (interaction patterns supported by these operations), the documents associated with each operation, and the data types composing these documents.
- **The service business layer**is responsible for implementing the business logic, rules, and state transitions.
- **The resource access layer**contains the logic necessary to access enterprise resources, which are utilized by the service’s implementation.
- **The resources**used by the service may include data (databases used directly by a service), existing enterprise applications (and  
other business, domain, and utility services.
- T**he service interface layer typically operates**on data that is semantically  
tied to the enterprise (usually the messaging payload sent to the service,  
defined in accordance with the semantic information model). The interface layer’s responsibility is to receive the input documents and make any neces-sary translations required to invoke business entities (business objects with business data) in the business layer in order to implement the functionalityof the service’s operation. Although it is technically possible to use the same semantic data types directly in the business layer, the more common case is to use business entities for the business layer implementation. Semantic data types are often designed to optimize the information transport between services. Because of that, this type of data is not well suited or business processing, which often requires a different data model altogether.  
**The responsibility of the business layer**is to do the business processing  
required to implement the service contract.  
As stated earlier, no service is an island. Its implementation always lever-  
ages other existing enterprise resources, including databases, existing legacy applications, and other services. Interacting with these r**esources is a responsi-bility of the resource access layer.**Business entities used by the business layer for business processing can be used here for accessing resources this resource layer often introduces its own data model, called the resource access data model. In this case, the implementation of the resource layer first converts business entities into the resource data model, and then executes the actual accessing of resources.  
**Although a three-layered architecture for service implementations might appear complex,**it provides the most flexible and maintainable service imple-mentation. The separation of responsibilities and the separation of data support the architectural principle of separation of concerns and contribute to local- ization of potential changes. For example, changes to input data validation rules are completely encapsulated in the business layer. Therefore, they can be  
made without affecting the interface and resource layers.

## **Layer Responsibilities**

![Responsibilities of service implementation layers](/assets/img/posts/microservices/medium-image-ac75e2d44731.png)

_Responsibilities of service implementation layers_

Figure 7–2 illustrates an example of distribution of function and responsibility  
between layers for a typical operation. The interface layer receives the operation invocation and performs the syntactical validation of the input document.  
Then, any transformation between the semantic information model and the  
domain model is performed. Next, the business layer performs whatever

business logic or functions are required. This typically requires a call to the  
resource layer to access data, services, or other resources. The resource layer  
performs a required translation to and from the resource data model, before  
and after the resource access. Any additional business logic is carried out  
before the interface layer takes over again to transform the data back from the  
domain model to the semantic information model, format the document, and  
send the response

The service implementation model presented here is gaining adoption in  
the industry. Many companies are using it as a foundation for designing and  
implementing services, and tooling is beginning to appear that enforces such  
a three-layered architecture. For example, the latest version of Microsoft’s  
patterns & practices Web Service software factory is based exactly on this  
model and allows the generation of a solution layout (‘‘solution’’ is a Micro-  
soft’s Visual Studio term, defining a set of interrelated projects that are  
developed and compiled together) adhering to the service implementation  
model outlined in Figure 7–1.  
First, we discuss the general modeling techniques and diagrams used in  
implementation design. Then, we outline implementation approaches for these service layers. Using Activity

## **Orchestration and choreography in SOA**

Rules for service interactions in service composition can be defined in two  
different ways: orchestration and choreography. The differences between the  
two are:

- **Orchestration describes**the workflow of how services interact, including  
the business logic and order of interactions. The point of reference for  
orchestration is a single controller. Web Services Business Process Exe-  
cution Language (WS-BPEL) is an orchestration language that is used to  
compose Web Services. Languages for orchestration can be used to build  
‘‘orchestration scripts’’ that can be executed at run time by an orchestra-  
tion controller (or an orchestration engine) based on rules and sequences.
- **Choreography**describes the sequence of messages between services, focus- ing on the public exchange of messages and conversational state. Unlike  
orchestration, which is shown from the perspective of a main coordina-  
tor, choreography focuses on the exchange of messages from the per-  
spective of a third party observer. Intended for multi-party collabora-  
tions, each service involved in the choreography must be aware of the  
business process, when to execute its operations, and how to interact.  
Web service choreography languages, such as Web Services Choreogra-  
phy Language (WS-CDL) describe such peer-to-peer collaborations.

A pictorial view of the difference between orchestration and choreography  
is shown in Figure 8–2. The big difference is that orchestration is based on  
an executable business process from the perspective of one controller, and  
choreography is based on the messaging interactions, from the perspective of  
a third party, and is meant for multi-party collaboration. In practice, orchestra-  
tion takes place with a central engine controlling an execution flow, whereas  
choreography allows for multiple parties, permitting a more peer-to-peer  
approach.

![Orchestration versus choreography](/assets/img/posts/microservices/medium-image-c6afce62add4.png)

_Orchestration versus choreography_

As you can see, orchestration and choreography approach two different  
methodologies of service composition. There are passionate debates between  
these two camps, and there are many strong opinions on both sides. It  
seems that at this point, the orchestration community has the most traction  
in the standards bodies and in technology adoption. WS-BPEL is a unifying  
orchestration standard from OASIS; it was adopted in 2007 and has been  
in the standards process since 2003. WS-BPEL evolved from the BPEL4WS  
specification (2003), which had roots in Microsoft’s XLang (2000) and IBM’s  
WSFL (2001). WS-CDL, a choreography language, has been a W3 C working  
draft since 2004. Because WS-BPEL is a standard with widespread adoption,  
we focus primarily on that orchestration standard later in this chapter.

## **Four different phases of SOA governance life cycle and Common types of policies used.**

While SOA management provides the big picture, its definition collides  
with governance when it involves measuring and monitoring the adherence  
to SOA governance policies. Information collected in the SOA management  
process may directly affect governance. For example, response time guarantees for service level agreements (SLAs) may be refined over time, based on the metrics collected as the services are used. The SOA governance life cycle is commonly referred to in four different phases — design time, deploy time, run time, and change time:

- **Design-Time Governance**refers to the defining and controlling of  
enterprise services to be created in the enterprise, and the creation of  
policies used to direct and control the implementation of the enterprise  
service life cycle. Key aspects of design-time governance are the  
creation of enterprise policies used to direct and control the implementation  
of the life cycle of enterprise services, and the creation of run-time service  
policies that specify constraints and capabilities for specific enterprise  
services. In this phase, an SOA architect is responsible for defining and  
authoring policies for standards compliance, privacy requirements,  
access control, reliability, performance, messaging, and develop-  
ing SLAs.
- **Deploy-Time Governance**involves the process of testing and controlling  
compliance to enterprise policies in order for services to be deployed in  
an SOA. It involves deployment options and topologies, and adherence  
to policy should dictate whether or not a service can be deployed on a  
network.
- **Run-Time Governance**refers to the process of enforcing the adherence to  
run-time service policies at run time. In addition to policy enforcement, this term is often used to include aspects of SOA management as it relates  
to these policies and to include real-time policy compliance monitoring,  
auditing, and measuring and collecting result statistics.
- **Change-Time Governance**involves managing services through the cycle  
of change. In a service life cycle, interfaces, service policies, and agree-  
ments may be modified many times. Change-time governance focuses  
on such issues as service versioning, deprecation, and run-time policy  
adaptation. Governance tools can be used to achieve such strategies as  
adding service intermediaries to intercept messages and route them to  
the appropriate previous versions of services.

As you can see, governance revolves around policy. Policies are created,  
edited, and refined throughout the life cycle of a project. The following are  
common types of policies used in SOA governance:

- **Messaging Security **— What are the policies related to confidentiality,  
integrity, and non-repudiation for each service? What kind of authen-  
tication is used? Are tokens, such as Kerberos, username/password, or  
SAML used to convey the identity of the end user? What standards to  
support these mechanisms are used?
- **Access Control Policy** — What are the access control policies used for  
the services?
- **Conformance to Enterprise Vocabulary and Schema** — What schemas  
need to be supported for a service to deploy? Is there a common enter-  
prise vocabulary that needs to be used? Is there a reference data model?
- **Conformance to Technical Standards (WS-I, WSDL, WS-Security,  
WS-ReliableMessaging)** — What are the standards to which a service  
must conform in order to deploy?
- **Deployment Process **— What is the process for deploying new services?  
Related to standards conformance, are there run-time tests that enable a  
service to be deployed on the network?
- **Versioning Policies** — What are the policies related to service version-  
ing and deprecation of existing services?
- **Discovery Policy** — What is the process of discovering a service and  
determining its access policies?
- **Privacy Regulations **— What privacy regulations must be enforced,  
and how can they be enforced?
- **Quality of Service (QoS)** — Are there guaranteed response times for  
each service? Are there levels of service responsiveness and priorities  
for each classification of user? (For example, employees, customers, and  
partners may each get a different guarantee of responsiveness and be put  
in a priority queue for the same service implementation.) Are there ser-  
vice levels (for example, gold, silver, bronze) for each type of customer,  
or are they individualized? Can service levels be negotiated at run time  
according to the requestor’s requirements?
- **Reliability **— Are there policies related to in-order delivery, at least once  
delivery, and at most once delivery?
- **Auditing and Reporting Requirements —** What type of auditing and  
reporting needs to be supported by each service?
- **Service Level Agreements (SLAs) **— Are there formal agreements  
between service consumers and providers related to QoS response times,

## BENEFITS

- **Independent deployments.**You can update a service without redeploying the entire application, and roll back or roll forward an update if something goes wrong. Bug fixes and feature releases are more manageable and less risky.
- **Independent development.**A single development team can build, test, and deploy a service. The result is continuous innovation and a faster release cadence.
- **Small, focused teams.**Teams can focus on one service. The smaller scope of each service makes the code base easier to understand, and it’s easier for new team members to ramp up.
- **Fault isolation.**If a service goes down, it won’t take out the entire application. However, that doesn’t mean you get resiliency for free.
- **Mixed technology stacks.**Teams can pick the technology that best fits their service.
- **Granular scaling.**Services can be scaled independently. At the same time, the higher density of services per VM means that VM resources are fully utilized. Using placement constraints, a services can be matched to a VM profile (high CPU, high memory, and so on).

## **CHALLENGES**

- **Complexity.**A microservices application has more moving parts than the equivalent monolithic application. Each service is simpler, but the entire system as a whole is more complex.
- **Development and test.**Developing against service dependencies requires a different approach. Existing tools are not necessarily designed to work with service dependencies.Refactoring across service boundaries can be difficult. It is also challenging to test service  
dependencies, especially when the application is evolving quickly.
- **Lack of governance.**The decentralized approach to building microservices has advantages,  
but it can also lead to problems. You may end up with so many different languages and frameworks that the application becomes hard to maintain.
- **Network congestion and latency.**The use of many small, granular services can result in more interservice communication.
- **Data integrity.**With each microservice responsible for its own data persistence. As a result, data consistency can be a challenge. Embrace eventual consistency where possible.

## ISSUES

When to use the microservice architecture?  
**How to decompose the application into services?**

- Decompose by business capability and define services corresponding to business capabilities.  
• Decompose by domain-driven design subdomain.  
• Decompose by verb or use case and define services that are responsible for particular actions. e.g. a Shipping Service that’s responsible for shipping complete orders.  
• Decompose by by nouns or resources by defining a service that is responsible for all operations on entities/resources of a given type. e.g. an Account Service that is responsible for managing user accounts.

**How to maintain data consistency?**

- Maintaining data consistency between services is a challenge because 2 phase-commit/distributed transactions is not an option for many applications.

**How to implement queries?**

- implementing queries that need to retrieve data owned by multiple services.

## **Pattern: Decompose by business capability Context**

Link :[Pattern](https://microservices.io/patterns/decomposition/decompose-by-business-capability.html)decompose by business

Link :[Pattern Microservice Architecture](https://microservices.io/patterns/microservices.html)

Link :[Pattern Decompose by Subdomain](https://microservices.io/patterns/decomposition/decompose-by-subdomain.html)

**MICROSERVICES ADOPTION ANTIPATTERNS**

![Medium article image](/assets/img/posts/microservices/medium-image-262e665f4ced.png)

Unlike a regular pattern, which is a (problem, solution) pair, an anti-pattern consists of three elements:

- Problem — the problem you are trying to solve, which in the case of microservices adoption is generally how to improve the speed, the frequency and reliability of software delivery
- Anti-pattern solution — the solution that doesn’t work well
- Refactored solution — a better solution to the problem.

Here are the microservices adoption antipatterns:

- [Microservices are a magic pixie dust](https://chrisrichardson.net/post/antipatterns/2019/01/07/microservices-are-a-magic-pixie-dust.html) — believing that a sprinkle of microservices will solve all of your development problems
- [Microservices as the goal](https://chrisrichardson.net/post/antipatterns/2019/01/14/antipattern-microservices-are-the-goal.html) — making the adoption of microservices the goal and measuring success in terms of the number of services written
- [Scattershot adoption](https://chrisrichardson.net/post/antipatterns/2019/02/25/antipattern-scattershot-adoption.html) — multiple application development teams attempt to adopt the microservice architecture without any coordination
- [Trying to fly before you can walk](https://chrisrichardson.net/post/antipatterns/2019/04/09/antipattern-flying-before-walking.html) — attempting to adopt the microservice architecture (an advanced technique) without (or not committing to) practicing basic software development techniques, such as clean code, good design, and automated testing
- [Focussing on Technology](https://chrisrichardson.net/post/antipatterns/2019/04/30/antipattern-focus-on-technology.html) — focussing on technology aspects of microservices, most commonly the deployment infrastructure, and neglecting key issues, such as service decomposition
- [More the merrier](https://chrisrichardson.net/post/antipatterns/2019/05/21/antipattern-more-the-merrier.html) — intentionally creating a very fine-grained microservice architecture
- [Red Flag Law](https://chrisrichardson.net/post/antipatterns/2019/06/07/antipattern-red-flag-law.html) — retaining the same development process and organization structure that were used when developing monolithic applications.

Example Uber Microservice

![Medium article image](/assets/img/posts/microservices/medium-image-c28a309b9dc7.png)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/microservices-1f9fe2c63c6b)
