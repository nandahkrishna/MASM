ASSUME CS:CODE,DS:DATA
DATA SEGMENT 
	COUNT DB 00H
	NUMBERS DB 10 DUP(0)
	ODDCOUNT DB 00H
	EVENCOUNT DB 00H
DATA ENDS
CODE SEGMENT
        ORG 1000H
START:  MOV AX,DATA
        MOV DS,AX
	MOV SI,OFFSET NUMBERS
	MOV CL,COUNT
	MOV AX,0000H
	MOV BL,00H
	MOV BH,02H
	MOV DL,00H
	INC CL
SCANLIST:MOV AL,[SI]
	INC SI
	DEC CL
	JZ STORE
	DIV BH
	OR AH,00H
	JNZ ODD
	INC BL
	JMP SCANLIST
ODD:	INC DL
	JMP SCANLIST
STORE:	MOV SI,OFFSET EVENCOUNT
	MOV [SI],BL
	MOV SI,OFFSET ODDCOUNT
	MOV [SI],DL
       	MOV AH,4CH
        INT 21H
CODE ENDS
END START
