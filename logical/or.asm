;or.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-22

SYS_WRITE equ 4
SYS_READ  equ 3
SYS_EXIT  equ 1
STDIN     equ 0
STDOUT    equ 1

section .text
   global _start

_start:
   mov al, 5
   mov bl, 3
   or  al, bl
   add al, '0'

   mov [result], al
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, result
   mov edx, 1
   int 0x80

outprog:
   mov eax, SYS_EXIT
   int 0x80

section .bss
   result resb 1