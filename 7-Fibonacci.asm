.model small
.stack 100h
.data
.code

main:
    mov ax, @data
    mov ds, ax

    ; Initialize Fibonacci numbers
    mov ax, 0      ; First number (F0)
    mov bx, 1      ; Second number (F1)
    mov cx, 7      ; Count = 7

next_fib:
    ; Print AX
    push ax
    call print_num
    call newline
    pop ax

    ; Calculate next Fibonacci number
    mov dx, ax     ; Save AX
    add dx, bx     ; DX = AX + BX
    mov ax, bx     ; AX = BX (shift left)
    mov bx, dx     ; BX = next number

    loop next_fib

    ; Exit program
    mov ah, 4ch
    int 21h

; ------------------------
; Print number in AX
; ------------------------
print_num:
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
convert:
    xor dx, dx
    mov bx, 10
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert

print_loop:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop print_loop

    pop dx
    pop cx
    pop bx
    pop ax
    ret

; ------------------------
; New line
; ------------------------
newline:
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    ret

end main