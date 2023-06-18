_main:
;lab8_main.c,18 :: 		void main() {
SUB	SP, SP, #8
;lab8_main.c,19 :: 		int cur=0;
;lab8_main.c,20 :: 		int prev=0;
MOVW	R0, #0
STRH	R0, [SP, #0]
MOVW	R0, #1
STRH	R0, [SP, #2]
;lab8_main.c,21 :: 		int current_screen=1;
;lab8_main.c,23 :: 		Start_TP();
BL	_Start_TP+0
;lab8_main.c,25 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;lab8_main.c,26 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;lab8_main.c,28 :: 		while (1) {
L_main0:
;lab8_main.c,29 :: 		Check_TP();
BL	_Check_TP+0
;lab8_main.c,31 :: 		cur=Button(&GPIOC_IDR, 0, 1, 1);
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
BL	_Button+0
STRH	R0, [SP, #4]
;lab8_main.c,32 :: 		if(cur && cur!=prev)
SXTH	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L__main9
LDRSH	R1, [SP, #0]
LDRSH	R0, [SP, #4]
CMP	R0, R1
IT	EQ
BEQ	L__main8
L__main7:
;lab8_main.c,34 :: 		if (current_screen==1)
LDRSH	R0, [SP, #2]
CMP	R0, #1
IT	NE
BNE	L_main5
;lab8_main.c,36 :: 		DrawScreen(&Screen2);
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;lab8_main.c,37 :: 		current_screen = 2 ;
MOVS	R0, #2
SXTH	R0, R0
STRH	R0, [SP, #2]
;lab8_main.c,38 :: 		}
IT	AL
BAL	L_main6
L_main5:
;lab8_main.c,41 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;lab8_main.c,42 :: 		current_screen = 1 ;
MOVS	R0, #1
SXTH	R0, R0
STRH	R0, [SP, #2]
;lab8_main.c,43 :: 		}
L_main6:
;lab8_main.c,32 :: 		if(cur && cur!=prev)
L__main9:
L__main8:
;lab8_main.c,45 :: 		prev=cur;
LDRSH	R0, [SP, #4]
STRH	R0, [SP, #0]
;lab8_main.c,46 :: 		}
IT	AL
BAL	L_main0
;lab8_main.c,47 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
