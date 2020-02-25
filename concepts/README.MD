# Basic understandings/know how

## sizes

| unit  | Size bits |
| :---: | :-------: |
| byte  |  8 bits   |
| short |  16 bits  |
|  int  |  32 bits  |
| long  |  64 bits  |


## CPU modes
- 16 bit - Real mode
- 32 bit - Protected mode
- 64 bit - Extended mode

## Interrupts
Interrupts is a mechanism that allow the CPU temporarily to halt (interrupt) what it is doing and run some other, higher-priority, instructions before returning to the original task.\
Interrupt Service Routines (ISR) - are simply a sequence of machine instructions, much like our boot sector code, that deal with a specific interrupt (e.g., read new data from a disk drive or from a network card).

## CPU Registers
*All* CPUs have registers. Registers are memory locations inside the CPU with direct connection to the CPU's data bus and, thus, being the fastest accessible memory locations for the CPU to process. In x86 architecture there are 3 types of registers:
|Type|Purpose|
|---|---|
|Data registers|Data manipulation operations|
|Address registers| Pointing to memory locations|
|Status registers| Control flow operations|

### Data Registers
|8+8bit|16bit|32bit|64bit|Name|Purpose|
|:---:|:---:|:---:|:---:|:---|:---|
|al+ah|ax|eax|rax|Accumulator|Arithmetic, logic and data transfer operations|
|bl+bh|bx|ebx|rbx|Base|Hold address of start of data to be used|
|cl+ch|cx|ecx|rcx|Counter|Incremental counter for loops (e.g., shifts, rotations)|
|dl+dh|dx|edx|rdx|Data|I/O operations and multiplication and division in large values|

### Address Registers
There are 3 types of **Address Registers**:
- Pointer - Stack location
- Index - Sequential data access (e.g., strings, arrays)
- Segmentation - Access other memory *banks*

#### Pointer Registers
|16bit|32bit|64bit|name|purpose|
|:---:|:---:|:---:|:---|:---|
|bp|ebp|rbp|Base Pointer|Start of the stack|
|sp|esp|rsp|Stack Pointer|Current location of the stack *tip*|
|ip|||Instruction Pointer|The address of the next instruction to be executed|

#### Index Registers
|16bit|32bit|64bit|name|purpose|
|:---:|:---:|:---:|:---|:---|
|si|esi|rsi|Source Index|Indexing sequential data source addressing|
|di|edi|rdi|Destination Index|Indexing sequential data destination addressing|

#### Segmentation Registers
Segmentation Registers are not used in extended mode (64bit).
|16bit and 32bit|name|purpose|
|:---:|:---|:---|
|cs|Code Segment|Segment for *ip*|
|ds,es,fs,gs|Data Segments|Segment for data addresses|
|ss|Stack Segment|Segment for stack addresses|
> **Note**:
>
> *ip* (Instruction Pointer) and *sp* (Stack Pointer) are always segmented with the values of *cs* and *ss* repectively, multiplied by 16 (decimal, i.e., 0x10 hexadecimal).> E.g., say *sp* is **0xAA** and *ss* is **0x55**. When referring to just *sp* it implicitly refers to:
> - *ss:sp* = 0x55 * 0x10 + 0xAA = 0x550 + 0xAA = 0x5FA

**Example of usage:** Copying between registers
```asm
	mov ax, 1234	; store the literal decimal number 1234 in ax
	mov cx, 0x234	; store the literal hex number 0 x234 in cx
	mov dx, 't'		; store the literal ASCII code for letter ’t ’ in dx
	mov bx, ax		; copy the value in ax into bx , so now bx == 1234
```
**Example of usage:** Setting high and low bytes independently
```asm
	mov ax, 0		; ax -> 0x0000, or in binary 00000000 00000000
	mov ah, 0x56	; ax -> 0x5600, or in binary 01010110 00000000
	mov al, 0x23	; ax -> 0x5623, or in binary 01010110 00100011
	mov ah, 0x16	; ax -> 0x1623, or in binary 00010110 00100011
```

### Status Register
Status register holds the state of the CPU resulting of an operation (e.g., arithmetic, logic, etc.). Some examples:
|bit|Symbol|Flag|Meaning|
|---|:---:|---|---|
|0 |CF  |Carry flag|Set if most significant bit carried or borrowed|
|2 |PF  |Parity flag|Set if result of operation is even number of *1*s|
|4 |AF  |Auxiliary carry flag|Carry or borrow from lower 4th bit to 5th (half-carry)|
|6 |ZF  |Zero flag|Set if result of operation is *0*|
|7 |SF  |Sign flag|Set if most significant bit is *1*|
|8 |TF  |Trap flag|Used debugging and single stepping|
|9 |IF  |Interrupt enable flag|If set allows CPU to accept maskable interrupts|
|10|DF  |Direction flag|Direction of index addressing. *0* = incrementing.|
|11|OF  |Overflow flag|Set when operation result is larger than data bus width|
|12-13|IOPL|I/O Priviledge level|System flag|
|14|NT  |Nested task flag|System flag|
|16|RF  |Resume flag|System flag|
|17|VM  |Virtual 8086 mode flag|System flag|
|18|AC  |Alignment check flag (486+)|System flag|
|19|VIF |Virutal interrupt flag|System flag|
|20|VIP |Virtual interrupt pending flag|System flag|
|21|ID  |ID flag|System flag|

## Assembly code information
- `word`: is used to describe the size of the maximum processing unit of the current mode of the CPU: so in 16-bit real mode, a word refers to a 16-bit value; in 32-bit protected mode, a word refers to a 32-bit value

### NASM directives
*DB* means "Data Byte"
| Directive |  Purpose   | Size bytes | Size bits |
| :-------: | :--------: | :--------: | :-------: |
|    DB     |    Byte    |     1      |     8     |
|    DW     |    Word    |     2      |    16     |
|    DD     | Doubleword |     4      |    32     |
|    DQ     |  Quadword  |     8      |    64     |
