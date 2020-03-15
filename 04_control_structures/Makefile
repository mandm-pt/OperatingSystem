AS = nasm

if.bin: if.asm
	$(AS) $< -f bin -o $@

.PHONY: clean
clean:
	rm *.bin
