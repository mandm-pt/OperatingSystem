AS = nasm

addressing.bin: addressing.asm
	$(AS) $< -f bin -o $@

.PHONY: clean
clean:
	rm *.bin
