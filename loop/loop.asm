;conditions.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-29

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .text
   global _start

_start:
   mov ecx,10
   mov eax, '1'

l1:
   mov [num], eax
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   push ecx           ;ecx deyerini stacka yazdirir

   mov ecx, num
   mov edx, 1
   int 80h

   mov eax, [num]
   sub eax, '0'
   inc eax
   add eax, '0'
   pop ecx            ;ecx deyerini stackdan silir ki loop qarismasin
   loop l1            ;ecx deyerine kimi loop edir

   mov eax, SYS_EXIT
   int 80h

section .bss
   num resb 1