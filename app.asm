; app.asm
section .data
    msg db 'Hello Hamida', 0   ; Mesaj ve null terminatör

section .text
    global _start

_start:
    ; Windows API ile ekrana yazdırmaq
    mov eax, 4            ; sys_write sistemi çağırmaq (Windows)
    mov ebx, 1            ; stdout (ekran)
    mov ecx, msg          ; Mesajın adresi
    mov edx, 13           ; Mesaj uzunluğu
    int 0x80              ; Sistem çağır

    ; Programı sonlandır
    mov eax, 1            ; sys_exit sistem çağırısı
    xor ebx, ebx          ; Çıxış kodu 0
    int 0x80              ; Sistem çağır
