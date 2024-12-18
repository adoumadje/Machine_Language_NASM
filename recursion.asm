SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .data
    msg db "Factorial 3 is: ", 0xa
    len equ $ - msg

section .bss
    fact resb 1

section .text
    global _start

_start:
    mov bx, 3

    call proc_fact

    add ax, 30h
    mov [fact], ax

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, fact
    mov edx, 1
    int 0x80

    mov eax, SYS_EXIT
    int 0x80

proc_fact:
    cmp bl, 1
    jg do_calculation
    mov ax, 1
    ret

do_calculation:
    dec bl
    call proc_fact
    inc bl
    mul bl
    ret