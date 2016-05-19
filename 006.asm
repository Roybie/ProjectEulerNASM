;Project Euler Problem #6
;https://projecteuler.net/problem=6

extern printf

section .data

    limit dq 100
    fmt db "%ld", 10, 0

section .text

    global main

    main:

        xor rcx, rcx
        xor rbx, rbx

    sum_sq:

        inc rcx
        mov rax, rcx
        xor rdx, rdx
        mul rax

        add rbx, rax

        cmp rcx, [limit]
        jne sum_sq

        push rbx
        xor rcx, rcx
        xor rbx, rbx

    sq_sum:

        inc rcx
        add rbx, rcx
        cmp rcx, [limit]
        jne sq_sum

        mov rax, rbx
        xor rdx, rdx
        mul rax

        pop rbx
        sub rax, rbx

    exit:

        mov rdi, fmt
        mov rsi, rax
        mov rax, 0
        call printf

        mov rax, 1
        xor rbx, rbx
        int 80h
