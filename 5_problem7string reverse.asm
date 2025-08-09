            .model small
.stack 100h
.data
    string db 'abcde'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov si,offset string
    
    mov cx,5
    
    lpx:                     
    
        mov bx, [si]  ; kisi bi  register  pe  pehela  data pick korte hoi array se
        push bx
        inc si
        loop lpx
    mov cx,5
    lpx1:
        pop dx
        
        mov ah,02h
        int 21h
        loop lpx1
    
    
    main endp
end main