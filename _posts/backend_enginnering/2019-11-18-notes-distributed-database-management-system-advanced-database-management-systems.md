---
title: "[Notes]Distributed Database Management System , Advanced Database Management Systems"
author: harshityadav95
date: 2019-11-18 00:00:00 +0530
categories: [Backend Engineering]
tags: [distributed-database, database, notes]
---

## [Notes]Distributed Database Management System , Advanced

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-947c2a100873.png)

## **What are Distributed Databases ?**

We define a distributed database as a collection of multiple, logically interrelated databases distributed over a computer network. A distributed database management system (distributed DBMS) is then defined as the software system that permits the management of the distributed database and makes the distribution transparent to the users. Sometimes “distributed database system” (DDBS) is used to refer jointly to the distributed database and the distributed DBMS. The two important terms in these definitions are “logically interrelated” and “distributed over a computer network.”

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-60c99149e887.png)

**Advantages of Distributed Database :**

- Transparent Management of Distributed and Replicated Data
- Reliability Through Distributed Transactions
- Improved Performance
- Easier System Expansion

**Disadvantages of Distributed Database System**

- Design Issues
- Cost of Update Replication , and Syncronization
- Cost of Security Constraints
- Recover from Failure and Syncronization

## **Distributed Database Design Issues**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-3c2c01735ef5.png)

1. **Distributed database design**

There are two basic alternatives to placing data: partitioned (or non-replicated) and replicated.

2.**Distributed Directory Management**

A directory contains information (such as descriptions and locations) about data items in the database.

**3. Distributed Query Processing**

Query processing deals with designing algorithms that analyze queries and convert them into a series of data manipulation operations.

**4 .Distributed Concurrency Control**

Concurrency control involves the synchronization of accesses to the distributed data-base, such that the integrity of the database is maintained

**5. Distributed Deadlock Management**

The competition among users for access to a set of resources (data, in this  
case) can result in a deadlock if the synchronization mechanism is based on locking. The well-known alternatives of prevention, avoidance, and detection/recovery also apply to DDBSs

**6. Reliability of Distributed DBMS**

We mentioned earlier that one of the potential advantages of distributed systems is improved reliability and availability. This, however, is not a feature that comes, automatically. It is important that mechanisms be provided to ensure the consistency of the database as well as to detect failures and recover from them. The implication for DDBSs is that when a failure occurs and various sites become either inoperable or inaccessible, the databases at the operational sites remain consistent and up to date.

**7 . Replication**

If the distributed database is (partially or fully) replicated, it is necessary to implement protocols that ensure the consistency of the replicas,i.e., copies of the same data item have the same value.The Replication can be either eager or lazy

## **Distributed DBMS Architecture**

ANSI/SPARC Architecture

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-159442a8f396.png)

There are three views of data: the**external view,**which is that of the end user, who might be a programmer; the internal view, that of the system or machine; and the conceptual view, that of the enterprise

At the lowest level of the architecture is the**internal view,**which deals with the physical definition and organization of data

**Conceptual View**it is supposed to represent the data and the relationships among data without considering the requirements of individual applications or the restrictions of the physical storage media

## **Architectural Models for Distributed DBMSs**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-7e434518924c.png)

**Autonomy,**in this context, refers to the distribution of control, not of data. It indi- cates the degree to which individual DBMSs can operate independently.

1. **Design autonomy:**Individual DBMSs are free to use the data models and  
transaction management techniques that they prefer.
2. **Communication autonomy:**Each of the individual DBMSs is free to make its own decision as to what type of information it wants to provide to the other DBMSs or to the software that controls their global execution.
3. **Execution autonomy:**Each DBMS can execute the transactions that are sub- mitted to it in any way that it wants to.

**Distribution : P2P or Client Server**

**Heterogeneity**

Heterogeneity may occur in various forms in distributed systems, ranging from hardware heterogeneity and differences in networking protocols to variations in data managers. The important ones from the perspective of this book relate to data models, query languages, and transaction management protocols.

## **Components of a Distributed DBMS**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-3499bf299c16.png)

1. The user**interface handler**is responsible for interpreting user commands as they come in, and formatting the result data as it is sent to the user.
2. The**semantic data controlle**r uses the integrity constraints and authorizations that are defined as part of the global conceptual schema to check if the user query can be processed.
3. The**global query optimizer and decomposer**determines an execution strategy to minimize a cost function, and translates the global queries into local ones using the global and local conceptual schemas as well as the global directory. The global query optimizer is responsible, among other things, for generating the best strategy to execute distributed join operations.
4. The**distributed execution monitor coordinates**the distributed execution of the user request. The execution monitor is also called the distributed transaction manager. In executing queries in a distributed fashion, the execution monitors at various sites may, and usually do, communicate with one another.

Second Major Component

1. The local**query optimizer,**which actually acts as the access path selector, is responsible for choosing the best access path 5 to access any data item
2. The**local recovery manage**r is responsible for making sure that the local database remains consistent even when failures occur
3. The**run-time support processor**physically accesses the database according to the physical commands in the schedule generated by the query optimizer. The run-time support processor is the interface to the operating system and contains the database buffer (or cache) manager.

## **Distributed Database Design**

Top-Down Design Process

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-e4ed7c4faac7.png)

- Reasons for Fragmentation : Parallel Execution ,Level of Concurreny

**Degree of Fragmentation — Horizontal & Vertical**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-8d3449d3a6f3.png)

## **Hybrid Fragmentation**

![Hybrid =Horizontal + Vertical Fragmentaion](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-fe4df5b2b589.png)

_Hybrid =Horizontal + Vertical Fragmentaion_

Replications : Non-Replicated , Partially replicated ,Fully Replicated

**Correctness Rules of Fragmentation**

1. **Completeness.**If a relation instance R is decomposed into fragments F R = {R 1 , R 2 , . . . , R n }, each data item that can be found in R can also be found in one or more of R i ’s. This property, which is identical to the lossless de- composition property
2. **Reconstruction.**If a relation R is decomposed into fragments F R = {R 1 , R 2 , . . . , R n }, it should be possible to define a relational operator to reconstruct it back.
3. **Disjointness.**If a relation R is horizontally decomposed into fragments F R = {R 1 , R 2 , . . . , R n } and data item d i is in R j , it is not in any other fragment R k (k 6 = j).

## ***Baisc SQL and Relational***

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-57ad1ff841e2.gif)

## **1 .Selection**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-72985e2da2a0.jpg)

## **2. Projection : [eleminate duplicates only in relational not in SQL]**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-853ac4343605.jpg)

## **3. Union , Intersection and Set Difference**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-0559632589db.jpg)

## **Outer Join and Inner Join**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-e7e95392cee5.jpg)

Equi Join and Natural join

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-234444f667fc.jpg)

![Natural Join Example](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-997d6df04524.jpg)

_Natural Join Example_

![Equi Join Example](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-88700efdb7a8.gif)

_Equi Join Example_

**Semi Join :**

The**semi**-**join**is a**relational algebraic**operation that selects a set of tuples in one relation that. match one or more tuples of another relation on the**joining**domains

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-09fffd0d5c07.jpg)

Division :

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-ab696662c315.jpg)

## **Views In Distributed Database :**

Views in Centralized DBMSs

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-e9a3b6d683cb.png)

Evaluation Views from the Distributed relations may be costly use the Materialised View [a Materialsed view stores the tuples of a view in a relation like database, possibly with indices]

A materialized view is a copy of some base data and thus must be kept consistent with that base data which may be updated. View maintenance is the process of updating (or refreshing) a materialized view to reflect the changes made to the base data.

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-46fa6101a34d.png)

A Materialsed view in a relationtypically involves aggrgate function [sum, count, or average, or group by]

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-0ec243e8cc07.png)

## **Data Security In Distributed Database**

There are two main approaches to database access control

1. **Discretionary access control**(or authorization control) defines access rights based on the users, the type of access (e.g., SELECT, UPDATE) and the objects to be accessed.

Three main actors are involved in discretionary access control control:

1. subject (e.g., users, groups of users) who trigger the execution of application programs;
2. operations, (Select , update, insert or delete)
3. objects, on which the operations are performed (relations or attributes)

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-2503f1acd27e.png)

![Autorisation Matrix](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-3e649de1fc59.png)

_Autorisation Matrix_

**Limitations**

The main difficulty with this approach is that the revoking process must be  
recursive. For example, if A, who granted B who granted C the GRANT privilege on object O, wants to revoke all the privileges of B on O, all the privileges of C on O must also be revoked.

## **Multilevel Access Control**

Security levels arranged in Linear Order

- Top Secret [highest]
- Secret
- Confidential
- Unclassified [lowest]

**Bell and Lapaduda model**

1. A subject S is allowed to read an object of security level l only if level(S) ≥ l called the (No READ UP).
2. A subject S is allowed to write an object of security level l only if class(S) ≤ l , (no Write Down)

Example : Draw access level matrix based on Bell Model

## **Distributed Access Control**

The additional problems of access control in a distributed environment stem from the fact that objects and subjects are distributed and that messages with sensitive data can be read by unauthorized users.

These problems are:

1. remote user authentication,
2. management of discretionary access rules
3. handling of views and of user groups,
4. enforcing multilevel access control

Three solutions are possible for managing authentication:

1. Authentication information is maintained at a central site for global users  
which can then be authenticated only once and then accessed from multiple sites.
2. The information for authenticating users (user name and password) is repli-cated at all sites in the catalog. Local programs, initiated at a remote site, must also indicate the user name and password
3. All sites of the distributed DBMS identify and authenticate themselves similar to the way users do. Intersite communication is thus protected by the use of the site password. Once the initiating site has been authenticated, there is no need for authenticating their remote users.\

## **Semantic Integrity Control**

A database state is said to be consistent if the database satisfies a set of constraints, called semantic integrity constraints. Semantic integrity control ensures database consistency by rejecting update transactions that lead to inconsistent database states

1. **Structural constraints**express basic semantic properties  
inherent to a model. Examples of such constraints are unique key constraints in the relational model, or one-to-many associations between objects in the object-oriented model.
2. **Behavioral constraints**, on the other hand, regulate the application behavior. Thus they are essential in the database design process. They can express associations between objects, such as inclusion dependency in the relational model, or describe object properties and structures.

Various solutions have been investigated to design an integrity manager by com- bining optimization strategies.

1. limit the number of constraints that need to be enforced
2. decrease the number of data accesses to enforce a given constraint in the presence of an update transaction
3. define a preventive strategy that detects inconsistencies in a way that avoids undoing updates
4. perform as much integrity control as possible at compile time

## **Centralized Semantic Integrity Control**

**Specification of Integrity Constraints**

Integrity constraints should be manipulated by the database administrator using a high-level language

```
>> ENO NOT NULL IN EMP ;
```

```
>> (ENO, PNO) UNIQUE IN ASG ;
```

```
>> CHECK ON PROJ (BUDGET+ >= 500000 AND BUDGET <= 1000000)
```

**Integrity Enforcement**

We now focus on enforcing semantic integrity that consists of rejecting update  
transactions that violate some integrity constraints

```
UPDATE PROJ SET BUDGET = BUDGET*1.1WHERE PNAME= "CAD/CAM"
```

Two basic methods permit the rejection of inconsistent update transactions

1. The first one is based on the**detection of inconsistencies.**The update transaction u is executed, causing a change of the database state D to D u . The enforcement algorithm verifies, by applying tests derived from these constraints, that all relevant constraints hold in state D u . If state D u is inconsistent, the DBMS can try either to reach another consistent state, D 0 u , by modifying D u with compensation actions, or to restore state D by undoing
2. The second method is based on the**prevention of inconsistencies.**An update is executed only if it changes the database state to a consistent state

## **Distributed Semantic Integrity Control**

Definition of Distributed Integrity Constraints

1. **Individual constraints:**single-relation single-variable constraints.
2. **Set-oriented constraints:**include single-relation multivariable constraints such as functional dependency
3. **Constraints involving aggregates:**require special processing because of the cost of evaluating the aggregates

**Enforcement of Distributed Integrity Assertions**

1. **Individual constraints.**

If the update transaction is an insert statement, all the tuples to be inserted are explicitly provided by the user. In this case, all individual constraints can be enforced at the site where the update is submitted. If the update is a qualified update (delete or modify statements), it is sent to the sites storing the relation that will be updated.

2.**Set-oriented constraints.**

The constraint should be satisfied everywhere

## **Query Processing**

Basic Steps involved in Query Processing

1. Query Parsing and Translation
2. Query Optimization
3. Evaluation

Query -> Parser and Translation -> Relational Algebric Expression -> Query Optimizer +Statistics ->Query Execution Plan -> Execution Engine -> Data

**Query Optimization Issues**

1. Types of Optimization : Exhaustive Search ,Heuristic
2. Optimization Granuality : Single Query at a time , multiple query at a time
3. Optimization Timing : Satic (compile time), Dynamic (execution time), hybrid (compile using static algorithm ,if error optimize at runtime)
4. Statistics : using histograms and attribute values are used
5. Descision Site : Single Site , All sites Involved , Hybrid
6. Exploitation of Network Topology : WAN [communication cost will matter], LAN [communication cost will not matter]
7. Exploitation using Replicated Fragments
8. Using Semijoins

## **Layers of Query Processing**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-536df9e2ffd6.png)

## **Query Decomposition**

- Normalization : query in CNF and DNF then example
- Analysis :removal of incorrect query
- Simplification : redundancy remove
- Rewriting :converting calculus into relational algebra

## **Query Graph**

Nodes : result realtion , operand realtion

Edges : Join or Projection

## **Localization of Distributed Data**

1. **Reduction for Primary Horizontal Fragmentation**

The horizontal fragmentation function distributes a relation based on selection predi-cate

a. reduction with Selection

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-8e9808e29b13.png)

b. reduction for joins : (aUb)Xs=(aXs)U(bXs)

## **Reduction for Vertical Fragmentation**

The vertical fragmentation function distributes a relation based on projection attrib-utes

EMP 1 = Π ENO,ENAME (EMP)  
EMP 2 = Π ENO,TITLE (EMP)

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-f7dbfc0d1110.png)

## **Reduction for Derived Fragmentation**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-c774bcfdc754.png)

## Optimization of Distributed Queries

Query Optimization based on amount of data being shipped , cost of transmitting data back to the site , realtion processing speed at the site

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-ad948d8e7d4a.png)

Search Space :Linear vs Bushy

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-1c10119818e8.png)

Seach Stratergy : Deterministic vs Randomizes Stratergy

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-6b1917bcac6b.png)

**Semi Join Stratergy**

![Medium article image](/assets/img/posts/notes-distributed-database-management-system-advanced-database-management-systems/medium-image-e65917e3bed9.png)

Distributed cost function= CPu Cost +I/O cost + communication cost

**Transaction management :**

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/notes-distributed-database-management-system-advanced-database-management-systems-655036ab4c77)
