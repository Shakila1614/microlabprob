.MODEL SMALL 
.STACK 100H
.DATA 
PRO DB "ENTER THE LETTER: $"
MSG DB 0DH,0AH,"converted letter: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,PRO
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H
    MOV BL,AL
    
    CMP BL,'A'
    JB NOT_ALPHA
    CMP BL, 'Z'
    JBE TO_LOWER 
    
    
    CMP BL,'a'
    JB NOT_ALPHA
    CMP BL, 'z'
    JBE TO_UPPER 
    
    
    NOT_ALPHA:
    JMP SHOW_RESULT    
    
    
    TO_LOWER:
    ADD BL,32
    JMP SHOW_RESULT 
    
    TO_UPPER:
    SUB BL,32     
    
    
    SHOW_RESULT:
    
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    
    
    
    
    
    
    
    
    

 
    
    
    
    