.model small
.stack 100h
.data

.code
main proc
    
    

    mov cx, 80        
    mov ah, 2         
    mov dl, '*'       

    jcxz skip        

top:
    int 21h          
    loop top          

skip:
    mov ah, 4ch       
    int 21h

main endp
end main
