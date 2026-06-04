---
title: "C# Week 1"
author: harshityadav95
date: 2020-05-03 00:00:00 +0530
categories: [SDE Developer]
tags: [csharp, dotnet, notes]
---

## C# Week 1

## What is Common Type System (CTS) means ?

This data type problem is solved in .NET using the Common Type System (CTS). The CTS defines the predefined data types available in IL so that all languages that target the .NET Framework can produce compiled code ultimately based on these types.

## What does Common Language Runtime (CLR) mean?

Common Language Runtime (CLR) is a managed execution environment that is part of Microsoft NET framework. CLR manages the execution of programs written in different supported languages.

CLR transforms source code into a form of bytecode known as**Common Intermediate Language (CIL).**At run time, CLR handles the execution of the CIL code.

The most important part of the .NET Framework is the .Net Common Language Runtime (CLR) also called .Net Runtime in short. It is a framework layer that resides above the Operating System and handles/manages the execution of the .NET applications. Our .Net programs don’t directly communicate with the Operating System but through CLR.

![Medium article image](/assets/img/posts/c-sharp-week-1/medium-image-86df22e3c16a.png)

![Medium article image](/assets/img/posts/c-sharp-week-1/medium-image-a7af86ff4f11.png)

## MSIL (Microsoft Intermediate Language) Code:

When we compile our .Net Program using any .Net compliant language like (C#, VB.NET, C++.NET) it does not get converted into the executable binary code but to an intermediate code, called MSIL or IL in short, understandable by CLR. MSIL is an OS and H/w independent code. When the program needs to be executed, this MSIL or intermediate code is converted to binary executable code, called native code. The presence of IL makes it possible the Cross Language Relationship as all the .Net compliant languages produce the similar standard IL code.

## Just In Time Compilers (JITers):

When our IL compiled code needs to be executed, CLR invokes JIT compilers which compile the IL code to native executable code (.exe or .dll) for the specific machine and OS. JITers in many ways are different from traditional compilers as they, as their name suggests, compile the IL to native code only when desired e.g., when a function is called, IL of function’s body is converted to native code; just in time of need. So, the part of code that is not used by particular run is not converted to native code. If some IL code is converted to native code then the next time when its needed to be used, the CLR uses the same copy without re-compiling. So, if a program runs for sometime, then it won’t have any just in time performance penalty. As JITers are aware of processor and OS exactly at runtime, they can optimize the code extremely efficiently resulting in very robust applications. Also, since JITer knows the exact current state of executable code, they can also optimize the code by in-lining small function calls (like replacing body of small function when its called in a loop, saving the function call time).

## Why C#

- The code written in C#, on compilation generates an ‘.exe’ or ‘.dll’ file which is also called Portable Executable file. These files contain MSIL (Microsoft Intermediate Language) code. As against this, the Java code on compilation generates a ‘.class’ file, which contains bytecode.
- Through C# we can easily call Windows API function and access COM components which is quite difficult in Java.
- C# has features like Properties and Indexers. These features are not available in the Java language.
- It has Lambdas and LINQ, therefore supporting a small amount of functional programming
- -> are two main fn possible in C# :[https://stackoverflow.com/questions/17607951/is-it-possible-to-have-more-than-one-main-method-in-a-c-sharp-program](https://stackoverflow.com/questions/17607951/is-it-possible-to-have-more-than-one-main-method-in-a-c-sharp-program)
- Java :[https://stackoverflow.com/questions/13399836/can-there-exist-two-main-methods-in-a-java-program](https://stackoverflow.com/questions/13399836/can-there-exist-two-main-methods-in-a-java-program)

## .NET Framework, .NET Standard and .NET Core ([link1](https://www.c-sharpcorner.com/article/difference-between-net-framework-and-net-core/),[link2](https://stackoverflow.com/questions/42939454/what-is-the-difference-between-net-core-and-net-standard-class-library-project/44861621))

## **.net assemblies**

The .NET assembly is the standard for components developed with the Microsoft.NET. Dot NET assemblies may or may not be executable, i.e., they might exist as the executable (.exe) file or dynamic link library (DLL) file

## Namespace and Classes

## Class Library

The .NET Framework class library is a library of classes, interfaces, and value types that provide access to system functionality ,[link](https://msdn.microsoft.com/en-us/library/gg145045%28v=vs.110%29.aspx)

## **csproj, .sln file**

1: GUIDs are used in enterprise software development in C#, Java, and C++ as database keys, component identifiers, or just about anywhere else a truly unique identifier is required. GUIDs are also used to identify all interfaces and objects in COM programming.

Basically the .csproj file contains the list of files in your project, plus the references to system assemblies etc.

There are a whole bunch of settings — Visual Studio version, project type, Assembly name, Application Icon, Target Culture, Installation Url,…

Everything you need to build your project. While you could assume that you need everything in the current folder, having an explicit list allows you to organise them logically both on the disk and in the project so you can more easily find the files you want.

It’s just XML so you can open it in your favourite text editor and take a look.

## .SLN file

The .sln file contains text-based information the environment uses to find and load the name-value parameters for the persisted data and the project VSPackages it reference

**PDB**is an abbreviation for**P**rogram**D**ata**B**ase. As the name suggests, it is a repository (persistent storage as databases) to maintain information required to run your program in debug mode. It contains many important relevant information required while you debug your code (in Visual Studio), for e.g. at what points you have inserted break points where you expect the debugger to break in Visual Studio.

**.dll**A DLL file, short for*Dynamic Link Library*, is a type of[file](https://www.lifewire.com/what-is-a-file-2625878)that contains instructions that other programs can call upon to do certain things. This way, multiple programs can share the abilities programmed into a single file, and even do so simultaneously

The`obj`folder holds**object, or intermediate, files**, which are compiled binary files that haven't been linked yet. They're essentially fragments that will be combined to produce the final executable. The compiler generates one object file for each source file, and those files are placed into the`obj`folder.

The`bin`folder holds**binary files**, which are the actual executable code for your application or library.

**Managed Unmanaged code**

- [> https://www.c-sharpcorner.com/uploadfile/puranindia/managed-code-and-unmanaged-code-in-net/](https://www.c-sharpcorner.com/uploadfile/puranindia/managed-code-and-unmanaged-code-in-net/)

## **DataTypes:**

![Medium article image](/assets/img/posts/c-sharp-week-1/medium-image-f7971cbe8458.png)

## *Iteration Statements*

1. do
2. for
3. foreach
4. in
5. while

## **Boxing Unboxing**

![Medium article image](/assets/img/posts/c-sharp-week-1/medium-image-5ca7698113b2.png)

## **Implicit and Explicit Type Conversion**

> Normal Datatypes + conversion in classes[link](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/types/casting-and-type-conversions)

## **Value Types**

The value types consist of two main categories:+

- [Structs](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/struct)(can have parameterised constructor but not possible without parameters)
- [Enumerations](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/enum)

Structs fall into these categories:

- Numeric types
- [Integral types](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/integral-types-table)
- [Floating-point types](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/floating-point-types-table)
- [decimal](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/decimal)
- b[ool](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/bool)
- User defined structs.

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/c-week-1-aa4cf5940157)
