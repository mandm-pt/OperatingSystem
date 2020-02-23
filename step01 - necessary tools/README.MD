# Necessary tools
- QEmu - CPU emulator
- nasm - The Netwide Assembler, a portable 80x86 assembler
- hexedit - View and edit files in hexadecimal or in ASCII 

## Useful Commands
- Assemble asm code\
`nasm IN_FILE -f bin -o OUT_FILE`
- View raw data\
`od -t x1 -A n FILE`
- Run emulator\
`qemu-system-x86_64 FILE`