---
title: "Using Annotation for Bean Specification Part 4"
author: harshityadav95
date: 2021-07-18 00:00:00 +0530
categories: [Spring Boot]
tags: [spring, annotations, beans, java]
---

## Using Annotation for Bean Specification Part 4

Part 1 :[Setting up a Maven Project on Eclipse in Linux Ubuntu Part 1](https://harshityadav95.medium.com/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-137031102e31)

Part 2:[Setup Spring Boot in Maven Project in Eclipse Part 2](https://harshityadav95.medium.com/setup-spring-boot-in-maven-project-in-eclipse-part-2-d3687f8334eb)

Part 3 :[Setting up Spring Application Specifying Application Context using XML Part 3](https://harshityadav95.medium.com/setting-up-spring-application-specifying-application-context-using-xml-part-3-85b25856f7bc)

## 1. Change the Entry file to index.html

![Medium article image](/assets/img/posts/using-annotation-for-bean-specification-part-4/medium-image-5e0e7a3afddd.png)

add the variabe

```
${message}
```

which will be replaced and rendered by the model

## **2. SpringMVConfiguration.java**

![Medium article image](/assets/img/posts/using-annotation-for-bean-specification-part-4/medium-image-1ab415fc27c7.png)

- implements WebMvcConfigurer interface , this interface has to be implemented if we want to use java based configuration for Spring MVC project rather xml based configuration for the servlet

```
@EnableWebMvc
```

- Enables programtic annotations for components which will be then injected into the application , it will enable java annotations to specify different components for spring Mvc application

```
@ComponentScan
```

- It tells the base package which it should start scanning for classes that have this annotations
- All classes defined into this base package will be scanned for annotations and those objects will be automatically be instantiated and injected into our application

```
@Configuration
```

- This tell springmvc this java class should be treated as programmatic configuration of our SpringMVC servlet

```
JstlViews.Class
```

- We will use JSP file with JSTL tags

## **3. WebServletConfiguration.java**

![Medium article image](/assets/img/posts/using-annotation-for-bean-specification-part-4/medium-image-a45616691cae.png)

## **4. MessageDisplayController.java**

![Medium article image](/assets/img/posts/using-annotation-for-bean-specification-part-4/medium-image-327a3dfeab82.png)

- Dosent implement the controller interface as we implemented in part 3
- Spring 3.0 Onwards just tagging it with @ Controller will get it done

**Handler Mapping**

- It maps a requests and incoming web request to a particular method which process the request and after performing the request it renders the view with the result

**View Resolver**

![Medium article image](/assets/img/posts/using-annotation-for-bean-specification-part-4/medium-image-6ddb20633cbd.png)

To direct our view resolver to look into folder home relative to the root directory , so create a new folder “ home “ and place the index.html into the home folder

## 5. Run Application

- Stop tomcat
- Clean server
- Clean Eclipse Cache
- Maven Build
- Run as >> run on server

Run /hi or /begin

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/using-annotation-for-bean-specification-part-4-853e63ca0f90)
