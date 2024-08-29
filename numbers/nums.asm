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
;ax = ah * 256 + al
;or hexadecimaldi ascii '0' '48' ise decimal
;6 + 48 = 54 ederek ascii de '6' deyerini aldiq
;ax ah 0 olduqundan al nedise o olacaq
   sub  ah, ah
   mov  al, '9'
   sub  al, '3'
   aas
   or   al, 30h
   mov  [res], ax
	
   mov	edx, len	     
   mov	ecx, msg	  
   mov	ebx, STDOUT     
   mov	eax, SYS_WRITE	      
   int	0x80	      
	
   mov	edx, 1	       
   mov	ecx, res	      
   mov	ebx, STDOUT	       
   mov	eax, SYS_WRITE	       
   int	0x80	       
	
   mov	eax,1	       
   int	0x80	      
	
section	.data
msg db 'The Result is:'
len equ $ - msg			
section .bss
res resb 1  