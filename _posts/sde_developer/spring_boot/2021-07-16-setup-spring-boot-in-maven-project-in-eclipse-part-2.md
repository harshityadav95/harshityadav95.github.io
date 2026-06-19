---
title: "Setup Spring Boot in Maven Project in Eclipse Part 2"
author: harshityadav95
date: 2021-07-16 00:00:00 +0530
categories: [SDE Developer, Spring Boot]
tags: [spring-boot, maven, eclipse, java]
---

## Setup Spring Boot in Maven Project in Eclipse Part 2

## 1. Clean

Clean the Server Instance

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-c6c176fc0c70.png)

## 2. pom.xml

Go to the File pom.xml of the project and add the following dependencies below the existing “junit” dependency already created when creating a maven , to add more dependencies or latest dependencies go to[MVNRepository](https://mvnrepository.com/), search for the dependency you want to add it will give yout snippet to add that dependency

Link :[https://mvnrepository.com/](https://mvnrepository.com/)

```
<dependency>
```

```
<groupId>org.springframework</groupId>
```

```
<artifactId>spring-webmvc</artifactId>
```

```
<version>5.3.8</version>
```

```
</dependency>
```

```
<dependency>
```

```
<groupId>javax.servlet</groupId>
```

```
<artifactId>javax.servlet-api</artifactId>
```

```
<version>4.0.1</version>
```

```
<scope>provided</scope>
```

```
</dependency>
```

```
<dependency>
```

```
<groupId>javax.servlet</groupId>
```

```
<artifactId>jstl</artifactId>
```

```
<version>1.2</version>
```

```
</dependency>
```

## 3. home.jsp

In the created project go to directory

```
/<Project Name >/src/main/webapp/WEB-INF
```

and rename the existing index.jsp-> home.jsp with the following code replacing the default hello world template

```
<!Doctype html PUBLIC >
```

```
<html>
```

```
<head>
```

```
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
```

```
pageEncoding="ISO-8859-1" isELIgnored="false"%>
```

```
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
```

```
<title>Spring MVC Page</title>
```

```
</head>
```

```
<body>
```

```
<h1>Welcome to Spring MVC !</h1>
```

```
<span>Using programmatic application context and controllers</span>
```

```
</body>
```

```
</html>
```

## 4. Create New Class

Create a new class that will specify the application context of this app this is going to be a java class in the java folder at the following location and create a new java class named “ ApplicationContextConfiguration”

```
<projectname>/main/java
```

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-5eae43cdac52.png)

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-1725c2750f33.png)

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-c8d96b75c781.png)

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-2d003dc39b79.png)

### Application Context

Spring configuration file which holds the Bean definition for our spring app

- This is the file that hold the bean definition for our spring app
- These are property that apply as a whole and are not specific to Spring MVC
- We are defining these file pro grammatically then creating it using XML configuration

## **5. Import Libraries**

Add the following libraries to the package

```
import org.springframework.context.annotation.Bean;
```

```
import org.springframework.context.annotation.Configuration;
```

```
import org.springframework.web.servlet.mvc.Controller;
```

```
import org.springframework.web.servlet.view.InternalResourceViewResolver;
```

so that it looks like this

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-a2f09dac8585.png)

## 6. @Configuration

Any programmatic configuration in java has to be annotated with @Configuration , annotation

- It is part of Core spring framework
- This indicates that this class has the BEAN methods
- The Spring framework will look for classes tagged with  
“@” and pick up the bean defination from this class

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-2575c34df736.png)

## **7. Specifying the Bean**

- The Bean specified is “viewResolver”
- View resolver can be thought of as logical mapping from view names to specific kind of view this allows to render views without being tied to specific view technology
- By Always specifying views within the app with their logical names rather then physical implementation allows us to decouple app from how views are actually implemented

```
@Bean(name="viewResolver")
```

Any time there is need for viewResolver within our application this internal resource viewResolver is what will be injected into that object.

- Mapping a logical view to actual view is role of view resolver

```
viewResolver.setPrefix("/");
```

The directory corresponds to root director that is “ WEB-INF” folder

```
viewResolver.setSuffix(".jsp");
```

Suffix for all views pages

the whole class will look like this:

## **8. MessageDisplayController Class**

Create the class same way as created in the previous step just this time name the class as the “ MessageDisplayController”

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-9a476229c660.png)

This is going to be MessageControl object that will handle the incoming web request from our web application users , access the model update the model state if needed and respond with corresponding view

- Setup the libraries within the controller

```
import javax.servlet.http.HttpServletRequest;
```

```
import javax.servlet.http.HttpServletResponse;
```

```
import org.springframework.web.servlet.ModelAndView;
```

```
import org.springframework.web.servlet.mvc.Controller;
```

- Have this controller implement Controller Interface is an explicit specification

```
public class MessageDisplayController implements Controller {}
```

- Any class implementing this interface should be able to handle http web request in a thread safe manner
- Notice the input arguments are http servlet request and http servlet response
- View simply return the model to be rendered using the

```
return new ModelAndView(“home”);
```

- The ModelAndView in MVC contain the model map as well as a view
- The name of the view is simply “home”
- This model will be recieved by the dispatcher servlet to be rendered

```
@Override
```

```
public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
```

```
{
```

```
return new ModelAndView("home");
```

```
}
```

## 9. Setting Controller Bean

Next in the ApplicationContextConfiguration.java class add the following bean

```
@Bean(name="/")
```

```
public Controller getMessageDisplayController()
```

```
{
```

```
return new MessageDisplayController();
```

```
}
```

- Returns the object of the controller interface instantiated
- / corresponds the the root of the web application
- This is the handler mapping
- Any request made to the root of the web application , will be given to this controller to handle that request

## 10. Setup the WebServletConfiguration

Create Another Class in the java/main folder name WebServletConfiguration

And add in the following libraries

```
import javax.servlet.ServletContext;
```

```
import javax.servlet.ServletException;
```

```
import javax.servlet.ServletRegistration;
```

```
import org.springframework.web.WebApplicationInitializer;
```

```
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
```

```
import org.springframework.web.servlet.DispatcherServlet;
```

- These libraries are spring specific not Spring MVC specific
- This is the class we are going to use programatically configure the servlet

add the following inheritance

```
implements WebApplicationInitializer
```

- It allows to configure server context programmatically
- Any implementation of this web application initializer interface is automatically detected by the spring servlet container
- It will be included as the bootstrap process for the servlet container

```
@Override
```

```
public void onStartup(ServletContext ctx) throws ServletException {
```

```
AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
```

```
appContext.register(ApplicationContextConfiguration.class);
```

```
ServletRegistration.Dynamic servlet = ctx.addServlet("dispatcher", new DispatcherServlet(appContext));
```

```
servlet.setLoadOnStartup(1);
```

```
servlet.addMapping("/");
```

```
}
```

- onStartup is part of webInitializer startup interface
- Servlet context will be inject into the spring
- On startup of the application register the context of the application
- In Spring MVC Application we need to explicitly register the dispatcher servlet

The code for this class will look like this

```
public class WebServletConfiguration  implements WebApplicationInitializer{
```

```
@Override
```

```
public void onStartup(ServletContext ctx) throws ServletException {
```

```
AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
```

```
appContext.register(ApplicationContextConfiguration.class);
```

```
ServletRegistration.Dynamic servlet = ctx.addServlet("dispatcher", new DispatcherServlet(appContext));
```

```
servlet.setLoadOnStartup(1);
```

```
servlet.addMapping("/");
```

```
}
```

```
}
```

## **11. Now to Build the Application**

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-111fd9071cfc.png)

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-12d74ff9fbb5.png)

## **12 . Update Maven Project**

![Medium article image](/assets/img/posts/setup-spring-boot-in-maven-project-in-eclipse-part-2/medium-image-10eb8b1d2f50.png)

- Clean Server
- Run Maven Build
- Refresh and check “Target” Folder to see the new Build files created
- Lookout for <applicationName>.war file
- Under controller folder there will be .class folder for every file in the project
- Can Also Clean Eclipse Cache from top bar >> project >> clean
- Run the Server , on tomacat

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/setup-spring-boot-in-maven-project-in-eclipse-part-2-d3687f8334eb)
