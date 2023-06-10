---
title: Notes Deployment Strategies 
author: Harshit Yadav
date: 2023-05-17 00:00:00 +0530
categories: [Software Development,Cloud]
tags: [deployment, webdevelopment]
---

## Source

{% include embed/youtube.html id='AWVTKBUnoIg' %}

## TLDR;

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Notes_Deployment%20_Strategies/Untitled.png)

## Big Bang Deployment

- Big Bang deployment is a software release approach where the entire system is deployed in one go, replacing the existing system entirely.
- It involves high risk and disruption since all users transition simultaneously.
- It requires thorough testing and preparation to ensure a smooth transition and rollback to previous version in case of deployment failure.

## Rolling Deployment

- Rolling deployment is a software release approach where updates are deployed gradually, with a subset of the system or users at a time.
- It involves deploying the new version while keeping the existing version running.
- It reduces the risk and impact of deployment by allowing for monitoring, testing, and addressing issues incrementally.
- It enables a smoother transition, as updates are applied in stages, ensuring minimal disruption to the overall system.

## Blue Green Deployment

- Blue Green Deployment is a release strategy where two identical environments, "blue" and "green," are maintained.
- The blue environment represents the current production version, while the green environment is an exact replica of where the new version is deployed.
- Traffic is initially directed to the blue environment.
- Once the green environment is tested and validated, the switch is made, redirecting traffic from blue to green.
- This approach allows for zero-downtime deployments, easy rollback, and quick recovery in case of issues, as the previous version is still available in the blue environment.

## Canary Deployment

- Canary Deployment is a release strategy where a new version of the software is deployed to a small subset of users or servers, known as the "canary group."
- This group receives the updated version while the rest of the users continue with the existing version.
- It allows for testing and monitoring the new version in a real-world environment, ensuring its stability and performance.
- If the canary group experiences no issues, the new version is gradually rolled out to the remaining
- Canary + Rolling Deployment ensures the best results

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/3a10c86582b2593d01d53199d8f85cfe686d18f5/Notes_Deployment%20_Strategies/Untitled%201.png)

## Feature Deployment

- Feature Deployment is a release strategy where specific features or functionalities are deployed to a subset of users or environments.
- It involves enabling new features for a targeted audience while keeping the existing functionality intact for others.
- This approach allows for incremental rollout and testing of new features, gathering feedback, and addressing issues before a broader release.
- It offers flexibility, scalability, and the ability to iterate on features based on user feedback and requirements.
- Feature Toggle can be used in combination with any other deployment strategies.

## Reference :

- [https://docs.aws.amazon.com/whitepapers/latest/practicing-continuous-integration-continuous-delivery/deployment-methods.html](https://docs.aws.amazon.com/whitepapers/latest/practicing-continuous-integration-continuous-delivery/deployment-methods.html)
- [https://www.opsmx.com/blog/advanced-deployment-strategies-devops-methodology/](https://www.opsmx.com/blog/advanced-deployment-strategies-devops-methodology/)


