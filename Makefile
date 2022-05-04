
all: nasm_example gas_example c_example

test_all: nasm_example gas_example c_example
	./c_example
	@echo $?
	./nasm_example
	@echo $?
	./gas_example
	@echo $?

nasm_example: nasm_example.o
	ld -o $@ $^

nasm_example.o: factorials.nasm
	nasm -f elf64 -o $@ $<

gas_example: gas_example.o
	ld -o $@ $^

gas_example.o: factorials.s
	as -o $@ $<

c_example: factorials.c
	gcc -o $@ $<

clean:
	$(RM) gas_example.o nasm_example.o
	$(RM) gas_example nasm_example c_example
