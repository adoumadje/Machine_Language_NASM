SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .data
    msg db "The result of 3 x 2 is: ", 0xA, 0xD
    len equ $ - msg

section .bss
    res resb 1

section .text
    global _start       ;must be declared for using gcc

_start:                 ;tell linker entry point

    mov al, '3'
    sub al, '0'

    mov bl, '2'
    sub bl, '0'

    mul bl

    add al, '0'

    mov [res], al

    mov eax, SYS_WRITE
    mov ebx, STDOUT,
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