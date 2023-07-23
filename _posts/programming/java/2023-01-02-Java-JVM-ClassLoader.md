---
title: JVM Class Loader Notes
author: harshityadav95
date: 2023-01-02 00:00:00 +0530
categories: [java]
tags: [java,jvm]

---

# Class Loader in Java: Notes

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Class%20Loader%20in%20Java%20Notes/Untitled.png)

The Java ClassLoader is a part of the Java Runtime Environment that dynamically loads Java classes into the Java Virtual Machine.

JVM doesn't need to know about the underlying files or file systems in order to run Java programs thanks to class loaders.

- Java ClassLoader is an abstract class
- It belongs to a java.lang package
- It loads classes from different resources.
- Java ClassLoader is used to load the classes at run time.

Java classes aren’t loaded into memory all at once, but when required by an application. At this point, the **Java ClassLoader is called by the JRE,** and these ClassLoaders load classes into memory dynamically.

- When we request to load a class, it delegates the class to its parent.
- In this way, uniqueness is maintained in the runtime environment. It is essential to execute a Java program.

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Class%20Loader%20in%20Java%20Notes/Untitled%201.png)

Java ClassLoader is based on three principles: **Delegation**, **Visibility**, and **Uniqueness**.

- **Delegation principle:** It forwards the request for class loading to parent class loader. It only loads the class if the parent does not find or load the class.
- **Visibility principle:** It allows child class loader to see all the classes loaded by parent ClassLoader. But the parent class loader cannot see classes loaded by the child class loader.
- **Uniqueness principle:** It allows to load a class once. It is achieved by delegation principle. It ensures that child ClassLoader doesn't reload the class, which is already loaded by the parent.

## When classes are loaded

There are only two cases:

- When the new byte code is executed.
- When the byte code makes a static reference to a class. For example, **System.out**.

# Static vs. Dynamic Class Loading

- Classes are statically loaded with "new" operator.
- Dynamic class loading invokes the functions of a class loader at run time by using Class.forName() method.

# Types of ClassLoader

In Java, every ClassLoader has a predefined location from where they load class files. There are following types of ClassLoader in Java:

```java
class Demo {
    public static void main(String[] args) {
        System.out.println("Demo World");

        System.out.println("Classloader of ArrayList:"
                + ArrayList.class.getClassLoader());

        System.out.println("Classloader of Demo:"
                + Demo.class.getClassLoader());

    }

}
```

As we can see, there are three different class loaders here: application, extension, and bootstrap (displayed as null).

```java
Class loader of this class:sun.misc.Launcher$AppClassLoader@18b4aac2
Class loader of Logging:sun.misc.Launcher$ExtClassLoader@3caeaf62
Class loader of ArrayList:null
```

- The application class loader loads the class where the example method is contained. **An application or system class loader loads our own files in the classpath.**
- Next, the extension class loader loads the *Logging* class. **Extension class loaders load classes that are an extension of the standard core Java classes.**
- Finally, the bootstrap class loader loads the *ArrayList* class. **A bootstrap or primordial class loader is the parent of all the others.**

However, we can see that for the ArrayList, it displays null in the output. This is because the **bootstrap class loader is written in native code**, not Java, so it doesn't show up as a Java class. 

As a result, the behavior of the bootstrap class loader will differ across JVMs.

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Class%20Loader%20in%20Java%20Notes/Untitled%202.png)

## 1. **Bootstrap Class Loader:**

- The bootstrap class loader is rigidly defined in the JVM and loads class files according to the specification.
- First, the Java Virtual Machine determines whether the bootstrap class loader has already been recorded as an initiating loader of a class or interface
- Java Virtual Machine passes the argument N to an invocation of a method on the bootstrap class loader to search for a purported representation of Class in a platform-dependent manner.
- a class or interface will be represented using a file in a hierarchical file system, and the name of the class or interface will be encoded in the pathname of the file.
- **If no purported representation of C is found, loading throws an instance of `ClassNotFoundException`.**
- It loads standard JDK class files from rt.jar and other core classes.
- **It is a parent of all class loaders.**
- It doesn't have any parent. When we call String.class.getClassLoader() it returns null, and any code based on it throws NullPointerException.
- question is, who loads the java.lang.ClassLoader itself? ****
    
    **This is where the bootstrap or primordial class loader comes into play.**
    
- It is also called Primordial ClassLoader. It loads class files from jre/lib/rt.jar. For example, java.lang package class.
- **This bootstrap class loader is part of the core JVM and is written in native code,**

## 2. **Extensions Class Loader:**

- The extension class loader is a child of the bootstrap class loader, and takes care of loading the extensions of the standard core Java classes so that they're available to all applications running on the platform.
- It delegates class loading request to its parent. If the loading of a class is unsuccessful, it loads classes from jre/lib/ext directory or any other directory as java.ext.dirs.
- The extension class loader loads from the JDK extensions directory, usually the $JAVA_HOME/lib/ext directory, or any other directory mentioned in the java.ext.dirs system property.
- It is implemented by sun.misc.Launcher$ExtClassLoader in JVM.

## 3. **System Class Loader:**

- It loads application specific classes from the CLASSPATH environment variable.
- It can be set while invoking program using -cp or classpath command line options.
- It's also a child of the extensions class loader.
- It is a child of Extension ClassLoader. It is implemented by sun.misc.Launcher$AppClassLoader class.
- All Java ClassLoader implements java.lang.ClassLoader.

# How ClassLoader works in Java

- Class loaders are part of the Java Runtime Environment.
- When the JVM requests a class, the class loader tries to locate the class and load the class definition into the runtime using the **fully qualified class name**.
- When JVM request for a class, it invokes a loadClass() method of the java.lang.ClassLoader class by passing the fully classified name of the class. The loadClass() method calls for findLoadedClass() method to check that the class has been already loaded or not.
- It is required to avoid loading the class multiple times.
- If the class is already loaded, it delegates the request to parent ClassLoader to load the class.
- If the ClassLoader is not finding the class, it invokes the findClass() method to look for the classes in the file system.

The following diagram shows how ClassLoader loads class in Java using delegation.

![Untitled](https://raw.githubusercontent.com/harshityadav95/staticfiles/main/Class%20Loader%20in%20Java%20Notes/Untitled%203.png)

### Example of Class Loader Working

Suppose that we have an application-specific class Demo.class. 

1. The request for loading of this class files transfers to Application ClassLoader. 
2. It delegates to its parent Extension ClassLoader. 
3. Further, it delegates to Bootstrap ClassLoader. Bootstrap search that class in rt.jar and since that class is not there. 
4. Now request transfer to Extension ClassLoader which searches for the directory jre/lib/ext and tries to locate this class there.
5.  If the class is found there, Extension ClassLoader loads that class. Application ClassLoader never loads that class. When the extension ClassLoader does not load it, then Application ClaasLoader loads it from CLASSPATH in Java.

Visibility principle states that child ClassLoader can see the class loaded by the parent ClassLoader, **but vice versa is not true.**

- It means if Application ClassLoader loads Demo.class, in such case, trying to load Demo.class explicitly using Extension ClassLoader throws java.lang.ClassNotFoundException.

According to the uniqueness principle, a class loaded by the parent should not be loaded by Child ClassLoader again. So, it is possible to write class loader which violates delegation and uniqueness principles and loads class by itself.

In short, class loader follows the following rule:

- It checks if the class is already loaded.
- If the class is not loaded, ask parent class loader to load the class.
- If the parent class loader cannot load class, attempt to load it in this class loader.

### Code Example :

create a file classloader.java

```java
class Demo {
    public static void main(String[] args) {
        System.out.println("Demo World");

    }

}
```

Compile the code using

```java
$ javac classloader.java
$ java -verbose:class Demo

# -verbose:class: It is used to display the information about classes being loaded by JVM. It is useful when using class loader for loading classes dynamically. The following figure shows the output.
```

- We can observe that runtime classes required by the application class (Demo) are loaded first.

## **Methods of Java.lang.ClassLoader**

- [https://www.geeksforgeeks.org/classloader-in-java/](https://www.geeksforgeeks.org/classloader-in-java/)

## Custom Class Loader Use-Cases

Custom class loaders are helpful for more than just loading the class during runtime. A few use cases might include:

1. Helping to modify the existing bytecode, e.g. weaving agents
2. Creating classes dynamically suited to the user's needs, e.g. in JDBC, switching between different driver implementations is done through dynamic class loading.
3. Implementing a class versioning mechanism while loading different bytecodes for classes with the same names and packages. **This can be done either through a URL class loader (load jars via URLs) or custom class loaders.**
- Creating Custom Class Loader [Example](https://www.baeldung.com/java-classloaders#2-creating-our-custom-class-loader)
- It is open for vendor-specific implementation and can custom load classes via the *java.lang.Class* instance.
- Every user-defined class loader is an instance of a subclass of the abstract class ClassLoader.
- Applications employ user-defined class loaders in order to extend the manner in which the Java Virtual Machine dynamically loads and thereby creates classes.
- User-defined class loaders can be used to create classes that originate from user-defined sources.
- For example, **a class could be downloaded across a network, generated** on the fly, or extracted from an encrypted file.

I**f the class loader `L` is unable to load a class or interface denoted by `N` for any reason, it must throw an instance of `ClassNotFoundException`.**

- At run time, a class or interface is determined not by its name alone, but by a pair: [its binary name](https://docs.oracle.com/javase/specs/jvms/se7/html/jvms-4.html#jvms-4.2.1) + and its defining class loader.
- For example, the normal binary name of class Thread is java.lang.Thread. In the internal form used in descriptors in the class file format, a reference to the name of class Thread is implemented using a CONSTANT_Utf8_info structure representing the string java/lang/Thread.
- Each such class or interface belongs to a single *run-time package*
- The run-time package of a class or interface is determined by the package name and defining class loader of the class or interface.
- **If an error occurs during class loading, then an instance of a subclass of `LinkageError` must be thrown at a point in the program that (directly or indirectly) uses the class or interface being loaded.**

## ****Context Classloaders****

However, sometimes when JVM core classes need to dynamically load classes or resources provided by application developers, we might encounter a problem.

For example, in JNDI,(**Java Naming and Directory Interface**) the core functionality is implemented by the bootstrap classes in *rt.jar.* 

- But these JNDI classes may load JNDI providers implemented by independent vendors (deployed in the application classpath).
- This scenario calls for the bootstrap class loader (parent class loader) to load a class visible to the application loader (child class loader).
- The java.lang.Thread class has a method, getContextClassLoader(), that returns the ContextClassLoader for the particular thread. The ContextClassLoader is provided by the creator of the thread when loading resources and classes.

**J2SE delegation doesn't work here, and to get around this problem, we need to find alternative ways of class loading. This can be achieved using thread context loaders.**

# Difference between loadClass() and Class.forName()

- The loadClass() method loads only the class but does not initialize the object. While Class.forName() method initialize the object after loading it. For example, if you are using ClassLoader.loadClass() to load the JDBC driver, class loader does not allow to load JDBC driver.
- The java.lang.Class.forName() method returns the Class Object coupled with the class or interfaces with the given string name. It throws ClassNotFoundException if the class is not found.

## Reference

- [https://www.javatpoint.com/classloader-in-java](https://www.javatpoint.com/classloader-in-java)
- [https://www.baeldung.com/java-classloaders](https://www.baeldung.com/java-classloaders)
- [https://www.geeksforgeeks.org/classloader-in-java/](https://www.geeksforgeeks.org/classloader-in-java/)
- [https://www.baeldung.com/java-classloaders#context-classloaders](https://www.baeldung.com/java-classloaders#context-classloaders)
