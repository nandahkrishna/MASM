assume cs:code,ds:data
data segment 
	count db 00h
	numbers db 10 dup(?)
	carry db 00h
	result db 00h
data ends
code segment
        org 1000h
start:  mov ax,data
        mov ds,ax
	
	mov cl,00h
	mov ax,0000h
	mov dl,count	
	mov si,offset numbers	
nozero:add al,[si]
	jnc nocarry
	inc cl
nocarry:inc si
	dec dl
	jnz nozero	
	mov si,offset result
	mov [si],al
	mov si,offset carry
	mov [si],cl

        
       	mov ah,4ch
        int 21h
	code ends
end start
