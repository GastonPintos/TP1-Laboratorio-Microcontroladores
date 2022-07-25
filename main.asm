.device ATmega328P
.cseg
.org 0x0000

main :
      LDI R16 ,HIGH(RAMEND)
      OUT SPH, R16
      LDI R16 , LOW(RAMEND)
      OUT SPL, R16
      LDI R17 , 0 X00
      OUT PORTB, R17 ; Limpio e l puerto B
      LDI R16 , 0XFF
      OUT DDRB, R16 ;SETEO PUERTO B COMO SSALIDA
      LDI R17 , 0 b000001 ; Enciendo el primer led
      OUT PORTB, R17
      CALL DELAY

SHIFT :
      CALL LEFT SHIFT ; Desplazo el bit hacia izquierda
      CALL RIGHT SHIFT ; De splazo el bit hacia derecha
      RJMP SHIFT ; Reinicio el proceso
      LEFT SHIFT :
      LDI R18 , 5 ; Cantidad de desplazamientos
      LOOP1:
      LSL R17 ; Movimiento hacia la izquierda
      OUT PORTB, R17
      CALL DELAY
      DEC R18
      BRNE LOOP1
      RET
      RIGHT SHIFT :
      LDI R18 , 5 ; Cantidad de d e s pl a z ami e n t o s
      LOOP2:
      LSR R17 ; Movimiento h a ci a l a de rech a
      OUT PORTB, R17
      CALL DELAY
      DEC R18
      BRNE LOOP2
      RET

DELAY:
LDI R21 , 200
D1 : LDI R22 , 200
D2 : LDI R23 , 50
D3 : NOP
     NOP
     DEC R23
     BRNE D3
     DEC R22
     BRNE D2
     DEC R21
     BRNE D1
     RET
