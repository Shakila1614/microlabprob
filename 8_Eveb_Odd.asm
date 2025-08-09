
                                                             .model small 
.stack 100h 
.data 
    num db  4         ; Change this number to test other values 
    msg_even db 'The number is EVEN.$' 
    msg_odd  db 'The number is ODD.$' 
.code 
main: 
    mov ax, @data 
    mov ds, ax 
    mov al, num        ; Load number into AL 
    and al, 01h        ; AND with 00000001 to check LSB 
    cmp al, 00h 
    je print_even      ; If result is 0, number is even 
print_odd: 
    lea dx, msg_odd 
    mov ah, 09h 
    int 21h 
    jmp exit 
print_even: 
    lea dx, msg_even 
    mov ah, 09h 
    int 21h 
exit: 
    mov ah, 4ch 
    int 21h 
end main