SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .data
    msg db "The result is: ", 0xa
    len equ $ - msg

section .bss
    res resb 1

section .text
    global _start

_start:

    sub ah, ah
    mov al, '9'
    sub al, '3'
    aas
    or al, 30h
    mov [res], al

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int 0x80

    mov eax, SYS_EXIT
    int 0x80