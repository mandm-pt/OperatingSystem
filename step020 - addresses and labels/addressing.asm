;
; A simple boot sector program that demonstrates addressing.
;

mov ah, 0x0e		; int 10/ah = 0eh -> scrolling teletype BIOS routine

; First attempt
mov al, the_secret	; puts the offset value of 'the_secret' into al
int 0x10

; Second attempt
mov al, [the_secret]	; gets the value pointed by the offset 'the_secret' into al
int 0x10		; although, the CPU from the start of memory, rather than the start
			; address of our loaded code


; Third attempt
mov bx, the_secret	; we add the offset the secret to the address we beleive BIOS
add bx, 0x7c00		; to have loaded our code, 0x7c00, (bx = bx + 0x7c00)
mov al, [bx]		; move the value from bx to al
int 0x10

; Fourth attempt
mov al, [0x7c1d]	; since we know the offset where the X is by examine the raw binary file
int 0x10		; using i.e. (hexedit addressing.bin) and checking where 'X' (0x58 from ASCII table)
			; we do 0x7c00 + 0x1d = 0x7c1d. So we get what is being pointed by that offset

jmp $			; Jump forever

the_secret:
	db "X"


times 510-($-$$) db 0 	; Padding and magic BIOS number.

dw 0xaa55