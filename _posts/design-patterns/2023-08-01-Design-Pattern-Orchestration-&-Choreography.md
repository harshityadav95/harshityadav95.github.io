---
title: Design Pattern Orchestration & Choreography

date: 2023-08-01 00:00:00 +0530
categories: [Design Pattern]
tags: [Software Development, Design Pattern,Microservices]

---


![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/38bb009b-3dfc-4915-b2df-97d933ad894e)


# Orchestration

- Service orchestration represents a single centralized executable business process (the orchestrator) that coordinates the interaction among different services.
- The orchestrator is responsible for invoking and combining the services.
- The relationship between all the participating services are described by a single endpoint (i.e., the composite service). The orchestration includes the management of transactions between individual services. Orchestration employs a centralized approach for service composition.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/5063b24b-f0da-44ef-b2aa-f7a95f5589f5)


- Firstly, in orchestration, as you know, a central process is responsible for when and how services are invoked. In the case of a synchronous system where the orchestrator makes HTTP calls to services in series, the communication might look something like the following diagram.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/893953b5-3d5a-43c7-9d04-f63f4ecd2427)


- Alternatively, you might wish to take an asynchronous approach, in which a message broker is used to store the information about jobs that the services must complete. In this case, your communication would look something like the following diagram.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/80147730-afe9-40f8-b576-726611f9941a)

### BENEFITS OF MICROSERVICE ORCHESTRATION

- Easy to maintain and manage as we unify the business process at the center.
- In synchronous processing, the flow of the application coordinates efficiently.

### LIMITATIONS OF MICROSERVICE ORCHESTRATION

- Creating dependency due to coupled services. For example, if service A is down, service B will never be called.
- The orchestrator has the sole responsibility. If it goes down, the processing stops and the application fails.
- We lose visibility since we are not tracking business process.

# Choreography

- Service choreography is a global description of the participating services, which is defined by exchange of messages, rules of interaction and agreements between two or more endpoints. Choreography employs a decentralized approach for service composition.
- The choreography describes the interactions between multiple services, where as orchestration represents control from one party's perspective. This means that a choreography differs from an orchestration with respect to where the logic that controls the interactions between the services involved should reside.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/c4099dd7-e045-41d6-b57b-70bd2ec0165f)


- This decentralization means that each service is aware of a small piece of the big picture, but only those parts in which the service plays an active role. The services are otherwise unaware of their overall position and relevance concerning the business workflow under execution.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/c51c72bd-1df3-4dea-9068-fcf15e70bd97)


- As you can see, each service is responsible for invoking and responding to any adjacent services as needed. This behavior is also true for asynchronous communication, with the main difference being the inclusion of a message broker instead of direct HTTP calls.

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/2c45d07a-5f0c-471c-a013-f3102c5fc0ef)


- In this asynchronous approach to workflow choreography, each service subscribes to and publishes specific message types directly, rather than an orchestrator being responsible for mediating communication between services.

### BENEFITS OF MICROSERVICE CHOREOGRAPHY

1. Faster processing as no dependency on central controller.
2. Easy to add and update. The services can be removed or added anytime from the event stream.
3. As the control is distributed, there is no *single point failure.*
4. Works well with agile delivery model, as teams work on certain services rather than on entire application.
5. Several patterns can be used. For example, *Event sourcing*, where events are stored, and it enables event replay. *Command query responsibility segregation (*CQRS) can separate read and write activities.

### LIMITATIONS OF MICROSERVICE CHOREOGRAPHY

1. Complexity is the concerning issue. Each service is independent to identify the logic and react based on the specific data in the event stream.
2. Business process is spread out, making it difficult to maintain, manage the overall process.
3. Mindset change is prerequisite in the asynchronous approach.

Think :****An Example: E-Commerce Checkout :****

Imagine we have an e-commerce site. When a customer completes the checkout process, a few things need to happen:

- We need to send an email to the customer with their order confirmation.
- We need to send the order to our warehouse so we can begin the shipment.
- If the customer signed up for our rewards program, we need to create a new points balance for them.

It’s important to note that once an order is placed, these next three tasks don’t necessarily need to happen in any particular order. They just need to happen.

## Reference :

- [https://stackoverflow.com/questions/4127241/orchestration-vs-choreography#:~:text=The choreography describes the interactions,the services involved should reside](https://stackoverflow.com/questions/4127241/orchestration-vs-choreography#:~:text=The%20choreography%20describes%20the%20interactions,the%20services%20involved%20should%20reside).
- [https://betterprogramming.pub/microservice-orchestration-vs-choreography-5595b602fe3b](https://betterprogramming.pub/microservice-orchestration-vs-choreography-5595b602fe3b)
- [https://orkes.io/content/blog/workflow-orchestration-vs-choreography](https://orkes.io/content/blog/workflow-orchestration-vs-choreography)
- [https://betterprogramming.pub/microservice-orchestration-vs-choreography-5595b602fe3b](https://betterprogramming.pub/microservice-orchestration-vs-choreography-5595b602fe3b)
- [https://softobiz.com/microservice-orchestration-vs-choreography/](https://softobiz.com/microservice-orchestration-vs-choreography/)
- [https://theburningmonk.com/2020/08/choreography-vs-orchestration-in-the-land-of-serverless/](https://theburningmonk.com/2020/08/choreography-vs-orchestration-in-the-land-of-serverless/)
- [https://blog.sparkfabrik.com/en/orchestration-vs-choreography](https://blog.sparkfabrik.com/en/orchestration-vs-choreography)
