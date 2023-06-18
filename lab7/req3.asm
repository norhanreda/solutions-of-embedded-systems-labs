_main:
;req3.c,5 :: 		void main(){
;req3.c,10 :: 		period = PWM_TIM4_Init(4000);
MOVW	R0, #4000
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_period+0)
MOVT	R1, #hi_addr(_period+0)
STRH	R0, [R1, #0]
;req3.c,12 :: 		while(1){
L_main0:
;req3.c,14 :: 		for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
STRH	R1, [R0, #0]
L_main2:
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_main3
;req3.c,16 :: 		PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req3.c,17 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PD12);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;req3.c,14 :: 		for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;req3.c,18 :: 		}
IT	AL
BAL	L_main2
L_main3:
;req3.c,20 :: 		for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
STRH	R1, [R0, #0]
L_main5:
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_main6
;req3.c,22 :: 		PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req3.c,23 :: 		PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVS	R0, #1
BL	_PWM_TIM4_Start+0
;req3.c,20 :: 		for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;req3.c,24 :: 		}
IT	AL
BAL	L_main5
L_main6:
;req3.c,26 :: 		for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
STRH	R1, [R0, #0]
L_main8:
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_main9
;req3.c,28 :: 		PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req3.c,29 :: 		PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PD14);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;req3.c,26 :: 		for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;req3.c,30 :: 		}
IT	AL
BAL	L_main8
L_main9:
;req3.c,33 :: 		for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
STRH	R1, [R0, #0]
L_main11:
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_main12
;req3.c,35 :: 		PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req3.c,36 :: 		PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PD15);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;req3.c,33 :: 		for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;req3.c,37 :: 		}
IT	AL
BAL	L_main11
L_main12:
;req3.c,39 :: 		Delay_us(50);
MOVW	R7, #265
MOVT	R7, #0
NOP
NOP
L_main14:
SUBS	R7, R7, #1
BNE	L_main14
NOP
NOP
;req3.c,41 :: 		for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
STRH	R1, [R0, #0]
L_main16:
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_main17
;req3.c,43 :: 		PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req3.c,44 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PD12);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;req3.c,41 :: 		for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;req3.c,45 :: 		}
IT	AL
BAL	L_main16
L_main17:
;req3.c,46 :: 		for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
STRH	R1, [R0, #0]
L_main19:
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_main20
;req3.c,48 :: 		PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req3.c,49 :: 		PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVS	R0, #1
BL	_PWM_TIM4_Start+0
;req3.c,46 :: 		for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;req3.c,50 :: 		}
IT	AL
BAL	L_main19
L_main20:
;req3.c,51 :: 		for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
STRH	R1, [R0, #0]
L_main22:
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_main23
;req3.c,53 :: 		PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req3.c,54 :: 		PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PD14);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;req3.c,51 :: 		for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;req3.c,55 :: 		}
IT	AL
BAL	L_main22
L_main23:
;req3.c,56 :: 		for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
STRH	R1, [R0, #0]
L_main25:
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_main26
;req3.c,58 :: 		PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req3.c,59 :: 		PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PD15);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;req3.c,56 :: 		for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;req3.c,60 :: 		}
IT	AL
BAL	L_main25
L_main26:
;req3.c,61 :: 		}
IT	AL
BAL	L_main0
;req3.c,62 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
