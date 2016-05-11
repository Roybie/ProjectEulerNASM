;Project Euler Problem #9
;https://projecteuler.net/problem=9

extern printf

section .data

    fmt db "%ld",10,0 ;printf format

section .text

    global main

    main:
        mov rcx, 997 ;initialise c

    loop_one:
        mov rbx, 1000
        sub rbx, rcx ;b must be at most 1000 - c - 1
        dec rbx

    loop_two:
        mov rax, 1000
        sub rax, rcx ;a must be at most 1000 -c -b
        sub rax, rbx

        push rax ;store a, b and c whilst doing multiplcation checks
        push rbx
        push rcx

        xor rdx, rdx ;clea rdx for multiplication
        mul rax ;a^2
        mov rsi, rax ;store a^2
        mov rax, rbx ;copy b for squaring
        mul rax ;b^2
        add rsi, rax ;add a^2 and b^2

        mov rax, rcx ;copy c for squaring
        mul rax ;c^2

        cmp rax, rsi ;does c^2 == a^2 + b^2
        je final ;if so solution found

        pop rcx ;restore values of a, b and c
        pop rbx
        pop rax

        dec rbx ;decrease b
        cmp rbx, 1 ;b has to be at least 2 to satisfy a > b > c
        jg loop_two ;loop with smaller b

        dec rcx ;decrease c
        cmp rcx, 334 ;c has to be at least 335 to satisfy a > b >c
        jg loop_one ;loop with smaller c

        xor rax, rax ;no solution found print 0
        jmp exit

    final: ;solution found, calculate product abc
        pop rcx ;restore values of a, b and c
        pop rbx
        pop rax

        xor rdx, rdx
        mul rbx
        mul rcx ;product stored in rax for printf
        jmp exit

    exit:
        mov rdi, fmt
        mov rsi, rax
        mov rax, 0
        call printf
        ret
