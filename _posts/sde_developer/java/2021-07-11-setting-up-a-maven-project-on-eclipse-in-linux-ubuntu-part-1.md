---
title: "Setting up a Maven Project on Eclipse in Linux Ubuntu Part 1"
author: harshityadav95
date: 2021-07-11 00:00:00 +0530
categories: [Java]
tags: [java, maven, eclipse, ubuntu]
---

## Setting up a Maven Project on Eclipse in Linux Ubuntu Part 1

Check this video to get started with maven theory

1. **Check the version of Java Installed**

```
harshit@harshit-e430:~$ java --versionopenjdk 11.0.11 2021-04-20OpenJDK Runtime Environment (build 11.0.11+9-Ubuntu-0ubuntu2.20.04)OpenJDK 64-Bit Server VM (build 11.0.11+9-Ubuntu-0ubuntu2.20.04, mixed mode, sharing)
```

**2 .Check the version of JavaC installed**

```
harshit@harshit-e430:~$ javac --versionjavac 11.0.11
```

**3 .Download the Java Eclipse IDE for EE Developers**

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-3303deb98a3c.png)

**4 .Extract the application in Folder and run the application**

**5 .Click and Create Maven Project**

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-11035a467ccb.png)

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-a64722eceb00.png)

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-10b9b8e695b2.png)

**6. Download and setup the apache tomcat and extract in folder**

Link :[https://tomcat.apache.org/download-90.cgi](https://tomcat.apache.org/download-90.cgi)

**7. Right click on on the project go to Preference**

**8.Go to targeted runtime and select and directory in which the tomcat server in setup in and then click apply**

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-b0624989115f.png)

If you setting for the first time then Apache will not be available as option as shown below so go to new > select the version of tomcat you extracted in the folder >> and select the path and then click finish

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-eb0e4aaa268b.png)

**10. Project Facets**

Now go the project Facets and where the default version of java will be set to the 1.5 change it to the version you have installed in your machine

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-59f86831ace1.png)

**11 .Check the Java Compiler version that it is set to the latest version**

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-4fa8c9d3f707.png)

**12 .Next go to Java build path and select the Maven and JRE , NOT the apache as we dont need any tomcat specific library in the current build**

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-ff150268d242.png)

If there is some error check on the steps again and click apply on each step individually and at the end apply and close

You will end up something like this

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-dde6ae6b0261.png)

PS : Not sure about the Configuration problem will come back to it later or let me know why it shows as it runs with it also

Now to start the Maven application sample Boilerplate code to run “Hello World “

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-b7cf11bd5c34.png)

**13 .Select the version of Tomcat installed and Click Finish**

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-38fcda282822.png)

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-c89d1c6d4e6b.png)

**14 .If Everything went right you would see the Hello world displayed**

![Medium article image](/assets/img/posts/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-part-1/medium-image-341614fd2ead.png)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/setting-up-a-maven-project-on-eclipse-in-linux-ubuntu-137031102e31)
