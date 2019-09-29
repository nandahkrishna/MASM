ASSUME	CS:CODESEG, DS:DATASEG
; --------------------------------------------------------------
DATASEG	SEGMENT			; start of data segment
	ORG 	00H		; directive to assign an offset address for a variable
X	DD	20.4375
	ORG 	10H
Y	DD	0.125
	ORG	20H
SUM	DD	?
DATASEG	ENDS			; end of data segment

; --------------------------------------------------------------

CODESEG	SEGMENT			; start of code segment

start:  MOV	AX,DATASEG 	; load the data segment address
	MOV	DS,AX		; assign value to DS
	
	FINIT			; initialize 8087 stack
	FLD	Y		; load X into ST(0)
	FLD	X		; load Y into ST(0)
	
	FSUB	ST(0),ST(1)	; ST(0) = X+Y
	
	FST	SUM		; store ST(0) in sum
	
	MOV	AH,4CH		; setup function-4C of the int21
	INT	21H		; call BIOS int21 to return to DOS
		
	

CODESEG	ENDS			; end of code segment
	END START	
