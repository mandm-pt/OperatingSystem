# Exercice
Add the following `[org 0x7c00]` at the top of the code.

- **Question**: What do you expect will be printed now, when this org directive is added to this boot-sector program?
- **Simple Answer**: using the directive `ORG` we can specify the address that NASM will assume the program will be loaded in memory(chapter 7.1.1 ORG: Binary File Program Origin, from the manual). With that, NASM will adjust the internal references (labels) used in the section. 

**Detailed Answer**

Code **without** org directive
```asm
00000000 <.data>:
0:	b4 0e                	mov    ah,0xe
2:	b0 1d                	mov    al,0x1d
4:	cd 10                	int    0x10
6:	a0 1d 00             	mov    al,ds:0x1d
9:	cd 10                	int    0x10
b:	bb 1d 00             	mov    bx,0x1d
e:	81 c3 00 7c          	add    bx,0x7c00
12:	8a 07                	mov    al,BYTE PTR [bx]
14:	cd 10                	int    0x10
16:	a0 1d 7c             	mov    al,ds:0x7c1d
19:	cd 10                	int    0x10
1b:	eb fe                	jmp    0x1b
1d:	58                   	pop    ax
    ...
1fe:	55                   	push   bp
1ff:	aa                   	stos   BYTE PTR es:[di],al
```

Code **with** org directive
```asm
00000000 <.data>:
0:	b4 0e                	mov    ah,0xe
2:	b0 1d                	mov    al,0x1d
4:	cd 10                	int    0x10
6:	a0 1d 7c             	mov    al,ds:0x7c1d
9:	cd 10                	int    0x10
b:	bb 1d 7c             	mov    bx,0x7c1d
e:	81 c3 00 7c          	add    bx,0x7c00
12:	8a 07                	mov    al,BYTE PTR [bx]
14:	cd 10                	int    0x10
16:	a0 1d 7c             	mov    al,ds:0x7c1d
19:	cd 10                	int    0x10
1b:	eb fe                	jmp    0x1b
1d:	58                   	pop    ax
    ...
1fe:	55                   	push   bp
1ff:	aa                   	stos   BYTE PTR es:[di],al
```

Note that the differences are in the offeset' `6` and `b`.
The reason why it is printing the 'X' on the 2nd attempt, is because NASM adjusted automatically the valued that was being pointed by the label "the_secret" (line 31 [source](./addressing.asm)) to be the address where the code starts (0x7c00) + the offset of the label (0x1d).\
Since we were doing the math manually on the 3rd attempt, and NASM adjusted the references, out calculation now is doing 0x7c1d + 0x7c00, that's why the 3rd attempt stoped working with the `ORG` directive