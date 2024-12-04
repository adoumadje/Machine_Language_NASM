SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .data

    msg db "The result of 8 / 2 is: ", 0xA, 0xD
    len equ $ - msg

section .bss

    res resb 1

section .text 

    global _start           ;must be delared for using gcc

_start:                     ;tell linker entry point

    mov ax, '8'
    sub ax, '0'

    mov bl, '2'
    sub bl, '0'

    div bl
    add ax, '0'

    mov [res], ax

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
