;Project Euler Problem #5
;https://projecteuler.net/problem=5

extern printf

section .data

    fmt db "%ld",10,0

section .text

    global main

    main:

        mov rcx, 20
        mov rbx, rcx

    loop:

        xor rdx, rdx
        mov rax, rbx
        div rcx
        cmp rdx, 0
        jz next
        mov rcx, 20
        add rbx, rcx
        jmp loop

    next:

        dec rcx
        jz exit
        jmp loop

    exit:

        mov rdi, fmt
        mov rsi, rbx
        mov rax, 0
        call printf

        mov rax, 1
        xor rbx, rbx
        int 80h
