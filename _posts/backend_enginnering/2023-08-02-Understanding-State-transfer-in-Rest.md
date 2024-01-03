---
title: Understanding State Transfer in REST

date: 2023-08-02 00:00:00 +0530
categories: [Backend Engineering]
tags: [Backend Development, REST]

---

{% include embed/youtube.html id='EKCM1oQQrCM' %}

## State Transfer in REST

### Example :

- Going to the doctor for the first time one has to explain the condition and present the medical records and history, on future visits the doctor knows us and resume from the previous state and don't ask the same question and remember your case
- We go to a new doctor which does not know anything about us and have to start from scratch explaining the medical condition and files and case to bring the doctor up to speed
- The doctor remembers/saves your state in memory like similar to a server like a stateful model
- The new doctor is blank, does not have your state, and has to bring that doctor to the same state ie state transfer

## State Transfer

We assume the server to be dumb and stateless with no prior knowledge of us and try to bring as much information with us to the server and rebuild the state on the server 

## Analysis of State Transfer

- We transfer everything to the server every time, which is comparatively slower as we have to rebuild the state on the server every time
- Payload is Heavier as we have to transfer state data also which may become heavier over time as compared to the stateful model
- Stateless is better than Stateful, as stateful is hard to scale

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/42ee6eb9-148f-48db-8eeb-eab6a00e907e)


- The token is used for future requests
- The state is remembered in server still in form of location , computer name  , network even when we are using Token based on implementation

## Reference :

- [https://help.hcltechsw.com/commerce/9.1.0/webservices/concepts/cwvrest.html](https://help.hcltechsw.com/commerce/9.1.0/webservices/concepts/cwvrest.html)
- [https://youtu.be/EKCM1oQQrCM](https://youtu.be/EKCM1oQQrCM)
