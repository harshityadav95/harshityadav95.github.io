---
title: "Microprocessor and Interfacing"
author: harshityadav95
date: 2017-06-01 00:00:00 +0530
categories: [SDE Developer]
tags: [microprocessor, intel-8085, intel-8086, hardware, notes]
---

## Microprocessor and Interfacing

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-66c6f75dc496.jpg)

## Unit-7 (Intel 8253 Programmable interval timer )

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-0c66f186f98a.png)

Modes of 8253

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-ef6e76e42eeb.png)

## Data Bus Buffer

It is a tri-state, bi-directional, 8-bit buffer, which is used to interface the 8253/54 to the system data bus. It has three basic functions −

- Programming the modes of 8253/54.
- Loading the count registers.
- Reading the count values.

## Read/Write Logic

It includes 5 signals, i.e. RD, WR, CS, and the address lines A0 & A1. In the peripheral I/O mode, the RD and WR signals are connected to IOR and IOW, respectively. In the memorymapped I/O mode, these are connected to MEMR and MEMW.

Address lines A0 & A1 of the CPU are connected to lines A0 and A1 of the 8253/54, and CS is tied to a decoded address. The control word register and counters are selected according to the signals on lines A0 & A1.

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-be445bde9319.png)

## Control Word Register

This register is accessed when lines A0 & A1 are at logic 1. It is used to write a command word, which specifies the counter to be used, its mode, and either a read or write operation. Following table shows the result for various control inputs.

## Counters

Each counter consists of a single, 16 bit-down counter, which can be operated in either binary or BCD. Its input and output is configured by the selection of modes stored in the control word register. The programmer can read the contents of any of the three counters without disturbing the actual count in process.

## Mode 0 -Interrupt on Terminal Count

- It is used to generate an interrupt to the microprocessor after a certain interval.
- Initially the output is low after the mode is set. The output remains LOW after the count value is loaded into the counter.
- The process of decrementing the counter continues till the terminal count is reached, i.e., the count become zero and the output goes HIGH and will remain high until it reloads a new count.
- The GATE signal is high for normal counting. When GATE goes low, counting is terminated and the current count is latched till the GATE goes high again.

## Mode 1 -Programmable One Shot

- It can be used as a mono stable multi-vibrator.
- The gate input is used as a trigger input in this mode.
- The output remains high until the count is loaded and a trigger is applied.

## Mode 2 -Rate Generator

- The output is normally high after initialization.
- Whenever the count becomes zero, another low pulse is generated at the output and the counter will be reloaded.

## Mode 3- Square Wave Generator

- This mode is similar to Mode 2 except the output remains low for half of the timer period and high for the other half of the period.

## Mode 4 -Software Triggered Mode

- In this mode, the output will remain high until the timer has counted to zero, at which point the output will pulse low and then go high again.
- The count is latched when the GATE signal goes LOW.
- On the terminal count, the output goes low for one clock cycle then goes HIGH. This low pulsere can be used as a strobe.

## Mode 5 -Hardware Triggered Mode

- This mode generates a strobe in response to an externally generated signal.
- This mode is similar to mode 4 except that the counting is initiated by a signal at the gate input, which means it is hardware triggered instead of software triggered.
- After it is initialized, the output goes high.
- When the terminal count is reached, the output goes low for one clock cycle.

## **Unit -6 (Intel -8259 Programmable Interrupt Contoller)**

The 8259A is a programmable interrupt controller designed to work with Intel microprocessor 8080 A, 8085, 8086, 8088. The 8259 A interrupt controller can

1) Handle eight interrupt inputs. This is equivalent to providing eight interrupt pins on the processor in place of**one INTR/INT pin**.

2) Vector an interrupt request anywhere in the memory map.

3) Resolve eight levels of interrupt priorities in a variety of modes.

4) Mask each interrupt request individually.

5) Read the status of pending interrupts, in service interrupts, and masked interrupts.

6) Be set up to accept either the level triggered or edge triggered interrupt request.

7) Mine 8259 as can be cascade in a master slave configuration to handle 64 interrupt inputs.

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-fbc0990cec82.png)

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-a9c2f51449a5.png)

1. CS(bar): Chip select  
To access this chip, is made low. A LOW on this pin enables & communication between the CPU and the 8259A.  
This pin is connected to address bus through the decoder logic circuits. INTA functions are independent of .
2. WR(bar)  
A low on this pin. When is low enables the 8259 A to accept  
command words from CPU.
3. RD(bar):  
A low on this pin when (CS)is low enables these 8259 A to release  
status on to the data bus for the CPU.
4. . D7-D0:

Bidirectional data bus control status and interrupt in a this bus. This bus is connected to BDB of 8085. CAS0-CAS2:

5. Cascade lines:

The CAS lines form a private 8259A bus to control a multiple 8259A structure ie to identify a particular slave device. These pins are outputs of a master 8259A and inputs for a slave 8259A. /

6. SPEN : Salve program/enable buffer:  
This is a dual function pin. It is used as an input to determine whether the 8259A is to a master (SP /EN = 1) or as a slave ( SP/EN = 0). It is  
also used as an output to disable the data bus transceivers when data are being transferred from the 8259A to the CPU. When in buffered mode, it can be used as an output and when not in the buffered mode it is used as an input.

7.INT: This pin goes high whenever a valid interrupt request is asserted. It is used to interrupt the CPU, thus it is connected to the CPU’s interrupt pin 7(INTR). :

8.(INTA)Interrupt: Acknowledge. This pin is used to enable 8259A interrupt vector data on the data bus by a sequence of interrupt request pulses issued by the CPU.

9 .IR0-IR7: Interrupt Requests:

Asynchronous interrupt inputs. An interrupt request is executed by raising an IR input (low to high), and holding it high until it is acknowledged. (Edge triggered mode).or just by a high level on an IR input (levels triggered mode).

10. A0: A0 address line: This pin acts in conjunction with the RD,WR & CS pins. It is used by the 8259A to send various command words from the CPU and to read the status. If is connected to the CPU A0 address line. Two addresses must be reserved in the I/O address space for each 8259 in the system.

![Block Diagram](/assets/img/posts/microprocessor-and-interfacing/medium-image-d9fe40503a6d.png)

_Block Diagram_

1. **Data bus buffer:**  
This 3- state, bidirectional 8-bit buffer is used to interface the 8259A to the system data bus. Control words and status information are transferred through the data bus buffer.

2.**Read/Write & control logic:**  
The function of this block is to accept OUTPUT commands from the CPU. It contains the initialization command word (ICW) register and operation command word (OCW) register which store the various control formats for device operation. This function block also allows the status of 8159A to be transferred to the data bus.

3.**Interrupt request register (IRR):**  
IRR stores all the interrupt inputs that are requesting service. Basically, it keeps track of which interrupt inputs are asking for service. If an interrupt input is unmasked, and has an interrupt signal on it, then the corresponding bit in the IRR will be set.

4.**Interrupt mask register (IMR):**  
The IMR is used to disable (Mask) or enable (Unmask) individual interrupt inputs. Each bit in this register corresponds to the interrupt input with the same number. The IMR operation on the IRR. Masking of higher priority input will not affect the interrupt request lines of lower priority. To unmask any interrupt the corresponding bit is set ‘0’.

5.**In service register (ISR):**  
The in service registers keeps tracks of which interrupt inputs are currently being serviced. For each input that is currently being serviced the corresponding bit will be set in the in service register. Each of these 3-reg can be read as status reg.

6.**Priority Resolver:**  
This logic block determines the priorities of the set in the IRR. The highest priority is selected and strobed into the corresponding bit of the ISR during (INTA)pulse.

7.**Cascade buffer/comparator:**  
This function blocks stores and compare the IDS of all 8259A’s in the reg. The associated 3-I/O pins (CAS0-CAS2) are outputs when  
8259A is used a master. Master and are inputs when 8259A is used as a slave. As a master, the 8259A sends the ID of the interrupting slave device onto the cas2-cas0. The slave thus selected will send its pre-programmed subroutine address on to the data bus during the next one or two successive(INTA) pulses

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-1d7db1c3a4bd.png)

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-6e4d216f06f7.png)

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-45e8799a2fdb.png)

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-e89bdfd3e8ae.png)

## **Unit -5 (DMA)**

Using a DMA controller, the device requests the CPU to hold its data, address and control bus, so the device is free to transfer data directly to/from the memory. The DMA data transfer is initiated only after receiving HLDA signal from the CPU.

## How DMA Operations are Performed?

Following is the sequence of operations performed by a DMA

- Initially, when any device has to send data between the device and the memory, the device has to send DMA request (DRQ) to DMA controller.
- The DMA controller sends Hold request (HRQ) to the CPU and waits for the CPU to assert the HLDA.
- Then the microprocessor tri-states all the data bus, address bus, and control bus. The CPU leaves the control over bus and acknowledges the HOLD request through HLDA signal.
- Now the CPU is in HOLD state and the DMA controller has to manage the operations over buses between the CPU, memory, and I/O devices.

## Features of 8257

Here is a list of some of the prominent features of 8257 −

- It has four channels which can be used over four I/O devices.
- Each channel has 16-bit address and 14-bit counter.
- Each channel can transfer data up to 64kb.
- Each channel can be programmed independently.
- Each channel can perform read transfer, write transfer and verify transfer operations.
- It generates MARK signal to the peripheral device that 128 bytes have been transferred.
- It requires a single phase clock.
- Its frequency ranges from 250Hz to 3MHz.
- It operates in 2 modes, i.e.,**Master mode**and**Slave mode**.

## 8257 Architecture

The following image shows the architecture of 8257 −

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-914d3b0a9252.png)

## 8257 Pin Description

The following image shows the pin diagram of a 8257 DMA controller

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-4535549dbaf5.png)

## Microprocessor — 8085 Pin Configuration

The following image depicts the pin diagram of 8085 Microprocessor −

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-9297584c2252.png)

8085 Pin Configuration

The pins of a 8085 microprocessor can be classified into seven groups −

## Address bus

A15-A8, it carries the most significant 8-bits of memory/IO address.

## Data bus

AD7-AD0, it carries the least significant 8-bit address and data bus.

## Control and status signals

These signals are used to identify the nature of operation. There are 3 control signal and 3 status signals.

Three control signals are RD, WR & ALE.

- **RD**− This signal indicates that the selected IO or memory device is to be read and is ready for accepting data available on the data bus.
- **WR**− This signal indicates that the data on the data bus is to be written into a selected memory or IO location.
- **ALE**− It is a positive going pulse generated when a new operation is started by the microprocessor. When the pulse goes high, it indicates address. When the pulse goes down it indicates data.

Three status signals are IO/M, S0 & S1.

## IO/M

This signal is used to differentiate between IO and Memory operations, i.e. when it is high indicates IO operation and when it is low then it indicates memory operation.

## S1 & S0

These signals are used to identify the type of current operation.

## Power supply

There are 2 power supply signals − VCC & VSS. VCC indicates +5v power supply and VSS indicates ground signal.

## Clock signals

There are 3 clock signals, i.e. X1, X2, CLK OUT.

- **X1, X2**− A crystal (RC, LC N/W) is connected at these two pins and is used to set frequency of the internal clock generator. This frequency is internally divided by 2.
- **CLK OUT**− This signal is used as the system clock for devices connected with the microprocessor.

## Interrupts & externally initiated signals

Interrupts are the signals generated by external devices to request the microprocessor to perform a task. There are 5 interrupt signals, i.e. TRAP, RST 7.5, RST 6.5, RST 5.5, and INTR. We will discuss interrupts in detail in interrupts section.

- **INTA**− It is an interrupt acknowledgment signal.
- **RESET IN**− This signal is used to reset the microprocessor by setting the program counter to zero.
- **RESET OUT**− This signal is used to reset all the connected devices when the microprocessor is reset.
- **READY**− This signal indicates that the device is ready to send or receive data. If READY is low, then the CPU has to wait for READY to go high.
- **HOLD**− This signal indicates that another master is requesting the use of the address and data buses.
- **HLDA (HOLD Acknowledge)**− It indicates that the CPU has received the HOLD request and it will relinquish the bus in the next clock cycle. HLDA is set to low after the HOLD signal is removed.

## Serial I/O signals

There are 2 serial signals, i.e. SID and SOD and these signals are used for serial communication.

- **SOD**(Serial output data line) − The output SOD is set/reset as specified by the SIM instruction.
- **SID**(Serial input data line) − The data on this line is loaded into accumulator whenever a RIM instruction is executed.

Now let us discuss the addressing modes in 8085 Microprocessor.

## Addressing Modes in 8085

These are the instructions used to transfer the data from one register to another register, from the memory to the register, and from the register to the memory without any alteration in the content. Addressing modes in 8085 is classified into 5 groups −

## Immediate addressing mode

In this mode, the 8/16-bit data is specified in the instruction itself as one of its operand.**For example:**MVI K, 20F: means 20F is copied into register K.

## Register addressing mode

In this mode, the data is copied from one register to another.**For example:**MOV K, B: means data in register B is copied to register K.

## Direct addressing mode

In this mode, the data is directly copied from the given address to the register.**For example:**LDB 5000K: means the data at address 5000K is copied to register B.

## Indirect addressing mode

In this mode, the data is transferred from one register to another by using the address pointed by the register.**For example:**MOV K, B: means data is transferred from the memory address pointed by the register to the register K.

## Implied addressing mode

This mode doesn’t require any operand; the data is specified by the opcode itself.**For example:**CMP.

## Interrupts in 8085

Interrupts are the signals generated by the external devices to request the microprocessor to perform a task. There are 5 interrupt signals, i.e. TRAP, RST 7.5, RST 6.5, RST 5.5, and INTR.

Interrupt are classified into following groups based on their parameter −

- **Vector interrupt**− In this type of interrupt, the interrupt address is known to the processor.**For example:**RST7.5, RST6.5, RST5.5, TRAP.
- **Non-Vector interrupt**− In this type of interrupt, the interrupt address is not known to the processor so, the interrupt address needs to be sent externally by the device to perform interrupts.**For example:**INTR.
- **Maskable interrupt**− In this type of interrupt, we can disable the interrupt by writing some instructions into the program.**For example:**RST7.5, RST6.5, RST5.5.
- **Non-Maskable interrupt**− In this type of interrupt, we cannot disable the interrupt by writing some instructions into the program.**For example:**TRAP.
- **Software interrupt**− In this type of interrupt, the programmer has to add the instructions into the program to execute the interrupt. There are 8 software interrupts in 8085, i.e. RST0, RST1, RST2, RST3, RST4, RST5, RST6, and RST7.
- **Hardware interrupt**− There are 5 interrupt pins in 8085 used as hardware interrupts, i.e. TRAP, RST7.5, RST6.5, RST5.5, INTA.

**Note**− NTA is not an interrupt, it is used by the microprocessor for sending acknowledgement. TRAP has the highest priority, then RST7.5 and so on.

## Interrupt Service Routine (ISR)

A small program or a routine that when executed, services the corresponding interrupting source is called an ISR.

## TRAP

It is a non-maskable interrupt, having the highest priority among all interrupts. Bydefault, it is enabled until it gets acknowledged. In case of failure, it executes as ISR and sends the data to backup memory. This interrupt transfers the control to the location 0024H.

## RST7.5

It is a maskable interrupt, having the second highest priority among all interrupts. When this interrupt is executed, the processor saves the content of the PC register into the stack and branches to 003CH address.

## RST 6.5

It is a maskable interrupt, having the third highest priority among all interrupts. When this interrupt is executed, the processor saves the content of the PC register into the stack and branches to 0034H address.

## RST 5.5

It is a maskable interrupt. When this interrupt is executed, the processor saves the content of the PC register into the stack and branches to 002CH address.

## INTR

It is a maskable interrupt, having the lowest priority among all interrupts. It can be disabled by resetting the microprocessor.

When**INTR signal goes high**, the following events can occur −

- The microprocessor checks the status of INTR signal during the execution of each instruction.
- When the INTR signal is high, then the microprocessor completes its current instruction and sends active low interrupt acknowledge signal.
- When instructions are received, then the microprocessor saves the address of the next instruction on stack and executes the received instruction

Let us take a look at the programming of 8085 Microprocessor.

Instruction sets are instruction codes to perform some task. It is classified into five categories.

S.No.Instruction & Description1[**Control Instructions**](https://www.tutorialspoint.com/microprocessor/microprocessor_8085_control_instructions.htm)Following is the table showing the list of Control instructions with their meanings.

[**2Logical Instructions**](https://www.tutorialspoint.com/microprocessor/microprocessor_8085_logical_instructions.htm)Following is the table showing the list of Logical instructions with their meanings.

[**3Branching Instructions**](https://www.tutorialspoint.com/microprocessor/microprocessor_8085_branching_instructions.htm)Following is the table showing the list of Branching instructions with their meanings.

[**4Arithmetic Instructions**](https://www.tutorialspoint.com/microprocessor/microprocessor_8085_arithmetic_instructions.htm)Following is the table showing the list of Arithmetic instructions with their meanings.

[**5Data Transfer Instructions**](https://www.tutorialspoint.com/microprocessor/microprocessor_8085_data_transfer_instructions.htm)Following is the table showing the list of Data-transfer instructions with their meanings.

## 8085 – Demo Programs

Now, let us take a look at some program demonstrations using the above instructions −

## Adding Two 8-bit Numbers

Write a program to add data at 3005H & 3006H memory location and store the result at 3007H memory location.

**Problem demo**−

```
(3005H) = 14H    (3006H) = 89H
```

**Result**−

14H + 89H = 9DH

The program code can be written like this −

```
LXI H 3005H   : "HL points 3005H" MOV A, M      : "Getting first operand" INX H         : "HL points 3006H" ADD M         : "Add second operand" INX H         : "HL points 3007H" MOV M, A      : "Store result at 3007H" HLT           : "Exit program"
```

## Exchanging the Memory Locations

Write a program to exchange the data at 5000M& 6000M memory location.

```
LDA 5000M   : "Getting the contents at5000M location into accumulator" MOV B, A    : "Save the contents into B register" LDA 6000M   : "Getting the contents at 6000M location into accumulator" STA 5000M   : "Store the contents of accumulator at address 5000M" MOV A, B    : "Get the saved contents back into A register" STA 6000M   : "Store the contents of accumulator at address 6000M"
```

## Arrange Numbers in an Ascending Order

Write a program to arrange first 10 numbers from memory address 3000H in an ascending order.

```
MVI B, 09         :"Initialize counter"      START             :"LXI H, 3000H: Initialize memory pointer" MVI C, 09H        :"Initialize counter 2" BACK: MOV A, M    :"Get the number" INX H             :"Increment memory pointer" CMP M             :"Compare number with next number" JC SKIP           :"If less, donâ€™t interchange" JZ SKIP           :"If equal, donâ€™t interchange" MOV D, M MOV M, A DCX H MOV M, D INX H             :"Interchange two numbers" SKIP:DCR C        :"Decrement counter 2" JNZ BACK          :"If not zero, repeat" DCR B             :"Decrement counter 1" JNZ START HLT               :"Terminate program execution"
```

## Microprocessor — 8086 Overview

## Architecture of 8086

The following diagram depicts the architecture of a 8086 Microprocessor −

![Medium article image](/assets/img/posts/microprocessor-and-interfacing/medium-image-38a2f239f7c4.png)

Architecture of 8086

8086 Microprocessor is divided into two functional units, i.e.,**EU**(Execution Unit) and**BIU**(Bus Interface Unit).

## EU (Execution Unit)

Execution unit gives instructions to BIU stating from where to fetch the data and then decode and execute those instructions. Its function is to control operations on data using the instruction decoder & ALU. EU has no direct connection with system buses as shown in the above figure, it performs operations over data through BIU.

Let us now discuss the functional parts of 8086 microprocessors.

## ALU

It handles all arithmetic and logical operations, like +, −, Ã — , /, OR, AND, NOT operations.

## Flag Register

It is a 16-bit register that behaves like a flip-flop, i.e. it changes its status according to the result stored in the accumulator. It has 9 flags and they are divided into 2 groups − Conditional Flags and Control Flags.

## Conditional Flags

It represents the result of the last arithmetic or logical instruction executed. Following is the list of conditional flags −

- **Carry flag**− This flag indicates an overflow condition for arithmetic operations.
- **Auxiliary flag**− When an operation is performed at ALU, it results in a carry/barrow from lower nibble (i.e. D0 – D3) to upper nibble (i.e. D4 – D7), then this flag is set, i.e. carry given by D3 bit to D4 is AF flag. The processor uses this flag to perform binary to BCD conversion.
- **Parity flag**− This flag is used to indicate the parity of the result, i.e. when the lower order 8-bits of the result contains even number of 1’s, then the Parity Flag is set. For odd number of 1’s, the Parity Flag is reset.
- **Zero flag**− This flag is set to 1 when the result of arithmetic or logical operation is zero else it is set to 0.
- **Sign flag**− This flag holds the sign of the result, i.e. when the result of the operation is negative, then the sign flag is set to 1 else set to 0.
- **Overflow flag**− This flag represents the result when the system capacity is exceeded.

## Control Flags

Control flags controls the operations of the execution unit. Following is the list of control flags −

- **Trap flag**− It is used for single step control and allows the user to execute one instruction at a time for debugging. If it is set, then the program can be run in a single step mode.
- **Interrupt flag**− It is an interrupt enable/disable flag, i.e. used to allow/prohibit the interruption of a program. It is set to 1 for interrupt enabled condition and set to 0 for interrupt disabled condition.
- **Direction flag**− It is used in string operation. As the name suggests when it is set then string bytes are accessed from the higher memory address to the lower memory address and vice-a-versa.

## General purpose register

There are 8 general purpose registers, i.e., AH, AL, BH, BL, CH, CL, DH, and DL. These registers can be used individually to store 8-bit data and can be used in pairs to store 16bit data. The valid register pairs are AH and AL, BH and BL, CH and CL, and DH and DL. It is referred to the AX, BX, CX, and DX respectively.

- **AX register**− It is also known as accumulator register. It is used to store operands for arithmetic operations.
- **BX register**− It is used as a base register. It is used to store the starting base address of the memory area within the data segment.
- **CX register**− It is referred to as counter. It is used in loop instruction to store the loop counter.
- **DX register**− This register is used to hold I/O port address for I/O instruction.

## Stack pointer register

It is a 16-bit register, which holds the address from the start of the segment to the memory location, where a word was most recently stored on the stack.

## BIU (Bus Interface Unit)

BIU takes care of all data and addresses transfers on the buses for the EU like sending addresses, fetching instructions from the memory, reading data from the ports and the memory as well as writing data to the ports and the memory. EU has no direction connection with System Buses so this is possible with the BIU. EU and BIU are connected with the Internal Bus.

It has the following functional parts −

- **Instruction queue**− BIU contains the instruction queue. BIU gets upto 6 bytes of next instructions and stores them in the instruction queue. When EU executes instructions and is ready for its next instruction, then it simply reads the instruction from this instruction queue resulting in increased execution speed.
- Fetching the next instruction while the current instruction executes is called**pipelining**.
- **Segment register**− BIU has 4 segment buses, i.e. CS, DS, SS& ES. It holds the addresses of instructions and data in memory, which are used by the processor to access memory locations. It also contains 1 pointer register IP, which holds the address of the next instruction to executed by the EU.
- **CS**− It stands for Code Segment. It is used for addressing a memory location in the code segment of the memory, where the executable program is stored.
- **DS**− It stands for Data Segment. It consists of data used by the program andis accessed in the data segment by an offset address or the content of other register that holds the offset address.
- **SS**− It stands for Stack Segment. It handles memory to store data and addresses during execution.
- **ES**− It stands for Extra Segment. ES is additional data segment, which is used by the string to hold the extra destination data.
- **Instruction pointer**− It is a 16-bit register used to hold the address of the next instruction to be executed.

The 8086 microprocessor supports 8 types of instructions −

- Data Transfer Instructions
- Arithmetic Instructions
- Bit Manipulation Instructions
- String Instructions
- Program Execution Transfer Instructions (Branch & Loop Instructions)
- Processor Control Instructions
- Iteration Control Instructions
- Interrupt Instructions

Let us now discuss these instruction sets in detail.

## Data Transfer Instructions

These instructions are used to transfer the data from the source operand to the destination operand. Following are the list of instructions under this group −

## Instruction to transfer a word

- **MOV**− Used to copy the byte or word from the provided source to the provided destination.
- **PPUSH**− Used to put a word at the top of the stack.
- **POP**− Used to get a word from the top of the stack to the provided location.
- **PUSHA**− Used to put all the registers into the stack.
- **POPA**− Used to get words from the stack to all registers.
- **XCHG**− Used to exchange the data from two locations.
- **XLAT**− Used to translate a byte in AL using a table in the memory.

## Instructions for input and output port transfer

- **IN**− Used to read a byte or word from the provided port to the accumulator.
- **OUT**− Used to send out a byte or word from the accumulator to the provided port.

## Instructions to transfer the address

- **LEA**− Used to load the address of operand into the provided register.
- **LDS**− Used to load DS register and other provided register from the memory
- **LES**− Used to load ES register and other provided register from the memory.

## Instructions to transfer flag registers

- **LAHF**− Used to load AH with the low byte of the flag register.
- **SAHF**− Used to store AH register to low byte of the flag register.
- **PUSHF**− Used to copy the flag register at the top of the stack.
- **POPF**− Used to copy a word at the top of the stack to the flag register.

## Arithmetic Instructions

These instructions are used to perform arithmetic operations like addition, subtraction, multiplication, division, etc.

Following is the list of instructions under this group −

## Instructions to perform addition

- **ADD**− Used to add the provided byte to byte/word to word.
- **ADC**− Used to add with carry.
- **INC**− Used to increment the provided byte/word by 1.
- **AAA**− Used to adjust ASCII after addition.
- **DAA**− Used to adjust the decimal after the addition/subtraction operation.

## Instructions to perform subtraction

- **SUB**− Used to subtract the byte from byte/word from word.
- **SBB**− Used to perform subtraction with borrow.
- **DEC**− Used to decrement the provided byte/word by 1.
- **NPG**− Used to negate each bit of the provided byte/word and add 1/2’s complement.
- **CMP**− Used to compare 2 provided byte/word.
- **AAS**− Used to adjust ASCII codes after subtraction.
- **DAS**− Used to adjust decimal after subtraction.

## Instruction to perform multiplication

- **MUL**− Used to multiply unsigned byte by byte/word by word.
- **IMUL**− Used to multiply signed byte by byte/word by word.
- **AAM**− Used to adjust ASCII codes after multiplication.

## Instructions to perform division

- **DIV**− Used to divide the unsigned word by byte or unsigned double word by word.
- **IDIV**− Used to divide the signed word by byte or signed double word by word.
- **AAD**− Used to adjust ASCII codes after division.
- **CBW**− Used to fill the upper byte of the word with the copies of sign bit of the lower byte.
- **CWD**− Used to fill the upper word of the double word with the sign bit of the lower word.

## Bit Manipulation Instructions

These instructions are used to perform operations where data bits are involved, i.e. operations like logical, shift, etc.

Following is the list of instructions under this group −

## Instructions to perform logical operation

- **NOT**− Used to invert each bit of a byte or word.
- **AND**− Used for adding each bit in a byte/word with the corresponding bit in another byte/word.
- **OR**− Used to multiply each bit in a byte/word with the corresponding bit in another byte/word.
- **XOR**− Used to perform Exclusive-OR operation over each bit in a byte/word with the corresponding bit in another byte/word.
- **TEST**− Used to add operands to update flags, without affecting operands.

## Instructions to perform shift operations

- **SHL/SAL**− Used to shift bits of a byte/word towards left and put zero(S) in LSBs.
- **SHR**− Used to shift bits of a byte/word towards the right and put zero(S) in MSBs.
- **SAR**− Used to shift bits of a byte/word towards the right and copy the old MSB into the new MSB.

## Instructions to perform rotate operations

- **ROL**− Used to rotate bits of byte/word towards the left, i.e. MSB to LSB and to Carry Flag [CF].
- **ROR**− Used to rotate bits of byte/word towards the right, i.e. LSB to MSB and to Carry Flag [CF].
- **RCR**− Used to rotate bits of byte/word towards the right, i.e. LSB to CF and CF to MSB.
- **RCL**− Used to rotate bits of byte/word towards the left, i.e. MSB to CF and CF to LSB.

## String Instructions

String is a group of bytes/words and their memory is always allocated in a sequential order.

Following is the list of instructions under this group −

- **REP**− Used to repeat the given instruction till CX ≠ 0.
- **REPE/REPZ**− Used to repeat the given instruction until CX = 0 or zero flag ZF = 1.
- **REPNE/REPNZ**− Used to repeat the given instruction until CX = 0 or zero flag ZF = 1.
- **MOVS/MOVSB/MOVSW**− Used to move the byte/word from one string to another.
- **COMS/COMPSB/COMPSW**− Used to compare two string bytes/words.
- **INS/INSB/INSW**− Used as an input string/byte/word from the I/O port to the provided memory location.
- **OUTS/OUTSB/OUTSW**− Used as an output string/byte/word from the provided memory location to the I/O port.
- **SCAS/SCASB/SCASW**− Used to scan a string and compare its byte with a byte in AL or string word with a word in AX.
- **LODS/LODSB/LODSW**− Used to store the string byte into AL or string word into AX.

## Program Execution Transfer Instructions (Branch and Loop Instructions)

These instructions are used to transfer/branch the instructions during an execution. It includes the following instructions −

Instructions to transfer the instruction during an execution without any condition −

- **CALL**− Used to call a procedure and save their return address to the stack.
- **RET**− Used to return from the procedure to the main program.
- **JMP**− Used to jump to the provided address to proceed to the next instruction.

Instructions to transfer the instruction during an execution with some conditions −

- **JA/JNBE**− Used to jump if above/not below/equal instruction satisfies.
- **JAE/JNB**− Used to jump if above/not below instruction satisfies.
- **JBE/JNA**− Used to jump if below/equal/ not above instruction satisfies.
- **JC**− Used to jump if carry flag CF = 1
- **JE/JZ**− Used to jump if equal/zero flag ZF = 1
- **JG/JNLE**− Used to jump if greater/not less than/equal instruction satisfies.
- **JGE/JNL**− Used to jump if greater than/equal/not less than instruction satisfies.
- **JL/JNGE**− Used to jump if less than/not greater than/equal instruction satisfies.
- **JLE/JNG**− Used to jump if less than/equal/if not greater than instruction satisfies.
- **JNC**− Used to jump if no carry flag (CF = 0)
- **JNE/JNZ**− Used to jump if not equal/zero flag ZF = 0
- **JNO**− Used to jump if no overflow flag OF = 0
- **JNP/JPO**− Used to jump if not parity/parity odd PF = 0
- **JNS**− Used to jump if not sign SF = 0
- **JO**− Used to jump if overflow flag OF = 1
- **JP/JPE**− Used to jump if parity/parity even PF = 1
- **JS**− Used to jump if sign flag SF = 1

## Processor Control Instructions

These instructions are used to control the processor action by setting/resetting the flag values.

Following are the instructions under this group −

- **STC**− Used to set carry flag CF to 1
- **CLC**− Used to clear/reset carry flag CF to 0
- **CMC**− Used to put complement at the state of carry flag CF.
- **STD**− Used to set the direction flag DF to 1
- **CLD**− Used to clear/reset the direction flag DF to 0
- **STI**− Used to set the interrupt enable flag to 1, i.e., enable INTR input.
- **CLI**− Used to clear the interrupt enable flag to 0, i.e., disable INTR input.

## Iteration Control Instructions

These instructions are used to execute the given instructions for number of times. Following is the list of instructions under this group −

- **LOOP**− Used to loop a group of instructions until the condition satisfies, i.e., CX = 0
- **LOOPE/LOOPZ**− Used to loop a group of instructions till it satisfies ZF = 1 & CX = 0
- **LOOPNE/LOOPNZ**− Used to loop a group of instructions till it satisfies ZF = 0 & CX = 0
- **JCXZ**− Used to jump to the provided address if CX = 0

## Interrupt Instructions

These instructions are used to call the interrupt during program execution.

- **INT**− Used to interrupt the program during execution and calling service specified.
- **INTO**− Used to interrupt the program during execution if OF = 1
- **IRET**− Used to return from interrupt service to the main program

EditPublish

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/microprocessor-and-interfacing-ef9c2b116382)
