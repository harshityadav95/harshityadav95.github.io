---
title: "Creating “Hello World “Spring Boot Project with STS and Maven Part 1"
author: harshityadav95
date: 2021-07-18 00:00:00 +0530
categories: [SDE Developer, Spring Boot]
tags: [spring-boot, sts, maven, java]
---

## Creating “Hello World “Spring Boot Project with STS and Maven Part 1

## **1. Download the Spring STS tools**

Link :[https://spring.io/tools](https://spring.io/tools)and extract it to run

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-b21dc4001821.png)

## 2. Start new Spring Started Project

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-1bae81d7e8fe.png)

Enter the name and select the project location, and check if version of java is same as the java version you have installed

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-979f10b1c8d7.png)

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-5d826eba9f29.png)

## 3. Explore the Project

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-25b4b4ff3b39.png)

## **4. Creating a new Package**

Inside main/java right click to create a new package

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-adb24f74be35.png)

## **5. Under the Newly created package create a new class**

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-d9b7cf29ebc2.png)

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-1a3aa6daf47a.png)

And add the following code

```
package com.example.demo.sts.apiendpoint;
```

```
import org.springframework.web.bind.annotation.RequestMapping;
```

```
import org.springframework.web.bind.annotation.RestController;
```

```
@RestController
```

```
public class DemoSTSEndpoint {
```

```
@RequestMapping("/")
```

```
public String hello()
```

```
{
```

```
return "Hello World";
```

```
}
```

```
}
```

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-e3107dfec73a.png)

## **Start the Project**

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-691801701b2d.png)

## Output :

headover to localhost:8080/

![Medium article image](/assets/img/posts/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1/medium-image-166efd149cb9.png)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1-bf8bbda3e322)
