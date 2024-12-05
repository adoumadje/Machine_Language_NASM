SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .data

    msg db "The largest number is: ", 0xA, 0xD
    len equ $ - msg

    num1 dd '47'
    num2 dd '22'
    num3 dd '31'

section .bss

    largest resb 2

section .text

    global _start

_start:

    mov ecx, [num1]
    cmp ecx, [num2]
    jg check_third_num
    mov ecx, [num2]

check_third_num:

    cmp ecx, [num3]
    jg _exit
    mov ecx, [num3]

_exit:

    mov [largest], ecx

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, largest
    mov edx, 2
    int 0x80

    mov eax, SYS_EXIT
    int 0x80
