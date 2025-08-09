.model small
.stack 100h
.data
    msg db 'Enter 3 characters: $'
    resultMsg db 13, 10, 'First character in sequence: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt
    lea dx, msg
    mov ah, 09h
    int 21h

    ; Read 1st character
    mov ah, 01h
    int 21h
    mov bl, al    ; store in BL (assume smallest initially)

    ; Read 2nd character
    mov ah, 01h
    int 21h
    cmp al, bl
    jb store_second
    jmp skip_second
store_second:
    mov bl, al
skip_second:

    ; Read 3rd character
    mov ah, 01h
    int 21h
    cmp al, bl
    jb store_third
    jmp skip_third
store_third:
    mov bl, al
skip_third:

    ; Print result message
    lea dx, resultMsg
    mov ah, 09h
    int 21h

    ; Print the smallest character
    mov ah, 02h
    mov dl, bl
    int 21h

    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main