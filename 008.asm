;Project Euler Problem #8
;https://projecteuler.net/problem=8

extern printf

section .data

    max dq 0
    arr incbin "./008.data"
    fmt db "%ld",10,0

section .text

    global main

    main:
        mov rcx, 12

    next:
        sub rcx, 12
        cmp rcx, 987
        jge exit

        xor rbx, rbx
        mov rax, 1

    loop:
        xor rdx, rdx
        mov dl, [arr+rcx]
        sub rdx, '0'
        mul rdx

        inc rcx
        inc rbx
        cmp rbx, 13
        jl loop

        cmp rax, [max]
        jl next

        mov qword [max], rax
        jmp next

    exit:
        mov rdi, fmt
        mov rsi, [max]
        mov rax, 0
        call printf

        xor rax, rax
        ret

