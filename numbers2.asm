SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .data
    msg db "The sum is: ", 0xa
    len equ $ - msg
    num1 db '12345'
    num2 db '23456'
    sum db '     '

section .text
    global _start

_start:
    mov esi, 4
    mov ecx, 5
    clc

add_loop:
    mov al, [num1 + esi]
    adc al, [num2 + esi]
    aaa
    pushf
    or al, 30h
    popf

    mov [sum + esi], al
    dec esi
    loop add_loop

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax,SYS_WRITE
    mov ebx, STDOUT
    mov ecx, sum
    mov edx, 5
    int 0x80

    mov eax, SYS_EXIT
    int 0x80