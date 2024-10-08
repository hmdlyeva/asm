;conditions.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-19

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .text
   global _start

_start:
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg1
   mov edx, len1
   int 0x80

   mov eax, SYS_READ
   mov ebx, STDIN
   mov ecx, num1
   mov edx, 2
   int 0x80

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg2
   mov edx, len2
   int 0x80

   mov eax, SYS_READ
   mov ebx, STDIN
   mov ecx, num2
   mov edx, 2
   int 0x80

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg3
   mov edx, len3
   int 0x80

   mov eax, SYS_READ
   mov ebx, STDIN
   mov ecx, num3
   mov edx, 2
   int 0x80

   mov ecx, [num1]
   sub ecx, '0'
   mov ebx, [num2]
   sub ebx, '0'
   mov eax, [num3]
   sub eax, '0'

   cmp ecx, ebx
   jg  check_third_num
   mov ecx, ebx
   
check_third_num:
   cmp ecx, eax
   jg  _exit
   mov ecx, eax
   
_exit:
   add ecx, '0'
   mov [largest], ecx

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg4
   mov edx, len4
   int 0x80

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, largest
   mov edx, 2
   int 0x80

   mov eax, SYS_EXIT
   int 0x80

segment .data
   msg1 db "Enter a digit:", 0xA
   len1 equ $ - msg1

   msg2 db "Please enter a second digit:", 0xA
   len2 equ $ - msg2

   msg3 db "Please enter a third digit:", 0xA
   len3 equ $ - msg3

   msg4 db "The largest digit is: "
   len4 equ $ - msg4

segment .bss
   num1 resd 2
   num2 resd 2
   num3 resd 2
   largest resd 2  