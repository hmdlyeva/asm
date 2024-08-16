; app.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-15


section .text     ;code segment
    global _start

_start:            ;user prompt
    mov eax, 0x4
    mov ebx, 1
    mov ecx, userMsg
    mov edx, message_len
    int 0x80
    
    ;read and store the user input
    mov	eax, 3     ;sys_read
    mov	ebx, 2     ;
    mov	ecx, num   ;num from input
    mov	edx, 5     ;5 bytes (numeric, 1 for sign) of that information
    int	0x80       ;call kernel

    ;Output the message 'The entered number is: '
    mov eax, 0x4
    mov ebx, 1
    mov ecx, disMsg
    mov edx, disMsg_len
    int 0x80

    ;Output the entered number
    mov eax, 0x4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 0x80

    ;exit
    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .data
    userMsg: db "Please enter a number:", 0xA
    message_len equ $ - userMsg
    disMsg: db "You have entered: "
    disMsg_len equ $ - disMsg
    ; s2 times 9 db '*'

section .bss     ;uninitialized data
    num resb 5