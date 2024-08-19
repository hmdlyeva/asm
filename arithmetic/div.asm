;div.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-19

SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .text
   global _start

_start:

   mov	ax,'8'
   sub    ax, '0'
	
   mov 	bl, '2'
   sub    bl, '0'
   div 	bl
   add	ax, '0'
	
   mov 	[res], ax

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
