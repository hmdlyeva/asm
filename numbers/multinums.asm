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
   mov     esi, 4       ;pointing to the rightmost digit
   mov     ecx, 5       ;num of digits
   clc
add_loop:  
   mov 	al, [num1 + esi]
   adc 	al, [num2 + esi]
   aaa
   pushf
   or 	al, 30h
   popf
	
   mov	[sum + esi], al
   dec	esi
   loop	add_loop
	
   mov	edx, len	       
   mov	ecx, msg	       
   mov	ebx, STDOUT	       
   mov	eax, SYS_WRITE	       
   int	0x80	       
	
   mov	edx, 5	       
   mov	ecx, sum	     
   mov	ebx ,STDOUT	        
   mov	eax ,SYS_WRITE	       
   int	0x80	       
	
   mov	eax,SYS_EXIT	      
   int	0x80	       

section	.data
msg db 'The Sum is:',0xa	
len equ $ - msg			
num1 db '12345'
num2 db '23456'
sum db '     '