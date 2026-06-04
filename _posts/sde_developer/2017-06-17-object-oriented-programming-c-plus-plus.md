---
title: "Object Oriented Programming (C++ )"
author: harshityadav95
date: 2017-06-17 00:00:00 +0530
categories: [SDE Developer]
tags: [cplusplus, oop, programming, notes]
---

## Object Oriented Programming (C++ )

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-83de55cb7fbe.jpg)

O**BJECTIVE:**Providing a sound conceptual understanding of the fundamental concepts of computing hardware, software, networking and services; build programming logic and thereby developing skills in problem solving using C++ programming language; Introduce the concept of object orientation and on how to handle data in different forms; Emphasize the concepts and constructs rather than on language features.

**C++ Standard Libraries**

The C++[standard](https://en.wikipedia.org/wiki/Standardization)consists of two parts:

1.the[core language](https://en.wikipedia.org/wiki/Core_language)and the standard library. C++ programmers expect the latter on every major implementation of C++; it includes[vectors](https://en.wikipedia.org/wiki/Sequence_container_%28C%2B%2B%29#Vector), lists, maps,[algorithms](https://en.wikipedia.org/wiki/Algorithm)(find, for_each, binary_search, random_shuffle, etc.), sets, queues, stacks, arrays, tuples, input/output facilities ([iostream](https://en.wikipedia.org/wiki/Iostream), for reading from and writing to the console and files),[smart pointers](https://en.wikipedia.org/wiki/Smart_pointers)for automatic memory management,[regular expression](https://en.wikipedia.org/wiki/Regular_expression)support,[multi-threading](https://en.wikipedia.org/wiki/Multithreading_%28software%29)library, atomics support (allowing a variable to be read or written to by at most one thread at a time without any external synchronisation), time utilities (measurement, getting current time, etc.), a system for converting error reporting that doesn’t use C++[exceptions](https://en.wikipedia.org/wiki/Exception_handling)into C++[exceptions](https://en.wikipedia.org/wiki/Exception_handling), a[random number generator](https://en.wikipedia.org/wiki/Random_number_generator)and a slightly modified version of the[C standard library](https://en.wikipedia.org/wiki/C_standard_library)(to make it comply with the C++ type system).

A large part of the C++ library is based on the[Standard Template Library (STL)](https://en.wikipedia.org/wiki/Standard_Template_Library). Useful tools provided by the STL include[containers](https://en.wikipedia.org/wiki/Container_%28data_structure%29)as the collections of objects (such as[vectors](https://en.wikipedia.org/wiki/Array_data_structure)and[lists](https://en.wikipedia.org/wiki/Linked_list)),[iterators](https://en.wikipedia.org/wiki/Iterator)that provide array-like access to containers, and[algorithms](https://en.wikipedia.org/wiki/Algorithm)that perform operations such as searching and sorting.

Furthermore, (multi)maps ([associative arrays](https://en.wikipedia.org/wiki/Associative_array)) and (multi)sets are provided, all of which export compatible interfaces. Therefore, using templates it is possible to write generic algorithms that work with any container or on any sequence defined by iterators.

**Basics Of Typics C++ Environment**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-40c18921adb9.jpg)

**What are Preprocessor Directives ?**

The preprocessors are the directives, which give instructions to the compiler to preprocess the information before actual compilation starts.

1. All preprocessor directives begin with #, and only white-space characters may appear before a preprocessor directive on a line.
2. Preprocessor directives are not C++ statements, so they do not end in a semicolon (;).
3. You already have seen a #include directive in all the examples. This macro is used to include a header file into the source file.
4. There are number of preprocessor directives supported by C++ like #include, #define, #if, #else, #line, etc. Let us see important directives

**Types of Pre-Processor**:

1. #define : #define PI 3.146
2. #define : #define <iostream>
3. #define MIN(a,b) (((a)<(b)) ? a : b)
4. #ifdef DEBUG  
cerr <<”Variable x = “ << x << endl;  
#endif

**What are Macros**?**& Pre Defined C++ macos**

A**macro**is a fragment of code which has been given a name. Whenever the name is used, it is replaced by the contents of the**macro**.

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-e506613fae43.png)

**Header Files :**

**Header**files contain definitions of Functions and Variables, which is imported or used into any**C++**program by using the pre-processor #include statement.**Header**file have an extension “.h” which contains**C++**function declaration and macro definition.

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-1355c4612923.png)

**What are Namespaces ?**

A**namespace**is designed to overcome this difficulty and is used as additional information to differentiate similar functions, classes, variables etc. with the same name available in different libraries. Using namespace, you can define the context in which names are defined

Same situation can arise in your C++ applications. For example, you might be writing some code that has a function called xyz() and there is another library available which is also having same function xyz(). Now the compiler has no way of knowing which version of xyz() function you are referring to within your code.

![Namespace Example](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-8e3d8aa26cd2.png)

_Namespace Example_

**Different version of C++**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-1cfc6362a108.png)

**Unit -2**

**Object Oriented Programming Language :**

***O****bject-****o****riented****p****rogramming*(**OOP**) refers to a type of computer programming (software design) in which[programmers](http://www.webopedia.com/TERM/P/programmer.html)define not only the[data type](http://www.webopedia.com/TERM/D/data_type.html)of a[data structure](http://www.webopedia.com/TERM/D/data_structure.html), but also the types of operations ([functions](http://www.webopedia.com/TERM/F/function.html)) that can be applied to the data structure.

In this way, the data structure becomes an[object](http://www.webopedia.com/TERM/O/object.html)that includes both[data](http://www.webopedia.com/TERM/D/data.html)and functions. In addition, programmers can create relationships between one object and another. For example, objects can inherit characteristics from other objects

**Is c++ Object oreinted …Object based or what ?**

![C++ is a hybrid object based language](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-d010ecd15b64.png)

_C++ is a hybrid object based language_

**Encapsulation :**

Encapsulation is an Object Oriented Programming concept that binds together the**data +functions**that manipulate the data, and that keeps both safe from outside interference and misuse.

**Access Modifiers:**

**C++**uses the three**modifiers**called public , protected , and private

**Controlling Access to Class:**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-49497db000fc.png)

**Polymorphism :**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-5223b8f869b9.png)

**Operator Overloading in c++**

Operator functions are same as normal functions. The only differences are, name of an operator function is always operator keyword followed by symbol of operator and operator functions are called when the corresponding operator is used.

**Inheritance :**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-70e2f0acdf19.jpg)

Method Overriding:

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-2f6bab004617.png)

**Abstract Class :**

**Abstract classes**are**classes**that contain one or more**abstract**methods. An**abstract**method is a method that is declared, but contains no implementation.**Abstract classes**may not be instantiated, and require subclasses to provide implementations for the**abstract**methods.

**Comparison with Java**  
In Java, a class can be made abstract by using abstract keyword. Similarly a function can be made pure virtual or abstract by using abstract keyword. See  
[Abstract Classes in Java](http://www.geeksforgeeks.org/abstract-classes-in-java/)for more details.

**Interface vs Abstract Classes:**  
An interface does not have implementation of any of its methods, it can be considered as a collection of method declarations. In C++, an interface can be simulated by making all methods as pure virtual. In Java, there is a separate keyword for interface.

## **Unit -3**

**What are Structures in C++ ?**

C/C++ arrays allow you to define variables that combine several data items of the same kind but**structure**is another user defined data type which allows you to combine data items of different kinds.

**Difference between structure and classes**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-b79ffa0d54e4.png)

**Structure Syntax :**

```
struct Books {   char  title[50];   char  author[50];   char  subject[100];   int   book_id;}book;
```

Members of Structure are accessed using the dot[.] operator

## **Scope of Class**

A member function of a class is a function that has its definition or its prototype within the class definition like any other variable. It operates on any object of the class of which it is a member, and has access to all the members of a class for that object.

Let us take previously defined class to access the members of the class using a member function instead of directly accessing them:

```
class Box {   public:      double length;         // Length of a box      double breadth;        // Breadth of a box      double height;         // Height of a box      double getVolume(void);// Returns box volume};
```

Member functions can be defined within the class definition or separately using**scope resolution operator, ::**. Defining a member function within the class definition declares the function**inline**, even if you do not use the inline specifier. So either you can define**getVolume()**function as below:

```
class Box {   public:      double length;      // Length of a box      double breadth;     // Breadth of a box      double height;      // Height of a box         double getVolume(void) {         return length * breadth * height;      }};
```

If you like you can define same function outside the class using**scope resolution operator, ::**as follows:

```
double Box::getVolume(void) {   return length * breadth * height;}
```

## **Separating Interface from implementation**

A very common coding practice is to separate the interface of a class from the implementation of its member functions through the use of`.h`and`.cpp`files on a per-class basis. So`class Foo`would be realised with a`Foo.h`header file and a corresponding`Foo.cpp`file.

This is often thrown out of the window in the special case of generic classes and instead[header-only](http://en.wikipedia.org/wiki/Header-only)libraries are used to keep the compiler happy even though it does clutter the interface file with implementation details.

This has the advantage of better separating interface and implementation coupled with the further benefit of actually compiling

Link :[https://stackoverflow.com/questions/18917318/c-generic-classes-separating-interface-and-implementation](https://stackoverflow.com/questions/18917318/c-generic-classes-separating-interface-and-implementation)

## **Constructors**

- Default Constructor.
- Parametrized Constructor.
- Copy COnstructor.

## Destructors

A**destructor**is a special member function of a class that is executed whenever an object of it’s class goes out of scope or whenever the delete expression is applied to a pointer to the object of that class.

A destructor will have exact same name as the class prefixed with a tilde (~) and it can neither return a value nor can it take any parameters. Destructor can be very useful for releasing resources before coming out of the program like closing files, releasing memories etc.

## **Constant Member Functions**

The idea of const functions is not allow them to modify the object on which they are called.

## Constant objects of a class

Once a const class object has been initialized via constructor, any attempt to modify the member variables of the object is disallowed, as it would violate the const-ness of the object. This includes both changing member variables directly (if they are public), or calling member functions that set the value of member variables.

## **Friend Function in C++**

A`friend`function is a function that is not a member of a class but has access to the class's private and protected members. Friend functions are not considered class members; they are normal external functions that are given special access privileges. Friends are not in the class's scope, and they are not called using the member-selection operators (**.**and –**>**) unless they are members of another class. A`friend`function is declared by the class that is granting access. The`friend`declaration can be placed anywhere in the class declaration. It is not affected by the access control keywords.

```
#include <iostream>    using namespace std;  class Point  {      friend void ChangePrivate( Point & );  public:      Point( void ) : m_i(0) {}      void PrintPrivate( void ){cout << m_i << endl; }    private:      int m_i;  };    void ChangePrivate ( Point &i ) { i.m_i++; }    int main()  {     Point sPoint;     sPoint.PrintPrivate();     ChangePrivate(sPoint);     sPoint.PrintPrivate();  // Output: 0             1  }
```

Link :[Friend Function and class documentation](https://msdn.microsoft.com/en-us/library/465sdshe.aspx)

## **This Pointer in c++**

The ‘this’ pointer is passed as a hidden argument to all nonstatic member function calls and is available as a local variable within the body of all nonstatic functions. ‘this’ pointer is a constant pointer that holds the memory address of the current object. ‘this’ pointer is not available in static member functions as static member functions can be called without any object (with class name).  
For a class X, the type of this pointer is ‘X* const’.

Link :[Geeks for geeks reference document](http://www.geeksforgeeks.org/this-pointer-in-c/)

## **Dynamic Memory Allocation**

Memory in your C++ program is divided into two parts:

- **The stack:**All variables declared inside the function will take up memory from the stack.
- **The heap:**This is unused memory of the program and can be used to allocate the memory dynamically when program runs.

You can allocate memory at run time within the heap for the variable of a given type using a special operator in C++ which returns the address of the space allocated. This operator is called**new**operator.

If you are not in need of dynamically allocated memory anymore, you can use**delete**operator, which de-allocates memory previously allocated by new operator.

## **Static Class Members**

Classes can contain static member data and member functions. When a data member is declared as**static**, only one copy of the data is maintained for all objects of the class. (For more information, see[Static Member Functions](https://msdn.microsoft.com/en-us/library/yyh8hetw.aspx).

## **Proxy Classes**

A proxy class in C++ is used to implement the[Proxy Pattern](http://en.wikipedia.org/wiki/Proxy_pattern)in which an object is an interface or a mediator for some other object.

A typical use of a proxy class in C++ is implementing the [] operator since the [] operator may be used to get data or to set data within an object. The idea is to provide a proxy class which allows for the detection of a get data use of the [] operator versus the set data use of the [] operator. The [] operator of a class uses the proxy object to assist

A proxy is a class that provides a modified interface to another class. Here is an example — suppose we have an array class that we only want to be able to contain the binary digits 1 or 0. Here is a first try:

```
struct array1 {    int mArray[10];    int & operator[](int i) {      /// what to put here    }}; `
```

We want operator[] to complain if we say something like a[1] = 42, but that isn’t possible because the operator only sees the index of into the array, not the value being stored.

We can solve this using a proxy:

```
#include <iostream>using namespace std;
```

```
struct aproxy {    aproxy(int& r) : mPtr(&r) {}    void operator = (int n) {        if (n > 1) {            throw "not binary digit";        }        *mPtr = n;    }    int * mPtr;};
```

```
struct array {    int mArray[10];    aproxy operator[](int i) {        return aproxy(mArray[i]);    }};
```

```
int main() {    try {        array a;        a[0] = 1;   // ok        a[0] = 42;  // throws exception    }    catch (const char * e) {        cout << e << endl;    }}
```

The proxy class now does our checking for a binary digit and we make the array’s operator[] return an instance of the proxy which has limited access to the array’s internals.

## **Unit -4**

## **Rules for operator Overloading**

Every programmer knows the concept of operation overloading in C++. Although it looks simple to redefine the operators in operator overloading, there are certain restrictions and limitation in overloading the operators. Some of them are listed below:

1. Only existing operators can be overloaded. New operators cannot be overloaded.

2. The overloaded operator must have at least one operand that is of user defined type.

3. We cannot change the basic meaning of an operator. That is to say, We cannot redefine the plus(+) operator to subtract one value from the other.

4. Overloaded operators follow the syntax rules of the original operators. They cannot be overridden.

5. There are some operators that cannot be overloaded like size of operator(sizeof), membership operator(.), pointer to member operator(.*), scope resolution operator(::), conditional operators(?:) etc

6. We cannot use “friend” functions to overload certain operators.However, member function can be used to overload them. Friend Functions can not be used with assignment operator(=), function call operator(()), subscripting operator([]), class member access operator(->) etc.

7. Unary operators, overloaded by means of a member function, take no explicit arguments and return no explicit values, but, those overloaded by means of a friend function, take one reference argument (the object of the relevent class).

8. Binary operators overloaded through a member function take one explicit argument and those which are overloaded through a friend function take two explicit arguments.

9. When using binary operators overloaded through a member function, the left hand operand must be an object of the relevant class.

10. Binary arithmetic operators such as +,-,* and / must explicitly return a value. They must not attempt to change their own arguments.

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-40c91a332a82.png)

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-3a51d4f58039.png)

## **Overloading with Friend Function**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-e5de2e3c047d.png)

Link:[Source](https://gradestack.com/Programming-in-C-/Operator-Overloading-and/Overloading-with-friend/21201-4331-50035-study-wtw)

**Operator functions as class members vs as friend functions**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-a291d1cd0473.jpg)

## Input/Output operators overloading in C++

C++ is able to input and output the built-in data types using the stream extraction operator >> and the stream insertion operator <<. The stream insertion and stream extraction operators also can be overloaded to perform input and output for user-defined types like an object.

Here, it is important to make operator overloading function a friend of the class because it would be called without creating an object.

Following example explains how extraction operator >> and insertion operator <<.

```
#include <iostream>using namespace std; class Distance {   private:      int feet;             // 0 to infinite      int inches;           // 0 to 12   public:      // required constructors      Distance(){         feet = 0;         inches = 0;      }      Distance(int f, int i){         feet = f;         inches = i;      }      friend ostream &operator<<( ostream &output,          const Distance &D ) {          output << "F : " << D.feet << " I : " << D.inches;         return output;                  }
```

```
      friend istream &operator>>( istream  &input, Distance &D ) {          input >> D.feet >> D.inches;         return input;                  }};
```

```
int main() {   Distance D1(11, 10), D2(5, 11), D3;
```

```
   cout << "Enter the value of object : " << endl;   cin >> D3;   cout << "First Distance : " << D1 << endl;   cout << "Second Distance :" << D2 << endl;   cout << "Third Distance :" << D3 << endl;
```

```
   return 0;}
```

## **Unit -5**

## **Advantages and Disadvantage of Inheritance**

Advantages of inheritance are as follows:

- Inheritance promotes reusability. When a class inherits or derives another class, it can access all the functionality of inherited class.
- Reusability enhanced reliability. The base class code will be already tested and debugged.
- As the existing code is reused, it leads to less development and maintenance costs.
- Inheritance makes the sub classes follow a standard interface.
- Inheritance helps to reduce code redundancy and supports code extensibility.
- Inheritance facilitates creation of class libraries.

Disadvantages of inheritance are as follows:

- Inherited functions work slower than normal function as there is indirection.
- Improper use of inheritance may lead to wrong solutions.
- Often, data members in the base class are left unused which may lead to memory wastage.
- Inheritance increases the coupling between base class and derived class. A change in base class will affect all the child classes.

## **Protected Members in C++**

A**protected**member variable or function is very similar to a private member but it provided one additional benefit that they can be accessed in child classes which are called derived classes.

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-f0c764887dca.png)

## **Casting Base Class pointers to derived class pointers (Upcasting and Down casting process )**

Upcasting and downcasting are an important part of C++. Upcasting and downcasting gives a possibility to build complicated programs with a simple syntax. It can be achieved by using Polymorphism.

C++ allows that a derived class pointer (or reference) to be treated as base class pointer. This is upcasting.

Downcasting is an opposite process, which consists in converting base class pointer (or reference) to derived class pointer.

Upcasting and downcasting should not be understood as a simple casting of different data types. It can lead to a great confusion.

Link :[**Detailed explnation to upcasting and down casting**](https://www.tutorialcup.com/cplusplus/upcasting-downcasting.htm)

## **Overriding Base Class Member in derived Class (?????)**

<need to checkout later >

## **Public , Private & Protected Inheritance in C++**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-2a4b00639f18.png)

## **Constructor and Destructor in derived Class**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-a42cf41eb569.png)

## **Implicit Derived class object to base class object conversion**

<need to checkout later >[thins same as upcasting and downcasting ]

## **Composition vs inheritance**

**what is composition ?**

**Composition**is the process of making one class a data member of another class.

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-79cd076402b0.png)

## **Virtual functions**

Consider the following simple program which is an example of runtime polymorphism.  
The main thing to note about the program is, derived class function is called using a base class pointer. The idea is,[virtual functions](http://en.wikipedia.org/wiki/Virtual_function)are called according to the type of object pointed or referred, not according to the type of pointer or reference. In other words, virtual functions are resolved late, at runtime.

**What is the use?**  
Virtual functions allow us to create a list of base class pointers and call methods of any of the derived classes without even knowing kind of derived class object. For example, consider a employee management software for an organization, let the code has a simple base class*Employee*, the class contains virtual functions like*raiseSalary()*,*transfer()*,*promote()*,.. etc. Different types of employees like*Manager*,*Engineer*, ..etc may have their own implementations of the virtual functions present in base class*Employee*. In our complete software, we just need to pass a list of employees everywhere and call appropriate functions without even knowing the type of employee. For example, we can easily raise salary of all employees by iterating through list of employees. Every type of employee may have its own logic in its class, we don’t need to worry because if*raiseSalary()*is present for a specific employee type, only that function would be called.

**How does compiler do this magic of late resolution?**  
Compiler maintains two things to this magic:

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-2bd0dd07f274.png)

[***vtable:***](http://en.wikipedia.org/wiki/Virtual_method_table)A table of function pointers. It is maintained per class.  
[***vptr:***](http://en.wikipedia.org/wiki/Virtual_method_table#Implementation)A pointer to vtable. It is maintained per object (See[this](http://geeksquiz.com/c-virtual-functions-question-12/)for an example).

Compiler adds additional code at two places to maintain and use*vptr*.  
**1)**Code in every constructor. This code sets vptr of the object being created. This code sets*vptr*to point to*vtable*of the class.  
**2)**Code with polymorphic function call (e.g.*bp->show()*in above code). Wherever a polymorphic call is made, compiler inserts code to first look for*vptr*using base class pointer or reference (In the above example, since pointed or referred object is of derived type, vptr of derived class is accessed). Once*vptr*is fetched,*vtable*of derived class can be accessed. Using*vtable*, address of derived derived class function*show()*is accessed and called.

**Is this a standard way for implementation of run-time polymorphism in C++?**  
The C++ standards do not mandate exactly how runtime polymophism must be implemented, but compilers generally use minor variations on the same basic model.

Link :[Virtual function on geeks for geeks](http://www.geeksforgeeks.org/virtual-functions-and-runtime-polymorphism-in-c-set-1-introduction/)

## **Abstract vs Concrete Class**

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-4aff1b44592c.png)

## **Late Binding in C++**

In C++, late binding (also called “dynamic binding”) normally happens when the`virtual`keyword is used in a method's declaration. C++ then creates a so-called virtual table, which is a look-up table for such functions that will always be consulted when they are called.[[5]](https://en.wikipedia.org/wiki/Late_binding#cite_note-5)Usually, the "late binding" term is used in favor of "[dynamic dispatch](https://en.wikipedia.org/wiki/Dynamic_dispatch)".

## **Virtual Destructors**

Deleting a derived class object using a pointer to a base class that has a non-virtual destructor results in undefined behavior. To correct this situation, the base class should be defined with a virtual destructor.

For example, following program results in undefined behavior. Although the output of following program may be different on different compilers, when compiled using Dev-CPP, it prints following.  
*Constructing base  
Constructing derived  
Destructing base*

Making base class destructor virtual guarantees that the object of derived class is destructed properly, i.e., both base class and derived class destructors are called. For example, following program prints:  
*Constructing base  
Constructing derived  
Destructing derived  
Destructing base*

## **Unit -6**

## **File Handling in C++**

<Copy from tutorials point …need re checking >

So far, we have been using the**iostream**standard library, which provides**cin**and**cout**methods for reading from standard input and writing to standard output respectively.

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-39b041b61563.png)

This tutorial will teach you how to read and write from a file. This requires another standard C++ library called**fstream**, which defines three new data types:

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-03930566ddee.png)

Data TypeDescriptionofstreamThis data type represents the output file stream and is used to create files and to write information to files.ifstreamThis data type represents the input file stream and is used to read information from files.fstreamThis data type represents the file stream generally, and has the capabilities of both ofstream and ifstream which means it can create files, write information to files, and read information from files.

To perform file processing in C++, header files <iostream> and <fstream> must be included in your C++ source file.

## Opening a File

A file must be opened before you can read from it or write to it. Either the**ofstream**or**fstream**object may be used to open a file for writing and ifstream object is used to open a file for reading purpose only.

Following is the standard syntax for open() function, which is a member of fstream, ifstream, and ofstream objects.

```
void open(const char *filename, ios::openmode mode);
```

Here, the first argument specifies the name and location of the file to be opened and the second argument of the**open()**member function defines the mode in which the file should be opened.

![Medium article image](/assets/img/posts/object-oriented-programming-c-plus-plus/medium-image-88285e86cca9.png)

Mode FlagDescriptionios::appAppend mode. All output to that file to be appended to the end.ios::ateOpen a file for output and move the read/write control to the end of the file.ios::inOpen a file for reading.ios::outOpen a file for writing.ios::truncIf the file already exists, its contents will be truncated before opening the file.

You can combine two or more of these values by**OR**ing them together. For example if you want to open a file in write mode and want to truncate it in case it already exists, following will be the syntax:

```
ofstream outfile;outfile.open("file.dat", ios::out | ios::trunc );
```

Similar way, you can open a file for reading and writing purpose as follows:

```
fstream  afile;afile.open("file.dat", ios::out | ios::in );
```

## Closing a File

When a C++ program terminates it automatically closes flushes all the streams, release all the allocated memory and close all the opened files. But it is always a good practice that a programmer should close all the opened files before program termination.

Following is the standard syntax for close() function, which is a member of fstream, ifstream, and ofstream objects.

```
void close();
```

## Writing to a File

While doing C++ programming, you write information to a file from your program using the stream insertion operator (<<) just as you use that operator to output information to the screen. The only difference is that you use an**ofstream**or**fstream**object instead of the**cout**object.

## Reading from a File

You read information from a file into your program using the stream extraction operator (>>) just as you use that operator to input information from the keyboard. The only difference is that you use an**ifstream**or**fstream**object instead of the**cin**object.

## Read & Write Example

Following is the C++ program which opens a file in reading and writing mode. After writing information inputted by the user to a file named afile.dat, the program reads information from the file and outputs it onto the screen:

```
#include <fstream>#include <iostream>using namespace std; int main () {       char data[100];
```

```
   // open a file in write mode.   ofstream outfile;   outfile.open("afile.dat");
```

```
   cout << "Writing to the file" << endl;   cout << "Enter your name: ";    cin.getline(data, 100);
```

```
   // write inputted data into the file.   outfile << data << endl;
```

```
   cout << "Enter your age: ";    cin >> data;   cin.ignore();      // again write inputted data into the file.   outfile << data << endl;
```

```
   // close the opened file.   outfile.close();
```

```
   // open a file in read mode.   ifstream infile;    infile.open("afile.dat");     cout << "Reading from the file" << endl;    infile >> data;
```

```
   // write the data at the screen.   cout << data << endl;      // again read the data from the file and display it.   infile >> data;    cout << data << endl;
```

```
   // close the opened file.   infile.close();
```

```
   return 0;}
```

When the above code is compiled and executed, it produces the following sample input and output:

```
$./a.outWriting to the fileEnter your name: ZaraEnter your age: 9Reading from the fileZara9
```

Above examples make use of additional functions from cin object, like getline() function to read the line from outside and ignore() function to ignore the extra characters left by previous read statement.

## File Position Pointers

Both**istream**and**ostream**provide member functions for repositioning the file-position pointer. These member functions are**seekg**(“seek get”) for istream and**seekp**(“seek put”) for ostream.

The argument to seekg and seekp normally is a long integer. A second argument can be specified to indicate the seek direction. The seek direction can be**ios::beg**(the default) for positioning relative to the beginning of a stream,**ios::cur**for positioning relative to the current position in a stream or**ios::end**for positioning relative to the end of a stream.

The file-position pointer is an integer value that specifies the location in the file as a number of bytes from the file’s starting location. Some examples of positioning the “get” file-position pointer are:

```
// position to the nth byte of fileObject (assumes ios::beg)fileObject.seekg( n );
```

```
// position n bytes forward in fileObjectfileObject.seekg( n, ios::cur );
```

```
// position n bytes back from end of fileObjectfileObject.seekg( n, ios::end );
```

```
// position at end of fileObjectfileObject.seekg( 0, ios::end );
```

## **Unit-7**

## **Function Templates**

Templates are the foundation of generic programming, which involves writing code in a way that is independent of any particular type.

A template is a blueprint or formula for creating a generic class or a function. The library containers like iterators and algorithms are examples of generic programming and have been developed using template concept.

There is a single definition of each container, such as**vector**, but we can define many different kinds of vectors for example,**vector <int>**or**vector <string>**.

The general form of a template function definition is shown here:

```
template <class type> ret-type func-name(parameter list) {   // body of function}
```

Here, type is a placeholder name for a data type used by the function. This name can be used within the function definition.

The following is the example of a function template that returns the maximum of two values:

```
#include <iostream>#include <string>
```

```
using namespace std;
```

```
template <typename T>inline T const& Max (T const& a, T const& b)  {    return a < b ? b:a; }
```

```
int main () {    int i = 39;   int j = 20;   cout << "Max(i, j): " << Max(i, j) << endl;
```

```
   double f1 = 13.5;    double f2 = 20.7;    cout << "Max(f1, f2): " << Max(f1, f2) << endl;
```

```
   string s1 = "Hello";    string s2 = "World";    cout << "Max(s1, s2): " << Max(s1, s2) << endl;
```

```
   return 0;}
```

If we compile and run above code, this would produce the following result:

```
Max(i, j): 39Max(f1, f2): 20.7Max(s1, s2): World
```

## **Overloading Function Templates**

You may overload a function template either by a non-template function or by another function template.

If you call the name of an overloaded function template, the compiler will try to deduce its template arguments and check its explicitly declared template arguments. If successful, it will instantiate a function template specialization, then add this specialization to the set of*candidate functions*used in overload resolution. The compiler proceeds with overload resolution, choosing the most appropriate function from the set of candidate functions. Non-template functions take precedence over template functions. The following example describes this:

```
#include <iostream>using namespace std;
```

```
template<class T> void f(T x, T y) { cout << "Template" << endl; }
```

```
void f(int w, int z) { cout << "Non-template" << endl; }
```

```
int main() {   f( 1 ,  2 );   f('a', 'b');   f( 1 , 'b');}
```

The following is the output of the above example:

```
Non-templateTemplateNon-template
```

The function call f(1, 2) could match the argument types of both the template function and the non-template function. The non-template function is called because a non-template function takes precedence in overload resolution.

The function call f(‘a’, ‘b’) can only match the argument types of the template function. The template function is called.

Argument deduction fails for the function call f(1, ‘b’); the compiler does not generate any template function specialization and overload resolution does not take place. The non-template function resolves this function call after using the standard conversion from char to int for the function argument ‘b’.

## **Class Template Function**

## Class Template

Just as we can define function templates, we can also define class templates. The general form of a generic class declaration is shown here:

```
template <class type> class class-name {   .   .   .}
```

Here,**type**is the placeholder type name, which will be specified when a class is instantiated. You can define more than one generic data type by using a comma-separated list.

Following is the example to define class Stack<> and implement generic methods to push and pop the elements from the stack:

```
#include <iostream>#include <vector>#include <cstdlib>#include <string>#include <stdexcept>
```

```
using namespace std;
```

```
template <class T>class Stack{  private:    vector<T> elements;
```

```
  public:    void push(T const &);    void pop();    T top();    bool empty();};
```

```
template <class T>void Stack<T>::push(T const &elem) {    elements.push_back(elem);}
```

```
template <class T>void Stack<T>::pop() {    if (elements.empty()) {        throw out_of_range("Stack<>::pop(): empty stack");    } else {        elements.pop_back();    }}
```

```
template <class T>T Stack<T>::top() {    if (empty()) {        throw out_of_range("Stack<>::top(): empty stack");    }    return elements.back();}
```

```
template <class T>bool Stack<T>::empty() {    return elements.empty();}
```

```
int main() {    try {        Stack<int> intStack;       // stack of ints        Stack<string> stringStack; // stack of strings
```

```
        // manipulate integer stack        intStack.push(7);        cout << intStack.top() << endl;
```

```
        // manipulate string stack        stringStack.push("hello");        cout << stringStack.top() << std::endl;        stringStack.pop();        stringStack.pop();    }    catch (exception const &ex) {        cerr << "Exception: " << ex.what() << endl;        return -1;    }}
```

If we compile and run above code, this would produce the following result:

```
7helloException: Stack<>::pop(): empty stack
```

## Class template & non type parameters

A non-type template argument provided within a template argument list is an expression whose value can be determined at compile time. Such arguments must be constant expressions, addresses of functions or objects with external linkage, or addresses of static class members. Non-type template arguments are normally used to initialize a class or to specify the sizes of class members.

For non-type integral arguments, the instance argument matches the corresponding template parameter as long as the instance argument has a value and sign appropriate to the parameter type.

For non-type address arguments, the type of the instance argument must be of the form*identifier*or &*identifier*, and the type of the instance argument must match the template parameter exactly, except that a function name is changed to a pointer to function type before matching.

The resulting values of non-type template arguments within a template argument list form part of the template class type. If two template class names have the same template name and if their arguments have identical values, they are the same class.

In the following example, a class template is defined that requires a non-type template int argument as well as the type argument:

```
template<class T, int size> class Myfilebuf{      T* filepos;      static int array[size];public:      Myfilebuf() { /* ... */ }      ~Myfilebuf();      advance(); // function defined elsewhere in program};
```

In this example, the template argument size becomes a part of the template class name. An object of such a template class is created with both the type argument T of the class and the value of the non-type template argument size.

An object x, and its corresponding template class with arguments double and size=200, can be created from this template with a value as its second template argument:

```
Myfilebuf<double,200> x;
```

x can also be created using an arithmetic expression:

```
Myfilebuf<double,10*20> x;
```

The objects created by these expressions are identical because the template arguments evaluate identically. The value 200 in the first expression could have been represented by an expression whose result at compile time is known to be equal to 200, as shown in the second construction.

Link :[IBM Knowledge support on c++](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.1.0/com.ibm.zos.v2r1.cbclx01/template_non-type_arguments.htm)

## **Templates and Inheritance**

Templates may be used in many combinations with inheritance. It is possible to combine inheritance and templates because a template class is a class, albeit one with a parameter. Combining these language features allows the parameterization ability of templates to be used in conjunction with the specializing abilities of inheritance. Four combinations of templates and inheritance are presented in this section:

- a template class that inherits from another template class,
- a non-template class that inherits from a template class,
- a template class that inherits from a non-template class, and
- a template class that uses multiple inheritance.

Link :[Elaboration of above points](http://www.prenhall.com/divisions/esm/app/kafura/secure/chapter7/html/7.5_inheritance.htm)

Link :[Template & Inheritance](https://blog.feabhas.com/2014/06/template-inheritance/)

## **Template and Friends**

There are four kinds of relationships between classes and their friends when templates are involved:

- *One-to-many*: A non-template function may be a friend to all template class instantiations.
- *Many-to-one*: All instantiations of a template function may be friends to a regular non-template class.
- *One-to-one*: A template function instantiated with one set of template arguments may be a friend to one template class instantiated with the same set of template arguments. This is also the relationship between a regular non-template class and a regular non-template friend function.
- *Many-to-many*: All instantiations of a template function may be a friend to all instantiations of the template class.

The following example demonstrates these relationships:

```
class B{   template<class V> friend int j();}
```

```
template<class S> g();
```

```
template<class T> class A {   friend int e();   friend int f(T);   friend int g<T>();   template<class U> friend int h();};
```

Link :[IBM Knowledge center](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.1.0/com.ibm.zos.v2r1.cbclx01/friends_and_templates.htm)

## **Template and Static Members**

**Function templates and static variables:**  
Each instantiation of function template has its own copy of local static variables. For example, in the following program there are two instances:*void fun(int )*and*void fun(double )*. So two copies of static variable*i*exist.

Link :[Geeks for geeks](http://www.geeksforgeeks.org/templates-and-static-variables-in-c/)

## **Exception Handling in C++**

One of the advantages of C++ over C is Exception Handling. C++ provides following specialized keywords for this purpose.

*try*: represents a block of code that can throw an exception.

*catch*: represents a block of code that is executed when a particular exception is thrown.

*throw*: Used to throw an exception. Also used to list the exceptions that a function throws, but doesn’t handle itself.

**Why Exception Handling?**

Following are main advantages of exception handling over traditional error handling.

***1)****Separation of Error Handling code from Normal Code:*In traditional error handling codes, there are always if else conditions to handle errors. These conditions and the code to handle errors get mixed up with the normal flow. This makes the code less readable and maintainable. With try catch blocks, the code for error handling becomes separate from the normal flow.

***2)****Functions/Methods can handle any exceptions they choose:*A function can throw many exceptions, but may choose to handle some of them. The other exceptions which are thrown, but not caught can be handled by caller. If the caller chooses not to catch them, then the exceptions are handled by caller of the caller.  
In C++, a function can specify the exceptions that it throws using the throw keyword. The caller of this function must handle the exception in some way (either by specifying it again or catching it)

***3)****Grouping of Error Types:*In C++, both basic types and objects can be thrown as exception. We can create a hierarchy of exception objects, group exceptions in namespaces or classes, categorize them according to types.

Link :[Exception handling from geeks from geeks](http://www.geeksforgeeks.org/exception-handling-c/)

## **Rethrowing Exception in C++**

If a catch block cannot handle the particular exception it has caught, you can rethrow the exception. The rethrow expression (throw without*assignment_expression*) causes the originally thrown object to be rethrown.

Because the exception has already been caught at the scope in which the rethrow expression occurs, it is rethrown out to the next dynamically enclosing try block. Therefore, it cannot be handled by catch blocks at the scope in which the rethrow expression occurred. Any catch blocks for the dynamically enclosing try block have an opportunity to catch the exception.

Link :[IBM knowledge center](https://www.ibm.com/support/knowledgecenter/en/ssw_ibm_i_71/rzarg/cplr153.htm)

## **Exception Specification in C++**

C++ provides a mechanism to ensure that a given function is limited to throw only a specified list of exceptions. An exception specification at the beginning of any function acts as a guarantee to the function’s caller that the function will throw only the exceptions contained in the exception specification.

For example, a function:

```
void translate() throw(unknown_word,bad_grammar) { /* ... */ }
```

explicitly states that it will only throw exception objects whose types are unknown_word or bad_grammar, or any type derived from unknown_word or bad_grammar.

Link :[IBM Knowledge Support](https://www.ibm.com/support/knowledgecenter/en/SSGH3R_12.1.0/com.ibm.xlcpp121.aix.doc/language_ref/cplr156.html)

## Unexpected Specifications in C++

The C++ Standard requires that**unexpected**is called when a function throws an exception that is not on its throw list. The current implementation does not support this. The example calls**unexpected**directly, which calls the unexpected handler.

The function calls an unexpected handler, a function of type**void**. If**unexpected**is called directly by the program, the unexpected handler is the one most recently set by a call to[set_unexpected](https://msdn.microsoft.com/en-us/library/7twc8dwy.aspx).

An unexpected handler may not return to its caller. It may terminate execution by:

- Throwing an object of a type listed in the exception specification or an object of any type if the unexpected handler is called directly by the program.
- Throwing an object of type[bad_exception](https://msdn.microsoft.com/en-us/library/cfk14b20.aspx).
- Calling[terminate](https://msdn.microsoft.com/en-us/library/8kt08e62.aspx),**abort**or**exit**(**int**).

At program startup, the unexpected handler is a function that calls[terminate](https://msdn.microsoft.com/en-us/library/8kt08e62.aspx).

Link :[MSDN](https://msdn.microsoft.com/en-us/library/awbt5tew.aspx)

## **Stack Unwinding In C++**

The process of removing function entries from function call stack at run time is called[Stack Unwinding](http://en.wikipedia.org/wiki/Call_stack#Unwinding). Stack Unwinding is generally related to Exception Handling. In C++, when an exception occurs, the function call stack is linearly searched for the exception handler, and all the entries before the function with exception handler are removed from the function call stack. So exception handling involves Stack Unwinding if exception is not handled in same function (where it is thrown).

Link :[Geeks for Geeks](http://www.geeksforgeeks.org/stack-unwinding-in-c/)

Link :[IBM Knowledge Center](https://www.ibm.com/support/knowledgecenter/en/SSB27U_6.3.0/com.ibm.zos.r12.cbclx01/cplr155.htm)

Link :[MSDN](https://msdn.microsoft.com/en-us/library/hh254939.aspx)

## **Constructor and Destructor Exception handling**

## When an exception is thrown and control passes to a catch block following a try block, destructors are called for all automatic objects constructed since the beginning of the try block directly associated with that catch block. If an exception is thrown during construction of an object consisting of subobjects or array elements, destructors are only called for those subobjects or array elements successfully constructed before the exception was thrown. A destructor for a local static object will only be called if the object was successfully constructed.

If a destructor detects an exception and issues a throw , the exception can be caught if the caller of the destructor was contained within a try block and an appropriate catch is coded.

If an exception is thrown by a function called from an inner try block, but caught by an outer try block (because the inner try block did not have an appropriate handler), all objects constructed within both the outer and all inner try blocks are destroyed. If the thrown object has a destructor , the destructor is not called until the exception is caught and handled.

Because a throw expression throws an object and a catch statement can catch an object, the object thrown enables error-related information to be transferred from the point at which an exception is detected to the exception’s handler. If you throw an object with a constructor, you can construct an object that contains information relevant to the catch expression. The catch block can then access information provided by the thrown object.

Exception handling can be used in conjunction with constructors and destructors to provide resource management that ensures that all locked resources are unlocked when an exception is thrown.When an exception is thrown and control passes to a catch block following a try block, destructors are called for all automatic objects constructed since the beginning of the try block directly associated with that catch block. If an exception is thrown during construction of an object consisting of subobjects or array elements, destructors are only called for those subobjects or array elements successfully constructed before the exception was thrown. A destructor for a local static object will only be called if the object was successfully constructed.

If a destructor detects an exception and issues a throw , the exception can be caught if the caller of the destructor was contained within a try block and an appropriate catch is coded.

If an exception is thrown by a function called from an inner try block, but caught by an outer try block (because the inner try block did not have an appropriate handler), all objects constructed within both the outer and all inner try blocks are destroyed. If the thrown object has a destructor , the destructor is not called until the exception is caught and handled.

Because a throw expression throws an object and a catch statement can catch an object, the object thrown enables error-related information to be transferred from the point at which an exception is detected to the exception’s handler. If you throw an object with a constructor, you can construct an object that contains information relevant to the catch expression. The catch block can then access information provided by the thrown object.

Exception handling can be used in conjunction with constructors and destructors to provide resource management that ensures that all locked resources are unlocked when an exception is thrown.

Link :[Website](https://caligari.dartmouth.edu/doc/ibmcxx/en_US/doc/language/ref/rndexcp.htm)

## Inheritance and Exception handling

If both base and derived classes are caught as exceptions then catch block of derived class must appear before the base class.

If we put base class first then the derived class catch block will never be reached. For example, following C++ code prints*“Caught Base Exception”*

Link :[Geeks for geeks](http://www.geeksforgeeks.org/g-fact-60/)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/object-oriented-programming-c-d242601be045)
