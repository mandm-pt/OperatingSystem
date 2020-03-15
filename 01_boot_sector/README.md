# Debug boot loader

* start qemu with the following flags:
  * `-s`: Shorthand for -gdb tcp::1234, i.e. open a gdbserver on TCP port 1234.
  * `-S`: Do not start CPU at startup (you must type 'c' in the monitor).
  * **Example:** `qemu-system-x86_64 -s -S <FILE>`
* start gdb and do the following commands:
  * `target remote localhost:1234`: connect to remote machine on port 1234
  * `br *0x7c00`: set breakpoint at address 0x7c00
  * `c`: continue running the program until the next breakpoint

## GDB useful commands

* `quit`: exit GDB
* `kill`: kill running program

### Breakpoints
* `info reg <REGISTER>`: shows the value of register <REGISTER>

### Breakpoints
* `break *addr`: set breakpoint at address addr
* `info break`: show defined breakpoints

### Execution Control
* `c` or `continue`: continue running the program until the next breakpoint
* `nexti`: next machine instruction rather than source line
* `jump *address`: resume executionat specified addr

### Other
* `set disassembly-flavor FLAVOR`: controls the disassembly style used by the disassemble
  * `att` **default**: GDB will use the AT&T disassembly style (e.g. mov 0xc(%ebp),%eax) that is popular among Linux users.
  * `intel`: GDB will use the Intel disassembly style (e.g. mov eax, DWORD PTR [ebp+0xc]) that is popular among Windows users.
* `show disassembly-flavor`