;
; 
;

jmp $			; Jump forever

the_secret:
	db "X"


times 510-($-$$) db 0 	; Padding and magic BIOS number.

dw 0xaa55