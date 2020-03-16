# GDB useful commands

## General

* `gdb` - starts gdb program
* `quit`: exit GDB
* `kill`: kill running program
* `target remote localhost:1234` - Debug remote host on port 1234

## Breakpoints
* `info reg <REGISTER>`: shows the value of register <REGISTER>

## Breakpoints
* `break *addr`: set breakpoint at address addr
* `info break`: show defined breakpoints

## Execution Control
* `c` or `continue`: continue running the program until the next breakpoint
* `nexti`: next machine instruction rather than source line
* `jump *address`: resume executionat specified addr

## Other
* `set disassembly-flavor FLAVOR`: controls the disassembly style used by the disassemble
  * `att` **default**: GDB will use the AT&T disassembly style (e.g. mov 0xc(%ebp),%eax) that is popular among Linux users.
  * `intel`: GDB will use the Intel disassembly style (e.g. mov eax, DWORD PTR [ebp+0xc]) that is popular among Windows users.
* `show disassembly-flavor`: displays disassembly style in use

## Formatting

`a` - Pointer
`c` - Read as integer, print as character
`d` - Integer, signed decimal
`f` - Floating point number
`o` - Integer, print as octal
`s` - Try to treat as C string.tInteger, print as binary (t = „two“)
`u` - Integer, unsigned decimal
`x` - Integer, print as hexadecimal
