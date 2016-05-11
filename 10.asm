;Project Euler Problem #10
;https://projecteuler.net/problem=10

extern printf

section .data

    to_sqrt dq 0                    ;used to load into the FPU
    from_sqrt dq 0                  ;used to copy sqrt back to register
    fmt db "%ld",10,0               ;printf format

section .text

    global main

    main:
        mov rax, 2                  ;hold sum of primes (2 is the first prime and only non-odd so add to start with)
        mov rbx, 2000000            ;sum all primes below 2 million
        mov rcx, 3                  ;currently being checked

    loop:
        push rax
        push rcx                    ;push to stack so isprime doesn't destroy values

        mov [to_sqrt], rcx
        call isprime
        pop rcx                     ;restore values
        pop rax
        cmp rsi, 0                  ;0 means not prime
        je continue                 ;so continue loop

        add rax, rcx                ;otherwise increase sum

    continue:
        add rcx, 2                  ;increment number to test by two (only odd numbers are prime)
        cmp rcx, rbx                ;if reached 2000000 limit then exit
        jge exit

        jmp loop

    exit:                           ;exit and print out sum
        mov rdi, fmt
        mov rsi, rax
        mov rax, 0
        call printf
        ret

    isprime:
        fild qword [to_sqrt]        ;load number to check into fpu
        fsqrt                       ;calculate sqrt
        fistp qword [from_sqrt]     ;return to memory
        add qword [from_sqrt], 1
        mov rcx, 3                  ;initalise to first possibly factor
    isprime_loop:
        cmp rcx, [from_sqrt]        ;if reached sqrt then prime
        jge _yes

        mov rax, [to_sqrt]
        xor rdx, rdx
        div rcx
        cmp rdx, 0                  ;does rcx divide neatly into number
        je _no                      ;if so, not prime, return false

        add rcx, 2                  ;increment check through odd numbers
        jmp isprime_loop
    _yes:
        mov rsi, 1                  ;return 1 in rsi if prime
        ret
    _no:
        mov rsi, 0                  ;return 0 in rsi if not prime
        ret
