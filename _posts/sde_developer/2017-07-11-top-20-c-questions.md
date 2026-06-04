---
title: "Top 20 C#  Questions"
author: harshityadav95
date: 2017-07-11 00:00:00 +0530
categories: [SDE]
tags: [C, Microsoft Virtual Academy]
description: "Migrated from Blogger."
published: true
---

Topics To be Covered

![](/assets/img/posts/2017-07-12-top-20-c-questions/1_Rmgq-656SwSXU_y6S8A45g.png)

### **#1: When to Use a struct vs Class**

•structs are value types that can contain data and functions

•structs are value types and do not require heap allocation.

•structs directly store their data in the struct, classes store a reference to a dynamically allocated object.

•structs are useful for small data structures

•structs can affect performance

•Constructors are invoked with the new operator, but that does not allocate memory on the heap

•A struct constructor simply returns the struct value itself (typically in a temporary location on the stack), and this value is then copied as necessary

•With classes, multiple variables may have a reference to the same object

•It is possible for operations on one variable to affect the object referenced by the other variable.

•With structs, the variables each have their own copy of the data, and it is not possible for operations on one to affect the other.

•structs do not support user-specified inheritance, and they implicitly inherit from type object

### **#2: How would you count the occurrences of a string within a string?**

•The string type is a sealed class type that inherits directly from object. Instances of the string class represent Unicode character strings.

•Values of the string type can be written as string literals.

•The keyword string is simply an alias for the predefined class System.String so you can use string name = “Fred”; or String name = “Fred”;

•Likewise you can use string.Concat() or String.Concat()

•Use string for variable names

•Use String for class methods and reference

### **#3: Encrypt/Decrypt a String in .NET**

- Use C# inbuilt Cryptography Class (DES,RSA etc)

![](/assets/img/posts/2017-07-12-top-20-c-questions/1_B_RKENRhnhFRIJRxAbYB_A.png)

### **#4: How do I Make a Texbox that Only Accepts Numbers?**

- Use NumericUp Down
- Handle the KeyPress Event(Text.isDigit )
- Handle the Text_Changed Event (Not recommended)

### **#5: How Does One Parse XML Files?**

•Reference System.Xml

•Use XmlReader to parse the text string

•You will need to have an idea of the XML elements and attributes for this example

•Use the XmlReader methods to read the XML data

### **#6: How to Check if a Number is a Power of 2**

- Use Regex or foreach

### **#7: How do I Get the Index of the Current Iteration of a foreach Loop?**

- Maintain a counter and increment it manually
- Some collection type provide IndexOf()

### **#8: How do I Round a Decimal Value to 2 Places for Output?**

•Use string format specifiers

•(“#.##”)

•(“{0:0.00}”, value)

•(“n2”)

•(“{0:c}”, value)

### **#9: What is the Difference between String and string**

•The string type is a sealed class type that inherits directly from object. Instances of the string class represent Unicode character strings.

•Values of the string type can be written as string literals.

•The keyword string is simply an alias for the predefined class System.String so you can use string name = “Fred”; or String name = “Fred”;

•Likewise you can use string.Concat() or String.Concat()

•Use string for variable names

•Use String for class methods and reference

### **#10: C# Loop — break vs continue**

• Break will exit the loop completely, Continue will just skip the current iteration and then test the while statement again.

### **#11: How to Get My Own IP address in C#**

- check private IP address
- Use Dns.GetHostEntry , IPAddress and AddressList
- Ignore APIPA 16.254 starting address
- Check public IP address- Make External calls

![](/assets/img/posts/2017-07-12-top-20-c-questions/1_gM8kcC2d6UDysWPxD6yhsg.png)![](/assets/img/posts/2017-07-12-top-20-c-questions/1_TpczCZ9G6RuGHatDsBVPgg.png)

To Check Public IP address

### **#12: Remove Duplicates from an Array**

•Use LINQ (Use DistinctElement )

•Use a List

### **#13: How do I get the Application’s Path in a C# Console App?**

•Use reflection to get the executing assembly path

•Pass that the IO.Path.GetDirectoryName

### **#14: Difference Between abstract and virtual functions**

- Abstract Method have no implementation and MUST be overridden
- Virtual methods MAY have an implementation but are not requireed to and they can be overridden
- You cannot call base,method() for abstract but you can for virtual methods

### **#15: How do I Calculate Someone’s Age in C#?**

- Use Date Time Library built in c#
- Subtract birthday year from current Year

### **#16: How do I Sort a Dictionary by Value?**

•Use LINQ

•Sorts into a new object

### **#17: Calling base Constructor in C#**

•Reference: <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/base>

### **#18: Difference Between ref and out Keywords**

- ref causes an argument to be passed by reference not by value .It provides a reference to the source value and changes made in the method will be made by the source object
- arguments passed as ref must be initialized before thy are passed
- out alos cause the argument to be passed as reference. Changes made to the parameters are also changed in the source
- Arguments passed out do not have to be initialized first
- The called method must assign a value prior to the method return

### **#19: How do I get the String Value of an enum?**

- Use Enum.GetName()
- USe ToString

### **#20: How Can I Return Multiple Values From a Function in C#?**

•Using out parameters

•Using arrays or structs

- Consider finding min and max values in an array

*Reference :*[*https://stackoverflow.com/questions/tagged/c%23*](https://stackoverflow.com/questions/tagged/c%23)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/top-20-c-important-questions-8fab359fcc79)
