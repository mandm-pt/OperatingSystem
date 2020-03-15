AS = nasm

all: basic.bin hello_world.bin

%.bin: %.asm
	$(AS) $< -f bin -o $@

.PHONY: clean
clean:
	$(RM) *.bin
