; app.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-15

global _start

section .text:

_start:
    mov eax, 0x4
    mov ebx, 1
    mov ecx, message
    mov edx, message_len
    int 0x80

    ;exit
    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .data:
    message: db "Hello Hamida!", 0xA
    message_len equ $ - message