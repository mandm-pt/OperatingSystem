;
; Implementation of IF, IF-THEN, IF-THEN-ELSE, IF THEN-ELSE IF-ELSE
;

mov ah, 0x0e		; int 10/ ah = 0 eh -> scrolling teletype BIOS routine

; GOTO
jmp jump_over

mov al, '1'		; this won't be printed, we jump over it
int 0x10

jump_over:
	mov al, '2'
	int 0x10


; IF-THEN
;		if (al = 'X')
;			print('3')
cmp al,'X'
jne al_not_x
	mov al, '3'	; this won't be printed, since al = '2'
	int 0x10


al_not_x:
	mov al, '4'
	int 0x10


; IF-THEN-ELSE
;		if (al = '4') print('5')
;		else print('7')
cmp al,'4'
je al_equals_4
	mov al, '7'	; al != 4, then print('7')
	int 0x10
jne al_equals_4_continue
al_equals_4:
	mov al, '5'	; al = 4, then print('5')
	int 0x10
al_equals_4_continue:


mov al, '>'
int 0x10


; IF-ELSE IF-ELSE
;		if (al = '5') print('6')
;		if (al = '7') print('7')
;		else print('9')
cmp al,'5'
je al_equals_5
cmp al,'7'
je al_equals_7
	mov al, 'X'	; al != 5 AND al != 7
	int 0x10
	jmp al_if_else_continue
al_equals_7:	
	mov al, '8'	; al = 7
	int 0x10
	jmp al_if_else_continue
al_equals_5:
	mov al, '6'	; al = 5
	int 0x10

al_if_else_continue:


mov al, '.'		; the end
int 0x10
jmp $			; Jump forever



times 510-($-$$) db 0 	; Padding and magic BIOS number.

dw 0xaa55
