---
title: "Spring REST Template in Spring STS Part 2"
author: harshityadav95
date: 2021-07-19 00:00:00 +0530
categories: [SDE Developer, Spring Boot]
tags: [spring, rest-template, java]
---

## Spring REST Template in Spring STS Part 2

Continuation of the post[Creating “Hello World “Spring Boot Project with STS and Maven Part](https://harshityadav95.medium.com/creating-hello-world-spring-boot-project-with-sts-and-maven-part-1-bf8bbda3e322)1

- The rest template class allows you to call other rest services from your local spring application it serves as a rest client

Create a new Spring Project but with the package as “ Rest Repositories “ then and head over main class that contain the static void method in directory src/main/java and write the following code

![Medium article image](/assets/img/posts/spring-rest-template-in-spring-sts-part-2/medium-image-bd5ae1ed65e6.png)

and modify the code

```
package com.example.demo;
```

```
import org.springframework.boot.SpringApplication;
```

```
import org.springframework.boot.autoconfigure.SpringBootApplication;
```

```
import org.slf4j.Logger;
```

```
import org.slf4j.LoggerFactory;
```

```
import org.springframework.web.client.RestTemplate;
```

```
@SpringBootApplication
```

```
public class RestTemplateTesterApplication {
```

```
private static final Logger log = LoggerFactory.getLogger(RestTemplate.class);
```

```
public static void main(String[] args) {
```

```
RestTemplate restTemplate = new RestTemplate();
```

```
String quote= restTemplate.getForObject("http://localhost:8080/hi", String.class);
```

```
log.info(quote.toString());
```

```
}
```

```
}
```

the final code will look like this

![Medium article image](/assets/img/posts/spring-rest-template-in-spring-sts-part-2/medium-image-a007c7c1eefd.png)

## Run

Now run the server which of the Article 1 mentioned in the beginning of the post and check if the port number and URL to be fetched in this application is same as that of the server running in the server, and run this application by right clicking on the project and run boot application , if all works you should get Hello world output from the server made in Article 1 in the console of terminal of of this application

![Medium article image](/assets/img/posts/spring-rest-template-in-spring-sts-part-2/medium-image-e3a7cbd6e5cb.png)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/spring-rest-template-in-spring-sts-part-2-85f1a4563efa)
