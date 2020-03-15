AS = nasm

stack.bin: stack.asm
	$(AS) $< -f bin -o $@

.PHONY: clean
clean:
	rm *.bin
