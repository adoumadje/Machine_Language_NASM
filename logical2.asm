SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .bss

    res resb 1

section .text

    global _start

_start:

    mov al, 5
    mov bl, 3

    or al, bl
    add al, '0'

    mov [res], al

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int 0x80

outprog:

    mov eax, SYS_EXIT
    int 0x80