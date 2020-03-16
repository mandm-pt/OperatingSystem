# Debug boot loader

* start qemu with the following flags:
  * `-s`: Shorthand for -gdb tcp::1234, i.e. open a gdbserver on TCP port 1234.
  * `-S`: Do not start CPU at startup (you must type 'c' in the monitor).
  * **Example:** `qemu-system-x86_64 -s -S <FILE>`
* start gdb and do the following commands:
  * `target remote localhost:1234`: connect to remote machine on port 1234
  * `br *0x7c00`: set breakpoint at address 0x7c00
  * `c`: continue running the program until the next breakpoint
