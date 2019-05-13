.MODEL SMALL
.STACK 100
.DATA
MSJ1 DB 'NUMERO 1: ','$'
MSJ2 DB 13,10,'NUMERO 2: ','$'
MSJ3 DB 13,10,'SUMA: ','$'     
MSJ4 DB 13,10,'RESTA: ','$'     
MSJ5 DB 13,10,'MULTIPLICACION: ','$' 
MSJ6 DB 13,10,'DIVISION: ','$'
LINEA DB 13,10,'$'
VAR1 DB 0
VAR2 DB 0

.CODE

.STARTUP

CALL LIMPIA
MOV AH,09H
LEA DX, MSJ1
INT 21H

CALL LEER
SUB AL,30H
MOV VAR1,AL
MOV AH,09H
LEA DX,MSJ2
INT 21H

CALL LEER
SUB AL,30H
MOV VAR2,AL
MOV BL,VAR2

;SUMA

ADD BL,VAR1
MOV AH,09H
LEA DX, MSJ3
INT 21H
MOV DL,BL
ADD DL,30H
MOV AH,02H
INT 21H

;RESTA
MOV BL,VAR1
SUB BL,VAR2
MOV AH,09H
LEA DX,MSJ4
INT 21H
MOV DL,BL
ADD DL,30H
MOV AH,02H
INT 21H

;MULTIPLICACION
MOV AH,09H
LEA DX, MSJ5
INT 21H

MOV AL,VAR1
MOV BL,VAR2
MUL BL
MOV DL,AL
ADD DL,30H
MOV AH,02H
INT 21H

;DIVISION
MOV AH,09H
LEA DX, MSJ6
INT 21H
XOR AX,AX
MOV AL,VAR2
MOV BL,AL
MOV AL,VAR1
DIV BL
MOV BL,AL
MOV DL,BL
ADD DL,30H
MOV AH,02H
INT 21H
.EXIT


;PROCED


SALTO PROC NEAR
    
MOV AH,09H
LEA DX,LINEA
INT 21H
MOV DL,00H
RET
SALTO ENDP

LEER PROC NEAR
MOV AH,01H
INT 21H
RET 
LEER ENDP   

LIMPIA PROC NEAR
MOV AH,00H
MOV AL,03H
INT 10H
RET
LIMPIA ENDP
END