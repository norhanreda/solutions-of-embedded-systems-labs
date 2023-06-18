_norhan:
;lab8_events_code.c,9 :: 		void norhan() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lab8_events_code.c,11 :: 		GPIOD_ODR ^= 0xFFFF;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R1, [R0, #0]
MOVW	R0, #65535
EORS	R1, R0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;lab8_events_code.c,12 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;lab8_events_code.c,13 :: 		}
L_end_norhan:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _norhan
_turnOff:
;lab8_events_code.c,14 :: 		void turnOff() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lab8_events_code.c,15 :: 		GPIOD_ODR = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;lab8_events_code.c,16 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;lab8_events_code.c,17 :: 		}
L_end_turnOff:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _turnOff
_turn_on:
;lab8_events_code.c,18 :: 		void turn_on() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lab8_events_code.c,20 :: 		GPIOD_ODR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;lab8_events_code.c,21 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;lab8_events_code.c,22 :: 		}
L_end_turn_on:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _turn_on
