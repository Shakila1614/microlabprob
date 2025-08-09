.model small
.stack 100h
.data
.code
main proc
    mov ah,1
    int 21h
    
    mov bl,al
    int 21h
    
    mov bh,al
    int 21h
    
    mov cl,al
    
    cmp bl,bh
    JG  l1
    
    cmp bh,cl
    JG l3
    
    mov ah,2
    mov dl,cl
    int 21h 
    
    JMP EXIT
    
    
    l1: 
    
    
    cmp bl,cl
    JG l2
    mov ah,2
    mov dl,0dh
    int 21h
    mov ah,2
    mov dl,0ah
    int 21h
    
    mov ah,2
    mov dl,cl
    int 21h
    
    JMP EXIT
    
    
    
    l2:
    mov ah,2
    mov dl,0dh
    int 21h
    mov ah,2
    mov dl,0ah
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
       
    JMP EXIT
    
    
    l3:
    mov ah,2
    mov dl,0dh
    int 21h
    mov ah,2
    mov dl,0ah
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    
    
    EXIT:
    
    mov ah,4ch
    int 21h
    
    main endp
end main
