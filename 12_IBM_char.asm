.model small
.stack 100h

.data
    msg db "IBM character extended:$"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print message
    lea dx, msg
    mov ah, 09h
    int 21h

    ; Print characters from ASCII 32 to 255
    mov cx, 255     ; Total characters (255 - 31)
    mov bl, 1       ; Start from ASCII 32 (space)

print_loop:
    mov ah, 02h
    mov dl, bl
    int 21h

    inc bl
    loop print_loop

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main

