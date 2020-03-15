# GDB 

`gdb` - starts gdb program

`target remote localhost:1234` - Debug remote host on port 1234

`step` - 
`next` - 
`finish` - Continue until the current function returns
`continue` or `c` - Continue normal execution

`layout asm` - shows code
`dashboard -layout assembly registers stack`

## Get information
`info args` - 
`info breakpoints` - 
`info display` - 

## Formatting

`a` - Pointer
`c` - Read as integer, print as character
`d` - Integer, signed decimal
`f` - Floating point number
`o` - Integer, print as octal
`s` - Try to treat as C string.tInteger, print as binary (t = „two“)
`u` - Integer, unsigned decimal
`x` - Integer, print as hexadecimal
