# ProjectEulerNASM
Project Euler solutions in Netwide Assembler

Solutions to Project Euler problems in assembly (NASM)

These are my first attempts at assembly so I'm sure they leave much room for improvement.
Solutions so far (< problem 10) mostly run in 0.001s though.

compiled on linux with:

`nasm -f elf64 1.asm`

linked with gcc (for printf to easily print out large numbers)

`gcc -m64 -0 1.o`

run with (time optional)

`time ./1`
