_main:
;req3.c,4 :: 		void main() {
;req3.c,6 :: 		GPIO_Digital_Output(&GPIOD_BASE,  _GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;req3.c,7 :: 		GPIO_Digital_Output(&GPIOE_BASE,  _GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;req3.c,8 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
MOVW	R1, #3
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;req3.c,9 :: 		GPIOD_ODR = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;req3.c,10 :: 		GPIOE_ODR = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;req3.c,11 :: 		toggle1 = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_toggle1+0)
MOVT	R0, #hi_addr(_toggle1+0)
STRH	R1, [R0, #0]
;req3.c,12 :: 		toggle2 = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_toggle2+0)
MOVT	R0, #hi_addr(_toggle2+0)
STRH	R1, [R0, #0]
;req3.c,13 :: 		while(1){
L_main0:
;req3.c,14 :: 		if(Button(&GPIOB_IDR, 0, 30, 1) && GPIOD_ODR != 15)
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L__main15
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #15
IT	EQ
BEQ	L__main14
L__main13:
;req3.c,16 :: 		if(toggle1)
MOVW	R0, #lo_addr(_toggle1+0)
MOVT	R0, #hi_addr(_toggle1+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
;req3.c,18 :: 		GPIOD_ODR += 1;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;req3.c,19 :: 		toggle1 = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_toggle1+0)
MOVT	R0, #hi_addr(_toggle1+0)
STRH	R1, [R0, #0]
;req3.c,20 :: 		}
L_main5:
;req3.c,21 :: 		}
IT	AL
BAL	L_main6
;req3.c,14 :: 		if(Button(&GPIOB_IDR, 0, 30, 1) && GPIOD_ODR != 15)
L__main15:
L__main14:
;req3.c,24 :: 		toggle1 = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_toggle1+0)
MOVT	R0, #hi_addr(_toggle1+0)
STRH	R1, [R0, #0]
;req3.c,25 :: 		}
L_main6:
;req3.c,26 :: 		if(Button(&GPIOB_IDR, 1, 30, 1) && GPIOD_ODR != 0){
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L__main17
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main16
L__main12:
;req3.c,27 :: 		if(toggle2)
MOVW	R0, #lo_addr(_toggle2+0)
MOVT	R0, #hi_addr(_toggle2+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main10
;req3.c,29 :: 		GPIOD_ODR -= 1;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;req3.c,30 :: 		toggle2 = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_toggle2+0)
MOVT	R0, #hi_addr(_toggle2+0)
STRH	R1, [R0, #0]
;req3.c,31 :: 		}
L_main10:
;req3.c,32 :: 		}
IT	AL
BAL	L_main11
;req3.c,26 :: 		if(Button(&GPIOB_IDR, 1, 30, 1) && GPIOD_ODR != 0){
L__main17:
L__main16:
;req3.c,35 :: 		toggle2 = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_toggle2+0)
MOVT	R0, #hi_addr(_toggle2+0)
STRH	R1, [R0, #0]
;req3.c,36 :: 		}
L_main11:
;req3.c,37 :: 		}
IT	AL
BAL	L_main0
;req3.c,39 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
