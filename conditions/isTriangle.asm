;conditions.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-25

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

; check_first_condition:
   mov edx, ecx
   add edx, ebx
   cmp edx, eax
   jle false_condition
   ; jg  check_second_condition

; check_second_condition:
   ; mov ecx, [num1]
   ; sub ecx, '0'
   ; sub ecx, ebx
   ; add ecx, '0'
   mov edx, ecx
   add edx, eax
   cmp edx, ebx
   jle false_condition
   ; jg  check_last_condition

; check_last_condition:
   ; mov ecx, [num1]
   ; sub ecx, '0'
   ; sub ecx, eax
   ; add ecx, '0'
   mov edx, ebx
   add edx, eax
   cmp edx, ecx
   jle false_condition
   ; jg  true_condition

true_condition:
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, true_msg
   mov edx, true_len
   int 0x80
   jmp _exit

false_condition:
   ; mov ah, 09h
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, false_msg
   mov edx, false_len
   int 0x80

_exit:
   mov eax, SYS_EXIT,
   mov ebx, STDOUT
   int 0x80

segment .data
   msg1 db "Enter a digit:", 0xA
   len1 equ $ - msg1

   msg2 db "Please enter a second digit:", 0xA
   len2 equ $ - msg2

   msg3 db "Please enter a third digit:", 0xA
   len3 equ $ - msg3

   true_msg db "This triangle is True!"
   true_len equ $ - true_msg

   false_msg db "This triangle is False!"
   false_len equ $ - false_msg

segment .bss
   num1 resd 2
   num2 resd 2
   num3 resd 2