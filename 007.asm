;Project Euler Problem #7
;https://projecteuler.net/problem=7

extern printf

section .text

    global main

    main:

        mov rbx, [check]
        call isprime
        cmp rax, 0
        je next
        inc qword [tally]
        cmp qword [tally], 10001
        je exit
    next:
        inc qword [check]
        jmp main

    exit:

        mov rdi, fmt
        mov rsi, [check]
        mov rax, 0
        call printf

        mov rax, 1
        xor rbx, rbx
        int 80h

    isprime:

        fild qword [check]
        fsqrt
        fistp qword [tmp]
        mov rcx, [tmp]
        inc rcx

    loop:
        dec rcx
        cmp rcx, 1
        je _yes

        mov rax, [check]
        xor rdx, rdx
        div rcx

        cmp rdx, 0
        je _no
        jmp loop

    _yes:
        mov eax, 1
        jmp _ret

    _no:
        mov eax, 0

    _ret:
        ret

    section .data

        check dq 2
        tally dq 0
        tmp dq 0
        fmt db "%ld",10,0
