---
title: "Connecting C# to JSON"
author: harshityadav95
date: 2018-07-30 00:00:00 +0530
categories: [SDE Developer]
tags: [csharp, json, dotnet]
---

## Connecting C# to JSON

**JSON**(JavaScript Object Notation) is a lightweight data-interchange format.

Advantages :

•Easy for humans to read and write

•Language independent

•Same syntax as JavaScript Objects

- Can be used to store application data

JSON C# Libraries- •JavaScriptSerializer , JSON.NET

## **What is Serialization**

Serialization is the process of converting an object into a stream of bytes in order to store the object or transmit it to memory, a database, or a file. Its main purpose is to save the state of an object in order to be able to recreate it when needed. The reverse process is called deserialization.

![Medium article image](/assets/img/posts/connecting-c-sharp-to-json/medium-image-1f7488ca191c.gif)

Reference :[https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/serialization/](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/serialization/)

**What are JSON values**

•Strings •Numbers •True •False •Null •Objects• Arrays

## **JSON Objects**

•Name/value pairs using colons

•Enclosed by curly braces

•Pairs separated by commas

## **JSON Arrays**

•Values enclosed by brackets

•Separated by commas

[“value”, “value”,”value”,”value”,”value”]

## **Parsing JSON Files**

Add Reference: System.Web.Extension (ie usingSystem.web.Script.Serialization) , System.IO

Code :[https://github.com/harshityadav95/csharp_JSON](https://github.com/harshityadav95/csharp_JSON)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/connecting-c-to-json-8ff4d63bb8b1)
