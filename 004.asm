;Project Euler Problem #4
;https://projecteuler.net/problem=4

extern printf

section .data

    x dq 999
    y dq 999
    max dq 0
    buf dq 0
    fmt db "%ld",10,0

section .text

    global main

    main:

        mov rax, [x]
        mov rbx, [y]
        mul rbx
        mov rbx, rax
        mov rdi, buf
        mov rsi, rdi
        call push_to_stack
        sub rdi, 2

        lodsb
        cmp al, [rdi]
        jne decrement_digits
        dec rdi
        lodsb
        cmp al, [rdi]
        jne decrement_digits
        dec rdi
        lodsb
        cmp al, [rdi]
        jne decrement_digits
        cmp rbx, [max]
        jl decrement_digits
        mov [max], rbx
        jmp exit

    decrement_digits:
        dec qword [y]
        cmp qword [y], 900
        jg main
        dec qword [x]
        cmp qword [x], 900
        je exit
        mov rax, [x]
        mov [y], rax
        jmp main

    exit:
        mov rdi, fmt
        mov rsi, [max]
        mov rax, 0
        call printf

        mov rax, 1
        xor rbx, rbx
        int 80h


    push_to_stack:
        mov rcx, 10
        push 0

        loop_digit:

        xor rdx, rdx
        div rcx
        add rdx, "0"
        push rdx
        cmp rax, 0
        jne loop_digit

        pop_digit:

        pop rax
        stosb
        or al, al
        jnz pop_digit

        ret

