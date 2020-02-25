# Necessary tools
- QEmu - CPU emulator
- nasm - The Netwide Assembler, a portable 80x86 assembler
- hexedit - View and edit files in hexadecimal or in ASCII 

## Useful Commands
- Assemble asm code\
`nasm IN_FILE -f bin -o OUT_FILE`
- View raw data\
`od -t x1 -A n FILE`\
`hexdump -C FILE`
- Run emulator\
`qemu-system-x86_64 FILE`
- Disassemble raw i8086 code [link](https://stackoverflow.com/a/34424194/1845593)
    ```
    objdump -D -Mintel,i8086 -b binary -m i386 mbr.bin
    objdump -D -Mintel,i386 -b binary -m i386 foo.bin    # for 32-bit code
    objdump -D -Mintel,x86-64 -b binary -m i386 foo.bin  # for 64-bit code
    ```
