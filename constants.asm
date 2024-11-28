SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .text
    global _start           ;must be declared for linker (ld)

_start:

    mov edx, lenMsg1        ;message length
    mov ecx, msg1           ;message to write
    mov ebx, STDOUT         ;file descriptor (stdout)
    mov eax, SYS_WRITE      ;system call number (sys_write)
    int 0x80                ;call kernel

    mov edx, lenMsg2        ;message length
    mov ecx, msg2           ;message to write
    mov ebx, STDOUT         ;file descriptor (stdout)
    mov eax, SYS_WRITE      ;system call number (sys_write)
    int 0x80                ;call kernel

    mov edx, lenMsg3        ;message length
    mov ecx, msg3           ;message to write
    mov ebx, STDOUT         ;file descriptor (stdout)
    mov eax, SYS_WRITE      ;system call number (sys_write)
    int 0x80                ;call kernel

    mov eax, SYS_EXIT       ;system call number (sys_exit)
    int 0x80                ;call kernel

section .data
    msg1 db 'Hello, programmers!',0xA,0xD
    lenMsg1 equ $ - msg1

    msg2 db 'Welcome to the world of,', 0xA,0xD
    lenMsg2 equ $ - msg2

    msg3 db 'Linux assembly programming! '
    lenMsg3 equ $ - msg3 