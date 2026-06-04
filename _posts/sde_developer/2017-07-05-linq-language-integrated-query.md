---
title: "LINQ ( Language Integrated Query )"
author: harshityadav95
date: 2017-07-05 00:00:00 +0530
categories: [SDE Developer]
tags: [csharp, linq, dotnet, notes]
---

## LINQ ( Language Integrated Query )

**What is LINQ ?**

Developers across the world have always encountered problems in querying data because of the lack of a defined path and need to master a multiple of technologies like SQL, Web Services, XQuery, etc.

Introduced in Visual Studio 2008 and designed by Anders Hejlsberg, LINQ (Language Integrated Query) allows writing queries even without the knowledge of query languages like SQL, XML etc. LINQ queries can be written for diverse data types.

## We Already have ADO.NET, so Why Another Data Access Technology?

Most applications work with data in one form or another, meaning that data is very important to the work we do as software engineers. It’s so important that the tools we use are constantly evolving, with the next generation building and improving upon the previous. This doesn’t change with LINQ, which is the next giant leap in data development technology beyond ADO.NET.

ADO.NET is an object-oriented library, yet we must still reason about data from a relational perspective. In simple scenarios, we can bind ADO.NET objects directly to user interfaces (UI), but many other situations require the translation of the ADO.NET data into business objects with relationships, rules, and semantics that don’t translate automatically from a relational data store. For example, a relational data store will model Orders and Customers with a foreign key from an Order table to a Customer table, but the object representation of this data is a Customer object with a collection of Order objects. Similar situations occur for other storage types such as hierarchical, multi-value, and flat data sources. This gap between the representation of data from storage site to the objects you use in your applications is called an*Impedence Mismatch*. While ADO.NET is an object library for working with relational data, LINQ is a SQL-like syntax that produces usable objects. LINQ helps reduce this Impedence Mismatch.

## LINQ Architecture in .NET

LINQ has a 3-layered architecture in which the uppermost layer consists of the language extensions and the bottom layer consists of data sources that are typically objects implementing IEnumerable<T> or IQueryable<T> generic interfaces. The architecture is shown below in Figure.

![Medium article image](/assets/img/posts/linq-language-integrated-query/medium-image-fcff0734aa5c.jpg)

## Query Expressions

Query expression is nothing but a LINQ query, expressed in a form similar to that of SQL with query operators like Select, Where and OrderBy. Query expressions usually start with the keyword “From”.

To access standard LINQ query operators, the namespace System.Query should be imported by default. These expressions are written within a declarative query syntax which was C# 3.0.

Example code :

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/linq-language-integrated-query-c8cb17b988ca)
