---
title: The Protection Rings Crowdstrike Disaster Study
author: harshityadav95
date: 2024-07-24 00:00:00 +0530
categories: [Backend Engineering]
tags: [Development, Operating System]

---

{% include embed/youtube.html id='H9RSeDUdkCA' %}
 
## Layers of an Operating System

- **Operating systems can be broken down into a number of discrete layers, each with its own privileges. This system is known as a protection ring.**
- **The operating system manages a computer’s resources, such as processing time on the CPU and access to memory. Computers are often running multiple software processes at once, and these will require differing levels of access to resources and hardware.**
- Protection Rings provides logical space for the levels of permissions and execution. Two important uses of Protection Rings are :
    1. Improving Fault Tolerance
    2. Provide Computer Security

## What is Protection Ring

Processes are executed in layered “rings”, where each ring has different access rights to resources. The central ring has the highest privileges, and each subsequent layer has decreased access. A common implementation of a protection ring for x86 processors (a common type of CPU) has four rings, numbered from 0 through to 3, as described below.

![image](https://github.com/user-attachments/assets/3304b149-5066-4e42-ae88-f772406a1f97)


## **Modes of Protection Ring :**

There are basically two modes : Supervisor Mode, and Hypervisor Mode. These are explained as following below in brief.

1. **Supervisor Mode:**
    - Think of Supervisor Mode as the “boss” mode for processors.
    - In this mode, the processor can execute all types of instructions, including privileged ones (those that only the operating system or trusted software should use).
    - Supervisor Mode also grants access to different memory areas, memory management hardware, and peripheral devices.
    - Typically, the operating system runs in Supervisor Mode.
2. **Hypervisor Mode:**
    - Hypervisor Mode is like the conductor of a virtual orchestra.
    - Modern CPUs have special virtualization instructions (like VT and Pacifica) that allow a hypervisor (a virtualization manager) to control hardware access at a low level.
    - To enhance virtualization, these instructions create a new privilege level below the regular “Ring 0” (which is the most privileged level).
    - These instructions are like secret codes that only the hypervisor can use—they work on a level even deeper than the usual processor instructions.

So, Supervisor Mode is about overall control, while Hypervisor Mode is all about managing virtualization magic! 

## Why Layers / Rings ?

The layered model offers two main benefits. 

- Firstly, it protects against system crashes. Errors in higher rings (with less access) can usually be recovered from. This is because only ring 0 has direct access to the memory and CPU, so if a process runnning in the outer ring crashes, it can be restarted without losing data or causing an error in the CPU.
- Secondly, it offers increased security. To execute instructions that require more access to resources, the process must request the permissions from the operating system. The OS can then decide whether to grant the request or deny it. This selection process helps to protect your system from unwanted or malicious behaviour.

## Example :

### **Ring 0 (most privileged) and 3 (least privileged)**

- Ring 0 is accessible to the **kernel**, which is a central part of most operating systems and can access everything. Code running here is said to be running in **kernel mode**. Processes running in kernel mode can affect the entire system; if anything fails here, it will probably result in a system shutdown.
- This ring has direct access to the CPU and the system memory, so any instructions requiring the use of either will be executed here.

### Ring 3

- The least priviliged ring, is accessible to user processes that are running in **user mode**. This is where most applications running on your computer will reside. This ring has no direct access to the CPU or memory, and therefore has to pass any instructions involving these to ring 0.

### **Rings 1 and 2**

Rings 1 and 2 have special privileges that ring 3 (user mode) does not.

- The OS uses ring 1 to interact with the computer’s hardware.,Ring 1 is used to interact with and control hardware connected to your computer. Playing a song through speakers or headphones, or displaying video on your monitor, are examples of instructions that would need to run in this ring.
- Ring 2 is used for instructions that need to interact with the system storage, loading or saving files. These sorts of permissions are called *input* and *output*, as they involve moving data into or out of working memory (RAM). Loading a Word document from storage, for example, would be in ring 2.
- Viewing and editing the document would fall into ring 3, the application layer.

## Real Life Implementations

**While Linux and Windows use only ring 0 and ring 3, some other operating systems can utilize three different protection levels.**

### x86 Architecture

Most general-purpose systems use only two rings, even if the hardware they run on provides more [CPU modes](https://en.wikipedia.org/wiki/CPU_modes) than that. For example, Windows 7 and Windows Server 2008 (and their predecessors) use only two rings, with ring 0 corresponding to [kernel mode](https://en.wikipedia.org/wiki/Protection_ring#SUPERVISOR-MODE) and ring 3 to [user mode](https://en.wikipedia.org/wiki/User_space)

### ARM Architecture

- [ARM](https://en.wikipedia.org/wiki/ARM_architecture) version 7 architecture implements **three** privilege levels: application (PL0), operating system (PL1), and hypervisor (PL2). Unusually, level 0 (PL0) is the least-privileged level, while level 2 is the most-privileged level.
- ARM version 8 implements **four** exception levels: application (EL0), operating system (EL1), hypervisor (EL2), and secure monitor / firmware (EL3), for AArch64

Ring protection can be combined with [processor modes](https://en.wikipedia.org/wiki/Processor_modes) (master/kernel/privileged/[supervisor mode](https://en.wikipedia.org/wiki/Protection_ring#SUPERVISOR-MODE) versus slave/unprivileged/user mode) in some systems. Operating systems running on hardware supporting both may use both forms of protection or only one.

## Windows : WHQL Certification

WHQL certification (Windows Hardware Quality Labs) is a rigorous testing process by Microsoft. It ensures that hardware devices (like drivers) meet quality and compatibility standards for the Windows operating system. When a product passes WHQL testing, it gains the “Designed for Windows” logo, signifying reliability and adherence to Microsoft’s standards. Benefits include enhanced user experience, Microsoft branding advantages, free distribution through Windows updates, and priority in procurement

### macOS

**Apple Developer Program**: Apple provides a certification process for macOS through its Developer Program. Developers can submit their apps and drivers to Apple for review, ensuring they meet the necessary guidelines and standards for macOS compatibility.

### Linux

**Linux Foundation Certification**: While Linux doesn’t have a centralized certification like WHQL, the Linux Foundation offers various certifications for software and hardware compatibility. Additionally, individual distributions (like Red Hat, Ubuntu, etc.) may have their own certification processes.

### Android

**Google Compatibility Test Suite (CTS)**: For Android, Google provides the Compatibility Test Suite (CTS) to ensure that devices and apps meet the compatibility requirements for the Android platform. Passing CTS is essential for devices to access Google Mobile Services (GMS).

### iOS

**Apple Developer Program**: Similar to macOS, iOS also uses the Apple Developer Program for app and driver certification. Developers submit their apps to Apple for review to ensure they comply with iOS standards and guidelines.

## Reference :

- [https://en.wikipedia.org/wiki/Protection_ring](https://en.wikipedia.org/wiki/Protection_ring)
- [https://www.geeksforgeeks.org/protection-ring/](https://www.geeksforgeeks.org/protection-ring/)
- [https://www.baeldung.com/cs/os-rings](https://www.baeldung.com/cs/os-rings)
- [https://hypervsir.blogspot.com/2014/10/introduction-on-hardware-security.html](https://hypervsir.blogspot.com/2014/10/introduction-on-hardware-security.html)
- [https://www.theregister.com/2024/07/23/crowdstrike_failure_shows_need_for/](https://www.theregister.com/2024/07/23/crowdstrike_failure_shows_need_for/)
- [https://learn.microsoft.com/en-us/windows-hardware/drivers/install/whql-release-signature](https://learn.microsoft.com/en-us/windows-hardware/drivers/install/whql-release-signature)
