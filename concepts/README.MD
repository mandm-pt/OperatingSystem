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
Interrupts are a mechanism that allow the CPU temporarily to halt what it is doing and run some other, higher-priority instructions before returning to the original task.\
Interrupt Service Routines (ISR) - is simply a sequence of machine instructions, much like our boot sector code, that deals with a specific interrupt (e.g. perhaps to read new data from a disk drive or from a network card).

## CPU Registers
All x86 CPUs have four general purpose registers. They act as variables, so we can store we can store data temporarily during a particular routine.
- ax
- bx
- cx
- dx

**Example of usage:** Copying between registers
```asm
	mov ax, 1234	; store the decimal number 1234 in ax
	mov cx, 0x234	; store the hex number 0 x234 in cx
	mov dx, 't'	; store the ASCII code for letter ’t ’ in dx
	mov bx, ax	; copy the value of ax into bx , so now bx == 1234
```
**Example of usage:** Setting high and low bytes independently
```asm
	mov ax, 0	; ax -> 0x0000, or in binary 00000000 00000000
	mov ah, 0x56	; ax -> 0x5600, or in binary 01010110 00000000
	mov al, 0x23	; ax -> 0x5623, or in binary 01010110 00100011
	mov ah, 0x16	; ax -> 0x1623, or in binary 00010110 00100011
```

## Assembly code information
- `word`: is used to describe the size of the maximum processing unit of the current mode of the CPU: so in 16-bit real mode, a word refers to a 16-bit value; in 32-bit protected mode, a word refers to a 32-bit value

### NASM directives
| Directive |  Purpose   | Size bytes | Size bits |
| :-------: | :--------: | :--------: | :-------: |
|    DB     |    Byte    |     1      |     8     |
|    DW     |    Word    |     2      |    16     |
|    DD     | Doubleword |     4      |    32     |
|    DQ     |  Quadword  |     8      |    64     |
