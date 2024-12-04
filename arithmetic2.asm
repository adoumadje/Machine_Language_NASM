SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1



section .data
    msg db "The sum is: ", 0xA, 0xD
    len equ $ - msg

section .bss
    sum resb 1

section .text
    global _start       ;must be declared for using gcc

_start:                 ;tell linker entry point

    mov eax, '3'
    sub eax, '0'

    mov ebx, '4'
    sub ebx, '0'

    add eax, ebx
    add eax, '0'

    mov [sum], eax

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, sum
    mov edx, 1
    int 0x80

    mov eax, SYS_EXIT
    int 0x80