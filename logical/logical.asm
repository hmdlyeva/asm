;logical.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-21

SYS_WRITE equ 4
SYS_READ  equ 3
SYS_EXIT  equ 1
STDIN     equ 0
STDOUT    equ 1

section .text
   global _start

_start:
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg1
   mov edx, len_msg1
   int 0x80
   
   mov eax, SYS_READ
   mov ebx, 2
   mov ecx, num
   mov edx, 2
   int 0x80

   mov ax, [num]
   sub ax, '0'
   and ax, 1          ;and ax with 1
   jz  evnn

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, odd_msg
   mov edx, len2
   int 0x80
   jmp outprog

evnn:
   mov ah, 09h
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, even_msg
   mov edx, len1
   int 0x80

outprog:
   mov eax, SYS_EXIT
   mov ebx, STDOUT
   int 0x80

section .data
   msg1 db "Enter a number: "
   len_msg1 equ $ - msg1
   even_msg db "Even Number!"
   len1 equ $ - even_msg
   odd_msg db "Odd Number!"
   len2 equ $ - odd_msg

section .bss
    num resb 2