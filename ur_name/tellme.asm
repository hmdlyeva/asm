;tellme.asm
; Author: Hamida Allahverdiyeva
; Date: 2024-08-17

section .text
   global _start

_start:
   
   mov eax, 4
   mov ebx, 1
   mov ecx, msg
   mov edx, msg_len
   int 80h

   ;read and store the user input
   mov eax, 3
   mov ebx, 2
   mov ecx, username
   mov edx, 100
   int 80h

   ; store the number of bytes read in edx for later use
   mov [username_len], eax

   ;output the messgae 'Your name is: '
   mov eax, 4
   mov ebx, 1
   mov ecx, disMsg
   mov edx, disMsg_len
   int 80h

   ;output the entered username
   mov eax, 4
   mov ebx, 1
   mov ecx, username
   mov edx, [username_len]
   int 80h

   ;send msh that 'Change ur name to: '
   mov eax, 4
   mov ebx, 1
   mov ecx, change_msg
   mov edx, change_msg_len
   int 80h

   ;read and store the user input again
   mov eax, 3
   mov ebx, 2
   mov ecx, change_username
   mov edx, 100
   int 80h

   ;store the number of bytes read in edx for later use
   mov [change_username_len], eax

   ;output the messgae 'Your name NAME to NEWNAME: '
   mov eax, 4
   mov ebx, 1
   mov ecx, disNewMsg
   mov edx, disNewMsg_len
   int 80h

   ;copy the new username to the username buffer
   mov esi, change_username        ;source address
   mov edi, username               ;destination address
   mov ecx, [change_username_len]  ;number of bytes to copy
   cld                             ;clear direction flag for forward copying
   rep movsb                       ;repeat move byte

   ;output the entered new username
   mov eax, 4
   mov ebx, 1
   mov ecx, username
   mov edx, [change_username_len]
   int 80h

   ;exit
   mov eax, 1
   mov ebx, 0
   int 80h

section .data
    msg db 'Enter your name: ', 0
    msg_len equ $ - msg
    disMsg db 'Your name is: ', 0
    disMsg_len equ $ - disMsg
    change_msg db 'Change your name to: ', 0
    change_msg_len equ $ - change_msg
    disNewMsg db 'Your name changed from to: ', 0
    disNewMsg_len equ $ - disNewMsg

section .bss
    username resb 100
    change_username resb 100
    username_len resb 4
    change_username_len resb 4