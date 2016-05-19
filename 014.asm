;Project Euler Problem #14
;https://projecteuler.net/problem=14

section .text

    global _start

    _start:
        mov rdx, 1000000
        xor rbp, rbp                ;current max chain
        xor rbx, rbx                ;current chain length

    loop:
        cmp rbp, rbx
        cmovc rbp, rbx
        cmovc rsi, rdx

        dec rdx
        je finish

        mov rax, rdx                ;rax holds the current number in the chain

        xor rbx, rbx
        jmp _even

    _odd:
        inc rbx
        shl rax, 1                  ;undo shr in _even
        inc rax
        lea rax, [rax + 2 * rax]    ;multiply by 3 optimisation
        inc rax

    _even:
        inc rbx
        shr rax, 1                  ;divide by 2
        jz loop                     ;if 0 then was 1, finish chain
        jc _odd                     ;if carry then was odd
        jmp _even

    finish:

        ;print result
        mov rbp, 10
        mov rdi, 5

    print_loop:
        mov rax, rsi
        test rax, rax
        jz exit

        xor rdx, rdx
        div rbp
        mov rsi, rax
        add dl, '0'
        mov [result + rdi], dl
        dec rdi
        jmp print_loop

    exit:
        mov rcx, result

        mov rax, 4
        mov rbx, 1
        mov rdx, 6
        int 80h

        ;exit with status 0
        xor rbx, rbx
        mov rax, 1
        int 80h

section .bss

    result resb 6
