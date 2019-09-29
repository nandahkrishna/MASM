assume cs:code,ds:data
data segment 
	count db 00h
	numbers db 10 dup(0)
	result db 00h
data ends
code segment
        org 1000h
start:  mov ax,data
        mov ds,ax
	
	mov si,offset numbers
	mov cl,count
	
carry: mov al,[si]
other: inc si
	dec cl
	jz finish
nonzero:cmp al,[si]
	jc carry
	jmp other
finish: mov si,offset result
	mov [si],al
        
       	mov ah,4ch
        int 21h
	code ends
end start
