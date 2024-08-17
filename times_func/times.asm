; app.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-15


section .text     ;code segment
    global _start

_start:            ;user prompt
    mov eax, 0x4
    mov ebx, 1
    mov ecx, message
    mov edx, message_len
    int 0x80

    mov	eax, 4    ;system call number (sys_write)
    mov	ebx, 1    ;file descriptor (stdout)
    mov	ecx, s2   ;message to write
    mov	edx, 9    ;message length
    int	0x80      ;call kernel

    ;exit
    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .data
    message: db "Displaying 9 stars", 0xA
    message_len equ $ - message
    s2 times 9 db '*'
