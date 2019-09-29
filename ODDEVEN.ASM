assume cs:code,ds:data
data segment 
	count db 00h
	numbers db 10 dup(0)
	oddcount db 00h
	evencount db 00h
data ends
code segment
        org 1000h
start:  mov ax,data
        mov ds,ax
	
	mov si,offset numbers
	mov cl,count
	mov ax,0000h
	mov bl,00h
	mov bh,02h
	mov dl,00h
	inc cl
scanlist:mov al,[si]
	inc si
	dec cl
	jz store
	div bh
	or ah,00h
	jnz odd
	inc bl
	jmp scanlist
odd:	inc dl
	jmp scanlist
store:	mov si,offset evencount
	mov [si],bl
	mov si,offset oddcount
	mov [si],dl
        
       	mov ah,4ch
        int 21h
	code ends
end start
