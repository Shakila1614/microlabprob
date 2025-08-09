.model small
.stack 100h

.data
a           dw  ?
b           dw  ?
ans         dw  ?
msgbuffer   db  255
            db  ?
            db  255 dup(?)
prompt1     db  'enter a :', '$'
prompt2     db  'enter b :', '$'
newline     db  0ah, 0dh, '$'
outstr      db  'a - b = '
output      db  10  dup('$')

.code
proc main
; initialize the data
    mov ax, @data
    mov ds, ax
; prompt for input a
    lea dx, prompt1
    mov ah, 09h
    int 21h

; take input of number string
    call take_input

; convert it to integer and store in a
    call str_to_int
    mov a, ax
    
; prompt for input b
    lea dx, prompt2
    mov ah, 09h
    int 21h

; take input of number string 
    call take_input
    
; convert it to integer and store in b
    call str_to_int
    mov b, ax


; ans = a - b
    mov ax, a
    mov bx, b
    sub ax, bx
    mov ans, ax

; convert ans to string
    call int_to_str

; print string of sum
    lea dx, outstr
    mov ah, 09h
    int 21h

; end the program    
    mov ax, 4ch
    int 21h
endp main

take_input:
    lea dx, msgbuffer
    mov ah, 0ah
    int 21h
    lea dx, newline
    mov ah, 09h
    int 21h
    ret

str_to_int:
    mov si, offset msgbuffer + 2
    xor ax, ax
    xor cx, cx
    mov cx, 10
    xor bx, bx
    xor dx, dx
next:
    mov bl, [si]
    cmp bl, 0dh
    je done
    mul cx
    sub bl, '0'
    add ax, bx
    inc si
    jmp next
done:
    ret

int_to_str:
    lea si, output
    
    mov ax, a
    mov bx, b
    cmp ax, bx
    jae no_negative ; if a >= b   
; add negative and negate the number
    xor ax, ax
    mov al, '-'
    mov [si], al
    inc si
    mov ax, ans
    neg ax
    mov ans, ax
no_negative:
    mov ax, ans
    xor cx, cx
    mov bx, 10
    xor dx, dx    
    cmp ax, 0
    jne div_loop
    mov [si], '0'
    ret

div_loop:
    div bx
    add dx, '0'
    push dx
    inc cx
    xor dx, dx
    cmp ax, 0
    jnz div_loop

reversing:
    pop dx
    mov [si], dl
    inc si
    loop reversing
       
    ret
end main