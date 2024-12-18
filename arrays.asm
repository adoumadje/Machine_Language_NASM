SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .data
    global x
    x: 
        db 2
        db 3
        db 4

    sum db 0

section .text
    global _start

_start:
    mov eax, 3      ;counter
    mov ebx, 0      ;store the sum
    mov ecx, x      ;pointer          

top:
    add ebx, [ecx]
    add ecx, 1
    dec eax
    jnz top

done:
    add ebx, '0'
    mov [sum], ebx

display:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, sum
    mov edx, 1
    int 0x80

exit:
    mov eax, SYS_EXIT
    int 0x80
