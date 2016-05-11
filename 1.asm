;Project Euler Problem #1
;https://projecteuler.net/problem=1

extern printf

section .data

    curr dd 0
    sum dd 0
    fmt db "%d", 0x0a, 0

section .text

    global main

    main:
        mov ecx, 999 ;loop 999 times

    _loop:
        mov [curr], ecx
        mov eax, [curr]
        xor edx, edx
        mov ebx, 3
        div ebx
        cmp edx, 0
        je add_to_sum
        mov eax, [curr]
        xor edx, edx
        mov ebx, 5
        div ebx
        cmp edx, 0
        je add_to_sum
    return_point:
        loop _loop ;loop auto decrements ecx
        push dword [sum]
        push fmt
        call printf

        mov eax, 1
        xor ebx, ebx
        int 80h

    add_to_sum:
        mov eax, [curr]
        add [sum], eax
        jmp return_point
