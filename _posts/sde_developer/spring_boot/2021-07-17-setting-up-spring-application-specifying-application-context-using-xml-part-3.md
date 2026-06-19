---
title: "Setting up Spring Application Specifying Application Context using XML Part 3"
author: harshityadav95
date: 2021-07-17 00:00:00 +0530
categories: [SDE Developer, Spring Boot]
tags: [spring, xml, java, application-context]
---

## Setting up Spring Application Specifying Application Context using XML Part 3

Part 1 :[Setting up a Maven Project on Eclipse in Linux Ubuntu Part 1](https://harshityadav95.medium.com/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-137031102e31)

Part 2:[Setup Spring Boot in Maven Project in Eclipse Part 2](https://harshityadav95.medium.com/setup-spring-boot-in-maven-project-in-eclipse-part-2-d3687f8334eb)

The Web.xml file remains same

![Medium article image](/assets/img/posts/setting-up-spring-application-specifying-application-context-using-xml-part-3/medium-image-03ba3a66c6f6.png)

If getting error or re-compiling that wrong version of JDK ,has been specified correct it by explicitly in pom.xml

![Medium article image](/assets/img/posts/setting-up-spring-application-specifying-application-context-using-xml-part-3/medium-image-ba5472dcc950.png)

## 1. Add and XML file

![Medium article image](/assets/img/posts/setting-up-spring-application-specifying-application-context-using-xml-part-3/medium-image-289aaab9e377.png)

![Medium article image](/assets/img/posts/setting-up-spring-application-specifying-application-context-using-xml-part-3/medium-image-79a0e05b8916.png)

Now name the application “application-context.xml”

![Medium article image](/assets/img/posts/setting-up-spring-application-specifying-application-context-using-xml-part-3/medium-image-601f610008c9.png)

Add the following XML content to the file

![Medium article image](/assets/img/posts/setting-up-spring-application-specifying-application-context-using-xml-part-3/medium-image-8667ebe723e7.png)

- The Second beans is for the messageController object
- The name of the bean is “/” this is the only controller that handles the root mapping of the application
- The third bean maps to the messageDisplayController
- No Change in MessageDisplayController.java

## **2. Change in WebServletConfiguration**

![This is what the new code will look like](/assets/img/posts/setting-up-spring-application-specifying-application-context-using-xml-part-3/medium-image-998ce5a8cde4.png)

_This is what the new code will look like_

- Since the specification is XML based specification we instantiate an XML based context class to load the config from the XML file we made
- It will read the XML file and setup the configuration according to the XML config.

## **3. Run Application**

- Stop tomcat
- Clean server
- Clean Eclipse Cache
- Maven Build
- Run as >> run on server

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/setting-up-spring-application-specifying-application-context-using-xml-part-3-85b25856f7bc)
