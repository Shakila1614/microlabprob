; Largest of 3 single-digit numbers
.model small
.stack 100h
.data
    msg1 db "First: $"
    msg2 db 0Dh,0Ah,"Second: $"
    msg3 db 0Dh,0Ah,"Third: $"
    result db 0Dh,0Ah,"Largest: $"

.code
main proc
    mov ax,@data
    mov ds,ax

    ; ---------- First Number ----------
    lea dx,msg1
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,'0'
    mov bl,al         ; bl = first number

    ; ---------- Second Number ----------
    lea dx,msg2
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,'0'
    mov bh,al         ; bh = second number

    ; compare bl and bh
    cmp bh,bl
    jle skip1
    mov bl,bh
skip1:

    ; ---------- Third Number ----------
    lea dx,msg3
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,'0'

    ; compare with current largest (bl)
    cmp al,bl
    jle skip2
    mov bl,al
skip2:

    ; ---------- Print Largest ----------
    lea dx,result
    mov ah,09h
    int 21h

    mov dl,bl
    add dl,'0'
    mov ah,02h
    int 21h

    mov ah,4Ch
    int 21h
main endp
end main
