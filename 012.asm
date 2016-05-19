;Project Euler Problem #12
;https://projecteuler.net/problem=12

extern printf

section .data

    fmt db "%ld",10,0
    tnv dq 1            ;nth triangle number value
    tmp2 dq 0

section .text

    global main

    main:
        mov r8, 1       ;n

        mov r11, 1
        mov r12, 2

    loop:
        fild qword [tnv]
        fsqrt
        fistp qword [tmp2]
        mov rcx, [tmp2]         ;square root of current triangle number value
        xor r9,r9               ;set r9 to 0 to count divisors

    count:
        xor rdx, rdx
        mov rax, [tnv]
        div rcx                 ;divide triangle number by number from sqrt(value) down to 0
        xor rbx, rbx
        cmp rdx, 0              ;check for remainder
        cmovz rbx, r12          ;set rbx to 2 (2 factors per divisor) unless:
        cmp rdx, rcx            ;exact square root only add 1 divisor
        cmovz rbx, r11
        add r9, rbx
        dec rcx
        jnz count               ;loop finished

        cmp r9, 500             ;over 500 divisors?
        jnc exit

        inc r8                  ;if not, check next triangle number
        add [tnv], r8
        jmp loop

    exit:
        mov rdi, fmt
        mov rsi, [tnv]
        mov rax, 0
        call printf

        xor rax, rax
        ret
