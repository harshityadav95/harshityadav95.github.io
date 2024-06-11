---
title: How Variable Memory works inside Python
author: harshityadav95
date: 2024-06-01 00:00:00 +0530
categories: [Python]
tags: [Software Development, Interview Preparation]

---

## Video :
{% include embed/youtube.html id='0Om2gYU6clE' %}

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/47698935-e7be-4351-adc4-6fc4dd435ce6)

Notes :

## Everything is an Object in Python

The example we will be  using here is for the python interpreter written in C language (there are other Python interpreters written in different languages CPython,Jython, IronPython ,PyPy)

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/580ebb3e-8234-4e61-9c8f-35ded4e3304c)

1. PyObject is defined as a struct as C 

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/cef0b200-6d50-4dc7-88cc-9fd51bc7605f)

The pyObjects do not move around in memory and have fixed size and memory address, and when a reference is assigned to the memory its count increments from 0 to 1, and if no reference is pointing to the object then the reference count becomes zeros and the python memory manager periodically deletes such objects from the memory (Garbage collection)

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/f2a1c4db-11d7-4393-b3dd-678aaf4f971f)


1. When the same variable is assigned a different data type a different object is created that is assigned the string value 

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/a6776a9c-7dbd-4e7a-ad66-73fb0ed15feb)


1. Python does not have a variable as name binding and when a reference is removed the reference count of the object is decremented not the variable is deleted

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/f3a97d58-5a11-4c04-ab08-583388156300)


1. When del is used in python

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/edfe5525-c6a2-42a6-9b14-d7f667702aec)


1. Mutable and Immutable Objects in Python

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/a85a3cfb-97ac-4dfc-b771-5f41fcad41a9)


![Screenshot 2024-06-04 183139](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/88b523d0-bdd9-4da8-9090-4e86d9cca262)



## Lists in Python

- Lists can hold multiple values and there internal Objects can be changed
- Unlike PyObjects  lists are stored in PyVarObject (which is pyobject with an additional size field)
- Size field is used to store the number of objects the field holds
- Value will not directly store the value instead it will point to the memory location where the objects are stored

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/48994f95-58b3-4b79-a558-3e2426b3d226)



- For array indexing to work each element in the array must have the same size
- Pointer to any type string , integer etc will all have same size , this is why you can store different type of objects in the list in Python
- On a 64 but system, the size of the pointer is 64 bits or 8 bytes  same as before actual objects are created somewhere in the heap memory and they all will have the reference count of 1
- The list Object reference count will also be 1 initially

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/a6fde0c5-1850-4896-841e-39eaef90e7ca)


- When multiple reference points to the same object the reference count increases
- When a new object is added to the list a new pointer is added to array , so the size field of object is incremented

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/b00a9fbc-fb02-46e7-bb0d-2a12f223baee)


- The Backing array has fixed capacity which is basically contiguous memory allocated for
- When you keep adding elements to the list the array will get full data time and python allocates new memory usually twice the size of the existing array and moves items to the new array

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/2835f5de-60cc-4f97-b9ef-8c49e33b07ae)


Then, the Internal value pointer is also updated and the memory allocated to the older array is released 

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/6593af54-f549-425d-b8e8-ddd5e7e94fad)


- The Address of the pyvarriableobject never changes in the memory only the backing storage array is moved around in the memory

## When Copying list

- When copying list only the pointer are copied , actual objects are never moved and copy operations are cheap since pointers are small in size compared to the actual value of the object

## None in Python

- None is used to represent empty values or null pointer in Python
- Like everything else, none is also an object
- When x= None is executed a none object is created in the memory and x will be a reference to it
- When another y=None is done a new None object is not created and both x and y will both will point to the same None object

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/07e036dc-591a-4ebe-a5a1-e67675ae6628)



- this can be verified using built ID function in python to see what the reference is pointing towards (works in Cpython) concept of interning or using the same object

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/a2843181-34b6-450b-bfbc-d6fb40a54ca8)


- At start python pre-loads and caches a few most commonly used objects so it does not need to create them when needed
- Integers in the inclusive range of -5 to 256 are also interned so new objects are not created every time we use them
- If we are using a new value ie 257 that is not interned a new object is created for its reference

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/877dca39-7c4c-448c-91e3-0a1c3ddb53bd)


- In case of Strings that looks like function names are interned (some_string) the other strings are not interned in the current implementation of Python and may change in the future version of Python

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/1fb2bc63-e945-4bf6-b08e-b753386b28d8)


## Intern in Python

It is possible to intern custom strings using the intern function from the “sys” module 

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/b33fda9e-d035-48eb-aa55-81b7e964e3af)


## Difference between == and =

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/38b16a3a-18e9-4b1c-ab0c-fc554b79408c)


- == operator compares both list objects element by element
- “is”  keywords the object memory address
- If x and y reference to same object “is” will return true
- “is” keyword should be used to check if variable is none , since only one none object is ever created in python in python interpreter during the lifetime of the program

 

## How variables are passed to the function

- Objects are passed by reference to the function
- nums and my_list will point to the same list object

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/45e83786-2d6b-4e2a-ab48-7f0dce0065e3)



- Inside the function my_list will point to the new list

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/4c602857-5442-4ed9-8ce2-eeaa0fbc6ace)


- when the function goes out of scope new list will be removed by memory manager because there is no reference to it , so changing value inside function wont change the original nums
- To change the value inside the reference list use the methods provided by the data type
- Append 10 will point to the original nums

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/bc51c1a1-041a-4764-b772-c612ba63876e)


## Default Mutable Parameters

- Everything is an object in python including functions

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/c9f75284-8cb3-4eb9-9f56-a1d590aeeec4)


- Function is an object of function class and the function object is created at some memory address
- Function objects has a __ defaults __  attribute which stores the default value as a tuple

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/e72bc2e9-827f-4bff-b422-15d2da765a1a)


- consider a function object that is created in the memory, so when function def is created so a my_list attribute is created in the memory and its reference is stored in my_list attribute of the function object
- The function body is not evaluated at this point , it only happens when the function is called and both times called the reference is saved in the same memory

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/c59b1d69-8b95-477c-a86d-5f08616c00be)


- This mutable container type behavior is same for dictionary or anything else even for the mutable objects also work same if use int or boolean as there is no way to mutate their internal state
- Better approach is to use ‘None’ as the default value for the mutable objects and check in function using if statement

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/c0fd1e13-8f8c-47bf-915f-d2b96785592e)


## The += Operator

- it is same for other arithematic operators

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/a47d3ac8-70bd-4ce4-aa8b-40d023569dd8)


- Create two variables and check there identity
- Using only + Operator

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/d20c4aed-ea63-4cad-93c1-9d1892ed8866)


The original list remains unchanged 

- When += is used  the new elements are appended to the existing ones at the end of the list and both x and its copy will have the same memory reference

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/045e6056-271f-467c-bba9-48032413ea2a)


Reason for this behavior

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/9268e518-57f2-49b3-b000-109b61d888c0)


when += is used the python calls the underlying implementation which passes self as another reference to the same object to mutate the internal state of the object

## Why this understanding is useful ?

Without specifying a round bracket we are declaring a tuple with two elements, which can be verified using type function

- Tuples are immutable and cannot be changed once they are created
- Exception is raised when we try to modify the tuple

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/66348161-abde-45e9-a199-56caf0ae16e1)


another example where we can still modify the element inside a tuple which is a list, because there is a reference to another memory location

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/30045e48-abde-41c0-896a-5bb539036d86)


- When append is used only list is modified not the tuple

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/64ee0916-fe8b-473a-a03f-5f817f224564)


**Even its unexpected it still works**
