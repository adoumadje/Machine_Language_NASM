SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .data

    even_msg db "Even Number!", 0xA, 0xD
    len1 equ $ - even_msg
    odd_msg db "Odd Number!", 0xA, 0xD
    len2 equ $ - odd_msg

section .text

    global _start


_start:

    mov ax, 8H
    and ax, 1

    jz evnn

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, odd_msg
    mov edx, len2
    int 0x80
    jmp outprog

evnn:

    mov ah, 09H

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, even_msg
    mov edx, len1
    int 0x80

outprog:

    mov eax, SYS_EXIT
    int 0x80