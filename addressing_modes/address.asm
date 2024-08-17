; address.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-17

section .text
   global _start
_start:

   ;writing the name 'Hamida Allahverdiyeva'
   mov eax, 4
   mov ebx, 1
   mov ecx, name
   mov edx, 22
   int 0x80

   ; Changed the name to Sabina Allahverdiyeva
   mov [name], word 'Sa'  
   mov [name+2], dword 'bina'

   ;writing the name 'Sabina Allahverdiyeva'
   mov eax, 4
   mov ebx, 1
   mov ecx, name
   mov edx, 21
   int 0x80 

   mov eax, 1   ;for exit
   int 0x80

section .data
   name db 'Hamida Allahverdiyeva', 0xA