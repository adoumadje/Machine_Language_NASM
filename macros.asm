SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

%macro write_string 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .data
    msg1 db "Hello, programmers!", 0xA, 0xD
    len1 equ $ - msg1

    msg2 db "Welcome to the world of,", 0xA, 0xD
    len2 equ $ - msg2

    msg3 db "Linux assembly programming!", 0xA, 0xD
    len3 equ $ - msg3

section .text
    global _start

_start:
    write_string msg1, len1
    write_string msg2, len2
    write_string msg3, len3

    mov eax, SYS_EXIT
    int 0x80
