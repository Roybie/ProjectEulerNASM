;Project Euler Problem #2
;https://projecteuler.net/problem=2

extern printf

section .data

    fa dd 1
    fb dd 2
    sum dd 0
    max dd 4000000
    fmt db "%d", 0x0a, 0

section .text

    global main

    main:

        mov ecx, [max]

    _loop:
        mov eax, [fb]
        xor edx, edx
        mov ebx, 0x02
        div ebx
        cmp edx, 0
        je add_to_sum
    return_point:
        mov eax, [fa]
        mov ebx, [fb]
        add [fb], eax
        mov [fa], ebx
        cmp [fb], ecx
        jg exit_loop
        loop _loop

    exit_loop:
        push dword [sum]
        push fmt
        call printf

        mov eax, 1
        xor ebx, ebx
        int 80h

    add_to_sum:
        mov eax, [fb]
        add [sum], eax
        jmp return_point
