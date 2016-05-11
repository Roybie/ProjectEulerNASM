;Project Euler Problem #3
;https://projecteuler.net/problem=3

extern printf

section .data

    limit dq 600851475143
    largest dq 0
    fmt db "%ld",10,0

section .text

    global main

    main:
        mov rcx, 2

    loop_start:
        xor rdx, rdx
        mov rax, [limit]
        div rcx
        cmp rdx, 0
        jne not_factor

        mov [limit], rax
        mov [largest], rcx
        cmp [limit], rcx
        jle exit

    not_factor:
        inc rcx
        jmp loop_start

    exit:
        mov rdi, fmt
        mov rsi, [largest]
        mov rax, 0
        call printf

        mov rax, 1
        xor rbx, rbx
        int 80h



