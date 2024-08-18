;variable_const.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-18

SYS_EXIT  equ 1
SYS_WRITE equ 4
SYS_READ  equ 3
STDIN     equ 0
STDOUT    equ 1

section .text
   global _start

_start:

   ; %assign width 10
   ; %assign length 20
   ; %assign area width * length

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg1
   mov edx, len1
   int 80h

   mov eax, SYS_READ
   mov ebx, STDIN
   mov ecx, width
   mov edx, 2
   int 80h

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg2
   mov edx, len2
   int 80h

   mov eax, SYS_READ
   mov ebx, STDIN
   mov ecx, length
   mov edx, 2
   int 80h
   

   movzx eax, byte [width]   ; width'i eax'a yükle
   sub eax, '0'              ; Convert ASCII to integer
   movzx ebx, byte [length]  ; length'i ebx'a yükle
   sub ebx, '0'              ; Convert ASCII to integer
   imul eax, ebx             ; eax = eax * ebx
   mov [area], eax           ; area'ni eax'a yazdır

   ;Print result
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, result_msg
   mov edx, result_len
   int 80h

   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, area
   mov edx, 4
   int 80h
   
   ;exit
   mov eax, SYS_EXIT
   mov ebx, STDIN
   int 80h

section .data
   msg1 db 'Enter width value: ', 0
   len1 equ $ - msg1
   msg2 db 'Enter length value: ', 0
   len2 equ $ - msg2
   result_msg db 'Area is: ', 0
   result_len equ $ - result_msg

section .bss
   width resb 2   ; reserve 2 byte for width
   length resb 2  ; reserve 2 byte for length
   area resb 4    ; reserve 4 byte for area