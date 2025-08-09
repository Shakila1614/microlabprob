.model small
.stack 100h
.data
    num1 dw ?
    num2 dw ?
    msg1 db 'First: $'
    msg2 db 'Second: $' 
    msg3 db 'Product: $'
    msg4 db 'Quotient: $'
    msg5 db 'Division by zero not allowed!$'
.code
main:
    mov ax, @data
    mov ds, ax
    
    ; Get first number
    mov dx, offset msg1
    mov ah, 09h
    int 21h
    call getNum
    mov num1, ax
    call newLine
    
    ; Get second number  
    mov dx, offset msg2
    mov ah, 09h
    int 21h
    call getNum
    mov num2, ax
    call newLine
    
    ; Show product
    mov dx, offset msg3
    mov ah, 09h
    int 21h
    mov ax, num1
    mov bx, num2
    mul bx           ; AX = num1 * num2
    call showNum
    call newLine
    
    ; Show quotient
    mov dx, offset msg4
    mov ah, 09h
    int 21h
    mov ax, num1
    mov bx, num2
    cmp bx, 0
    je divZero
    xor dx, dx
    div bx           ; AX = quotient, DX = remainder
    call showNum
    jmp endProg
divZero:
    mov dx, offset msg5
    mov ah, 09h
    int 21h

endProg:
    mov ah, 4Ch
    int 21h

; ======== Procedures =========

getNum proc
    xor ax, ax
    xor bx, bx
getLoop:
    mov ah, 01h
    int 21h
    cmp al, 13
    je getDone
    sub al, '0'
    mov cl, al
    mov ax, bx
    mov bx, 10
    mul bx
    add al, cl
    mov bx, ax
    jmp getLoop
getDone:
    mov ax, bx
    ret
getNum endp

showNum proc
    cmp ax, 0
    jne notZero
    mov dl, '0'
    mov ah, 02h
    int 21h
    ret
notZero:
    mov bx, 10
    xor cx, cx
showDiv:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz showDiv
showPrint:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop showPrint
    ret
showNum endp

newLine proc
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    ret
newLine endp

end main
