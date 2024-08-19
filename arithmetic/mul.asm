;mul.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-19

SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .text
   global _start

_start:
   
   mov	al,'3'
   sub    al, '0'
	
   mov 	bl, '2'
   sub    bl, '0'
   mul 	bl
   add	al, '0'
	
   mov 	[res], al

   mov	eax, SYS_WRITE	
   mov	ebx, STDOUT	
   mov	ecx, msg	
   mov	edx, len
   int	0x80

   mov	eax, SYS_WRITE	
   mov	ebx, STDOUT	
   mov	ecx, res	
   mov	edx, 1
   int	0x80

   mov eax, SYS_EXIT
   int 0x80

section .data
   msg db "The result is:", 0xA,0xD
   len equ $ - msg

segment .bss
   res resb 1
