---
title: High-Level Design HLD & Low-Level System Design LLD
author: harshityadav95
date: 2024-04-17 00:00:00 +0530
categories: [Design Pattern]
tags: [Software Development, Design Pattern]

---

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/8db5763f-e307-42bf-9096-881a0804f898)


# High-Level Design

**High-level design** or **HLD** refers to the overall system, a design that consists description of the system architecture and design and is a generic system design that includes:

The HLD process typically involves a number of steps, including:

- Identifying the system's requirements and constraints
- Identifying the key components and their interfaces
- Identifying the main algorithms and data structures
- Identifying the system's overall structure and organization
- Identifying any external dependencies or interfaces
- Identifying any performance or scalability concerns

**Examples:** System architectural documentation, app development flowcharts, and other items are examples of HLD in software development.

### **Pros of High-Level Design**

- It serves as the foundation for the stakeholders' acceptance of the suggested solution.
- Project planners can determine the project's cost and evaluate its risk using high-level estimations produced from the HLD.
- It also describes significant limitations and trade-offs of the system.
- The HLD is a fantastic tool for collaboration and communication. It is a forum for exchanging opinions on a difficult system.

## Common Pitfalls

- **Lack of Clear Requirements:**
    - Mistake: Designing without clear requirements.
    - Solution: Gather and validate detailed requirements from stakeholders.
- **Over-Engineering:**
    - Mistake: Building overly complex solutions.
    - Solution: Follow the KISS principle; design for current needs.
- **Underestimating Scalability:**
    - Mistake: Ignoring scalability needs.
    - Solution: Plan for scalability; use appropriate architecture.
- **Ignoring Security:**
    - Mistake: Neglecting security concerns.
    - Solution: Integrate security practices into the design.
- **Tight Coupling:**
    - Mistake: Creating tightly coupled modules.
    - Solution: Aim for loose coupling; use Dependency Injection.

# Low-Level Design

The main aim of LLD is to deliver a comprehensive, step-by-step implementation plan for the system. LLD also provides essential data validation rules and tackles error handling and recovery concerns.

**Examples**: Examples of LLD in software development include cart integration, **[security testing](https://www.naukri.com/code360/library/security-testing)**, [**user interface design**](https://www.naukri.com/code360/library/user-interface-design), etc.

### **Pros of Low-Level Design**

- It consists of a detailed pseudocode or other representation of the algorithms and data structures to be employed. It also includes a step-by-step plan for the system's implementation.
- LLD provides essential data validation rules. It also tackles error handling and recovery concerns.
- It creates software with little testing and debugging.

## Common Pitfalls

- **Unoptimized Data Structures:**
    - Mistake: Using inefficient data structures.
    - Solution: Choose data structures based on requirements.
- **Premature Optimization:**
    - Mistake: Optimizing without identifying bottlenecks.
    - Solution: Profile first, optimize where needed.
- **Lack of Modularity:**
    - Mistake: Writing monolithic code.
    - Solution: Divide into smaller, modular components.
- **Ignoring Error Handling:**
    - Mistake: Not handling errors properly.
    - Solution: Implement robust error handling.
- **Inadequate Testing:**
    - Mistake: Skipping testing.
    - Solution: Follow a comprehensive testing strategy.
- **Not Following Coding Standards:**
    - Mistake: Inconsistent coding styles.
    - Solution: Adhere to coding guidelines, and use linting.
- **Ignoring Platform Differences:**
    - Mistake: Neglecting platform-specific issues.
    - Solution: Account for platform variations in design.

## Detailed-Level Design (DD)

**Detailed Level Design (DLD)** is the most detailed technical document, which describes user stories, error processing algorithms, state transitions, logical sequences, and others. DLD describes the interaction of every low-level process with each other. As we noted above, DLD is the extension of the Low-Level Design (LLD.)

## Why are LLD and HLD important for developers?

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/3bf6feb8-deff-4307-b25a-31f742e22f7a)

### Collaboration:

LLD and HLD facilitate effective collaboration among development teams. By having a clear design blueprint, everyone involved can better understand their roles and responsibilities, work cohesively, and reduce the chances of miscommunication or conflicts. 

### Scalability and Maintainability:

A well-designed architecture ensures that our software systems can scale smoothly as requirements evolve or user demands increase. LLD and HLD enable us to plan for future enhancements, make informed design decisions, and simplify maintenance tasks. It saves time, effort, and resources in the long run. 

### Code Quality:

LLD and HLD promote good coding practices and high-quality code. With a structured approach to design, developers can write clean, modular, and reusable code that is easier to test, debug, and extend. 

### Efficiency:

By investing time in thoughtful LLD and HLD, developers can identify potential bottlenecks, optimize performance, and improve overall efficiency. This leads to faster execution, reduced resource consumption, and enhanced user experience. 

# Conclusion

High-Level Design documents are like big-picture plans that help project managers and architects understand how a system will work and low-Level Design documents are more detailed and are made for programmers.

- They show exactly how to write the code and make the different parts of the system fit together. Both documents are important for different people involved in making and maintaining the software.
- Creating a High-Level Design is like making a big plan for the software, and it helps find problems early, so the quality of the software can be better assured.
- On the other hand, when Low-Level Design is well-documented, it makes it easier for others to check the code and ensure its quality during the actual writing of the software.

Both these steps help catch and fix issues early, making the overall software development process smoother and more reliable.

## Summary

![image](https://github.com/harshityadav95/harshityadav95.github.io/assets/14792490/569d605c-fa4b-4bcf-93b0-5a95be8b71c6)

## Reference

- [https://www.geeksforgeeks.org/what-is-low-level-design-or-lld-learn-system-design/](https://www.geeksforgeeks.org/what-is-low-level-design-or-lld-learn-system-design/)
- [https://www.geeksforgeeks.org/what-is-high-level-design-learn-system-design/](https://www.geeksforgeeks.org/what-is-high-level-design-learn-system-design/)
- [https://freedium.cfd/https://medium.com/@yam-yam-architect/hld-vs-lld-10759c63ccae](https://freedium.cfd/https://medium.com/@yam-yam-architect/hld-vs-lld-10759c63ccae)
- [https://www.linkedin.com/pulse/why-lld-hld-essential-developers-shankhadeep-das](https://www.linkedin.com/pulse/why-lld-hld-essential-developers-shankhadeep-das)
- [https://www.scaler.com/topics/high-level-design-and-low-level-design/](https://www.scaler.com/topics/high-level-design-and-low-level-design/)
- [https://softwaredominos.com/home/software-design-development-articles/high-level-solution-design-documents-what-is-it-and-when-do-you-need-one/](https://softwaredominos.com/home/software-design-development-articles/high-level-solution-design-documents-what-is-it-and-when-do-you-need-one/)
