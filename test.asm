;text section
section .text       ;segment de code
    global _start   ;a besoin d'etre declarer au linker

_start:                 ; dit au linker le point d'entree
    mov edx, len        ;taille du message
    mov ecx, msgToPrint ;message a afficher
    mov ebx, 1          ;file descriptor : 1 Standar output (stdout)
    mov eax, 4          ; system call (sys_write)
    int 0x80            ;fait une int(interruption) au 0x80 (noyeau)

    mov eax, 1          ; system call (sys_exit)
    int 0x80            ;fait une int(interruption) au 0x80 (noyeau) 
;data section
;use for constants
section .data
    msgToPrint db "Test validé !", 0xa ; 10 | 0xa = comme '\r\n'
    len equ $ -msgToPrint ; au lieu de compter le nombre de caracteres de "Test validé !"