_Init_ADC:
;lab8_driver.c,48 :: 		void Init_ADC() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lab8_driver.c,49 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;lab8_driver.c,50 :: 		ADC1_Init();
BL	_ADC1_Init+0
;lab8_driver.c,51 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_Init_ADC0:
SUBS	R7, R7, #1
BNE	L_Init_ADC0
NOP
NOP
NOP
NOP
;lab8_driver.c,52 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
lab8_driver_InitializeTouchPanel:
;lab8_driver.c,53 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lab8_driver.c,54 :: 		Init_ADC();
BL	_Init_ADC+0
;lab8_driver.c,55 :: 		TFT_Init_ILI9341_8bit(320, 240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;lab8_driver.c,57 :: 		TP_TFT_Init(320, 240, 8, 9);                                  // Initialize touch panel
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;lab8_driver.c,58 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;lab8_driver.c,60 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;lab8_driver.c,61 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;lab8_driver.c,62 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;lab8_driver.c,63 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of lab8_driver_InitializeTouchPanel
_Calibrate:
;lab8_driver.c,65 :: 		void Calibrate() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lab8_driver.c,66 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;lab8_driver.c,67 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;lab8_driver.c,68 :: 		TFT_Write_Text("Touch selected corners for calibration", 50, 80);
MOVW	R0, #lo_addr(?lstr1_lab8_driver+0)
MOVT	R0, #hi_addr(?lstr1_lab8_driver+0)
MOVS	R2, #80
MOVS	R1, #50
BL	_TFT_Write_Text+0
;lab8_driver.c,69 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;lab8_driver.c,70 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;lab8_driver.c,71 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;lab8_driver.c,72 :: 		TFT_Write_Text("first here", 210, 220);
MOVW	R0, #lo_addr(?lstr2_lab8_driver+0)
MOVT	R0, #hi_addr(?lstr2_lab8_driver+0)
MOVS	R2, #220
MOVS	R1, #210
BL	_TFT_Write_Text+0
;lab8_driver.c,74 :: 		TP_TFT_Calibrate_Min();                      // Calibration of TP minimum
BL	_TP_TFT_Calibrate_Min+0
;lab8_driver.c,75 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate2:
SUBS	R7, R7, #1
BNE	L_Calibrate2
NOP
NOP
;lab8_driver.c,77 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;lab8_driver.c,78 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;lab8_driver.c,79 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;lab8_driver.c,80 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;lab8_driver.c,81 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;lab8_driver.c,82 :: 		TFT_Write_Text("first here", 210, 220);
MOVW	R0, #lo_addr(?lstr3_lab8_driver+0)
MOVT	R0, #hi_addr(?lstr3_lab8_driver+0)
MOVS	R2, #220
MOVS	R1, #210
BL	_TFT_Write_Text+0
;lab8_driver.c,84 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;lab8_driver.c,85 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;lab8_driver.c,86 :: 		TFT_Write_Text("now here ", 20, 5);
MOVW	R0, #lo_addr(?lstr4_lab8_driver+0)
MOVT	R0, #hi_addr(?lstr4_lab8_driver+0)
MOVS	R2, #5
MOVS	R1, #20
BL	_TFT_Write_Text+0
;lab8_driver.c,87 :: 		TFT_Line(0, 0, 5, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;lab8_driver.c,88 :: 		TFT_Line(0, 0, 0, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;lab8_driver.c,89 :: 		TFT_Line(0, 0, 10, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;lab8_driver.c,91 :: 		TP_TFT_Calibrate_Max();                       // Calibration of TP maximum
BL	_TP_TFT_Calibrate_Max+0
;lab8_driver.c,92 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate4:
SUBS	R7, R7, #1
BNE	L_Calibrate4
NOP
NOP
;lab8_driver.c,93 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
lab8_driver_InitializeObjects:
;lab8_driver.c,141 :: 		static void InitializeObjects() {
;lab8_driver.c,142 :: 		Screen1.Color                     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;lab8_driver.c,143 :: 		Screen1.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;lab8_driver.c,144 :: 		Screen1.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;lab8_driver.c,145 :: 		Screen1.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;lab8_driver.c,146 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+12)
MOVT	R0, #hi_addr(_Screen1+12)
STR	R1, [R0, #0]
;lab8_driver.c,147 :: 		Screen1.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;lab8_driver.c,148 :: 		Screen1.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STRH	R1, [R0, #0]
;lab8_driver.c,149 :: 		Screen1.Boxes_RoundCount          = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STRH	R1, [R0, #0]
;lab8_driver.c,150 :: 		Screen1.Boxes_Round               = Screen1_Boxes_Round;
MOVW	R1, #lo_addr(_Screen1_Boxes_Round+0)
MOVT	R1, #hi_addr(_Screen1_Boxes_Round+0)
MOVW	R0, #lo_addr(_Screen1+36)
MOVT	R0, #hi_addr(_Screen1+36)
STR	R1, [R0, #0]
;lab8_driver.c,151 :: 		Screen1.ObjectsCount              = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;lab8_driver.c,153 :: 		Screen2.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;lab8_driver.c,154 :: 		Screen2.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;lab8_driver.c,155 :: 		Screen2.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;lab8_driver.c,156 :: 		Screen2.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;lab8_driver.c,157 :: 		Screen2.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+16)
MOVT	R0, #hi_addr(_Screen2+16)
STRH	R1, [R0, #0]
;lab8_driver.c,158 :: 		Screen2.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Screen2+20)
MOVT	R0, #hi_addr(_Screen2+20)
STR	R1, [R0, #0]
;lab8_driver.c,159 :: 		Screen2.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen2+24)
MOVT	R0, #hi_addr(_Screen2+24)
STRH	R1, [R0, #0]
;lab8_driver.c,160 :: 		Screen2.Boxes                     = Screen2_Boxes;
MOVW	R1, #lo_addr(_Screen2_Boxes+0)
MOVT	R1, #hi_addr(_Screen2_Boxes+0)
MOVW	R0, #lo_addr(_Screen2+28)
MOVT	R0, #hi_addr(_Screen2+28)
STR	R1, [R0, #0]
;lab8_driver.c,161 :: 		Screen2.Boxes_RoundCount          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+32)
MOVT	R0, #hi_addr(_Screen2+32)
STRH	R1, [R0, #0]
;lab8_driver.c,162 :: 		Screen2.ObjectsCount              = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRH	R1, [R0, #0]
;lab8_driver.c,165 :: 		BoxRound1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_BoxRound1+0)
MOVT	R0, #hi_addr(_BoxRound1+0)
STR	R1, [R0, #0]
;lab8_driver.c,166 :: 		BoxRound1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+4)
MOVT	R0, #hi_addr(_BoxRound1+4)
STRB	R1, [R0, #0]
;lab8_driver.c,167 :: 		BoxRound1.Left            = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_BoxRound1+6)
MOVT	R0, #hi_addr(_BoxRound1+6)
STRH	R1, [R0, #0]
;lab8_driver.c,168 :: 		BoxRound1.Top             = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_BoxRound1+8)
MOVT	R0, #hi_addr(_BoxRound1+8)
STRH	R1, [R0, #0]
;lab8_driver.c,169 :: 		BoxRound1.Width           = 170;
MOVS	R1, #170
MOVW	R0, #lo_addr(_BoxRound1+10)
MOVT	R0, #hi_addr(_BoxRound1+10)
STRH	R1, [R0, #0]
;lab8_driver.c,170 :: 		BoxRound1.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_BoxRound1+12)
MOVT	R0, #hi_addr(_BoxRound1+12)
STRH	R1, [R0, #0]
;lab8_driver.c,171 :: 		BoxRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+14)
MOVT	R0, #hi_addr(_BoxRound1+14)
STRB	R1, [R0, #0]
;lab8_driver.c,172 :: 		BoxRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+16)
MOVT	R0, #hi_addr(_BoxRound1+16)
STRH	R1, [R0, #0]
;lab8_driver.c,173 :: 		BoxRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+18)
MOVT	R0, #hi_addr(_BoxRound1+18)
STRB	R1, [R0, #0]
;lab8_driver.c,174 :: 		BoxRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+19)
MOVT	R0, #hi_addr(_BoxRound1+19)
STRB	R1, [R0, #0]
;lab8_driver.c,175 :: 		BoxRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+20)
MOVT	R0, #hi_addr(_BoxRound1+20)
STRB	R1, [R0, #0]
;lab8_driver.c,176 :: 		BoxRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+21)
MOVT	R0, #hi_addr(_BoxRound1+21)
STRB	R1, [R0, #0]
;lab8_driver.c,177 :: 		BoxRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+22)
MOVT	R0, #hi_addr(_BoxRound1+22)
STRB	R1, [R0, #0]
;lab8_driver.c,178 :: 		BoxRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_BoxRound1+24)
MOVT	R0, #hi_addr(_BoxRound1+24)
STRH	R1, [R0, #0]
;lab8_driver.c,179 :: 		BoxRound1.Gradient_End_Color = 0xFFEC;
MOVW	R1, #65516
MOVW	R0, #lo_addr(_BoxRound1+26)
MOVT	R0, #hi_addr(_BoxRound1+26)
STRH	R1, [R0, #0]
;lab8_driver.c,180 :: 		BoxRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_BoxRound1+28)
MOVT	R0, #hi_addr(_BoxRound1+28)
STRH	R1, [R0, #0]
;lab8_driver.c,181 :: 		BoxRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+31)
MOVT	R0, #hi_addr(_BoxRound1+31)
STRB	R1, [R0, #0]
;lab8_driver.c,182 :: 		BoxRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_BoxRound1+32)
MOVT	R0, #hi_addr(_BoxRound1+32)
STRH	R1, [R0, #0]
;lab8_driver.c,183 :: 		BoxRound1.Corner_Radius   = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_BoxRound1+30)
MOVT	R0, #hi_addr(_BoxRound1+30)
STRB	R1, [R0, #0]
;lab8_driver.c,184 :: 		BoxRound1.OnClickPtr      = turn_on;
MOVW	R1, #lo_addr(_turn_on+0)
MOVT	R1, #hi_addr(_turn_on+0)
MOVW	R0, #lo_addr(_BoxRound1+44)
MOVT	R0, #hi_addr(_BoxRound1+44)
STR	R1, [R0, #0]
;lab8_driver.c,186 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;lab8_driver.c,187 :: 		Label1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;lab8_driver.c,188 :: 		Label1.Left            = 121;
MOVS	R1, #121
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;lab8_driver.c,189 :: 		Label1.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;lab8_driver.c,190 :: 		Label1.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;lab8_driver.c,191 :: 		Label1.Height          = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;lab8_driver.c,192 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;lab8_driver.c,193 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STRB	R1, [R0, #0]
;lab8_driver.c,194 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;lab8_driver.c,195 :: 		Label1.FontName        = Tahoma26x33_Regular;
MOVW	R2, #lo_addr(_Tahoma26x33_Regular+0)
MOVT	R2, #hi_addr(_Tahoma26x33_Regular+0)
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R2, [R0, #0]
;lab8_driver.c,196 :: 		Label1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;lab8_driver.c,197 :: 		Label1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;lab8_driver.c,199 :: 		BoxRound2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_BoxRound2+0)
MOVT	R0, #hi_addr(_BoxRound2+0)
STR	R1, [R0, #0]
;lab8_driver.c,200 :: 		BoxRound2.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_BoxRound2+4)
MOVT	R0, #hi_addr(_BoxRound2+4)
STRB	R1, [R0, #0]
;lab8_driver.c,201 :: 		BoxRound2.Left            = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_BoxRound2+6)
MOVT	R0, #hi_addr(_BoxRound2+6)
STRH	R1, [R0, #0]
;lab8_driver.c,202 :: 		BoxRound2.Top             = 91;
MOVS	R1, #91
MOVW	R0, #lo_addr(_BoxRound2+8)
MOVT	R0, #hi_addr(_BoxRound2+8)
STRH	R1, [R0, #0]
;lab8_driver.c,203 :: 		BoxRound2.Width           = 170;
MOVS	R1, #170
MOVW	R0, #lo_addr(_BoxRound2+10)
MOVT	R0, #hi_addr(_BoxRound2+10)
STRH	R1, [R0, #0]
;lab8_driver.c,204 :: 		BoxRound2.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_BoxRound2+12)
MOVT	R0, #hi_addr(_BoxRound2+12)
STRH	R1, [R0, #0]
;lab8_driver.c,205 :: 		BoxRound2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+14)
MOVT	R0, #hi_addr(_BoxRound2+14)
STRB	R1, [R0, #0]
;lab8_driver.c,206 :: 		BoxRound2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+16)
MOVT	R0, #hi_addr(_BoxRound2+16)
STRH	R1, [R0, #0]
;lab8_driver.c,207 :: 		BoxRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+18)
MOVT	R0, #hi_addr(_BoxRound2+18)
STRB	R1, [R0, #0]
;lab8_driver.c,208 :: 		BoxRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+19)
MOVT	R0, #hi_addr(_BoxRound2+19)
STRB	R1, [R0, #0]
;lab8_driver.c,209 :: 		BoxRound2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+20)
MOVT	R0, #hi_addr(_BoxRound2+20)
STRB	R1, [R0, #0]
;lab8_driver.c,210 :: 		BoxRound2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+21)
MOVT	R0, #hi_addr(_BoxRound2+21)
STRB	R1, [R0, #0]
;lab8_driver.c,211 :: 		BoxRound2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+22)
MOVT	R0, #hi_addr(_BoxRound2+22)
STRB	R1, [R0, #0]
;lab8_driver.c,212 :: 		BoxRound2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_BoxRound2+24)
MOVT	R0, #hi_addr(_BoxRound2+24)
STRH	R1, [R0, #0]
;lab8_driver.c,213 :: 		BoxRound2.Gradient_End_Color = 0x64DF;
MOVW	R1, #25823
MOVW	R0, #lo_addr(_BoxRound2+26)
MOVT	R0, #hi_addr(_BoxRound2+26)
STRH	R1, [R0, #0]
;lab8_driver.c,214 :: 		BoxRound2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_BoxRound2+28)
MOVT	R0, #hi_addr(_BoxRound2+28)
STRH	R1, [R0, #0]
;lab8_driver.c,215 :: 		BoxRound2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+31)
MOVT	R0, #hi_addr(_BoxRound2+31)
STRB	R1, [R0, #0]
;lab8_driver.c,216 :: 		BoxRound2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_BoxRound2+32)
MOVT	R0, #hi_addr(_BoxRound2+32)
STRH	R1, [R0, #0]
;lab8_driver.c,217 :: 		BoxRound2.Corner_Radius   = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_BoxRound2+30)
MOVT	R0, #hi_addr(_BoxRound2+30)
STRB	R1, [R0, #0]
;lab8_driver.c,218 :: 		BoxRound2.OnClickPtr      = turnOff;
MOVW	R1, #lo_addr(_turnOff+0)
MOVT	R1, #hi_addr(_turnOff+0)
MOVW	R0, #lo_addr(_BoxRound2+44)
MOVT	R0, #hi_addr(_BoxRound2+44)
STR	R1, [R0, #0]
;lab8_driver.c,220 :: 		Label2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;lab8_driver.c,221 :: 		Label2.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;lab8_driver.c,222 :: 		Label2.Left            = 122;
MOVS	R1, #122
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;lab8_driver.c,223 :: 		Label2.Top             = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;lab8_driver.c,224 :: 		Label2.Width           = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;lab8_driver.c,225 :: 		Label2.Height          = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;lab8_driver.c,226 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;lab8_driver.c,227 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STRB	R1, [R0, #0]
;lab8_driver.c,228 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;lab8_driver.c,229 :: 		Label2.FontName        = Tahoma26x33_Regular;
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R2, [R0, #0]
;lab8_driver.c,230 :: 		Label2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;lab8_driver.c,231 :: 		Label2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;lab8_driver.c,233 :: 		BoxRound3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_BoxRound3+0)
MOVT	R0, #hi_addr(_BoxRound3+0)
STR	R1, [R0, #0]
;lab8_driver.c,234 :: 		BoxRound3.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_BoxRound3+4)
MOVT	R0, #hi_addr(_BoxRound3+4)
STRB	R1, [R0, #0]
;lab8_driver.c,235 :: 		BoxRound3.Left            = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_BoxRound3+6)
MOVT	R0, #hi_addr(_BoxRound3+6)
STRH	R1, [R0, #0]
;lab8_driver.c,236 :: 		BoxRound3.Top             = 165;
MOVS	R1, #165
MOVW	R0, #lo_addr(_BoxRound3+8)
MOVT	R0, #hi_addr(_BoxRound3+8)
STRH	R1, [R0, #0]
;lab8_driver.c,237 :: 		BoxRound3.Width           = 170;
MOVS	R1, #170
MOVW	R0, #lo_addr(_BoxRound3+10)
MOVT	R0, #hi_addr(_BoxRound3+10)
STRH	R1, [R0, #0]
;lab8_driver.c,238 :: 		BoxRound3.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_BoxRound3+12)
MOVT	R0, #hi_addr(_BoxRound3+12)
STRH	R1, [R0, #0]
;lab8_driver.c,239 :: 		BoxRound3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+14)
MOVT	R0, #hi_addr(_BoxRound3+14)
STRB	R1, [R0, #0]
;lab8_driver.c,240 :: 		BoxRound3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound3+16)
MOVT	R0, #hi_addr(_BoxRound3+16)
STRH	R1, [R0, #0]
;lab8_driver.c,241 :: 		BoxRound3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+18)
MOVT	R0, #hi_addr(_BoxRound3+18)
STRB	R1, [R0, #0]
;lab8_driver.c,242 :: 		BoxRound3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+19)
MOVT	R0, #hi_addr(_BoxRound3+19)
STRB	R1, [R0, #0]
;lab8_driver.c,243 :: 		BoxRound3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+20)
MOVT	R0, #hi_addr(_BoxRound3+20)
STRB	R1, [R0, #0]
;lab8_driver.c,244 :: 		BoxRound3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+21)
MOVT	R0, #hi_addr(_BoxRound3+21)
STRB	R1, [R0, #0]
;lab8_driver.c,245 :: 		BoxRound3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound3+22)
MOVT	R0, #hi_addr(_BoxRound3+22)
STRB	R1, [R0, #0]
;lab8_driver.c,246 :: 		BoxRound3.Gradient_Start_Color = 0xF819;
MOVW	R1, #63513
MOVW	R0, #lo_addr(_BoxRound3+24)
MOVT	R0, #hi_addr(_BoxRound3+24)
STRH	R1, [R0, #0]
;lab8_driver.c,247 :: 		BoxRound3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_BoxRound3+26)
MOVT	R0, #hi_addr(_BoxRound3+26)
STRH	R1, [R0, #0]
;lab8_driver.c,248 :: 		BoxRound3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_BoxRound3+28)
MOVT	R0, #hi_addr(_BoxRound3+28)
STRH	R1, [R0, #0]
;lab8_driver.c,249 :: 		BoxRound3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+31)
MOVT	R0, #hi_addr(_BoxRound3+31)
STRB	R1, [R0, #0]
;lab8_driver.c,250 :: 		BoxRound3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_BoxRound3+32)
MOVT	R0, #hi_addr(_BoxRound3+32)
STRH	R1, [R0, #0]
;lab8_driver.c,251 :: 		BoxRound3.Corner_Radius   = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_BoxRound3+30)
MOVT	R0, #hi_addr(_BoxRound3+30)
STRB	R1, [R0, #0]
;lab8_driver.c,252 :: 		BoxRound3.OnClickPtr      = norhan;
MOVW	R1, #lo_addr(_norhan+0)
MOVT	R1, #hi_addr(_norhan+0)
MOVW	R0, #lo_addr(_BoxRound3+44)
MOVT	R0, #hi_addr(_BoxRound3+44)
STR	R1, [R0, #0]
;lab8_driver.c,254 :: 		Label3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;lab8_driver.c,255 :: 		Label3.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;lab8_driver.c,256 :: 		Label3.Left            = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;lab8_driver.c,257 :: 		Label3.Top             = 182;
MOVS	R1, #182
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;lab8_driver.c,258 :: 		Label3.Width           = 95;
MOVS	R1, #95
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;lab8_driver.c,259 :: 		Label3.Height          = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;lab8_driver.c,260 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;lab8_driver.c,261 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STRB	R1, [R0, #0]
;lab8_driver.c,262 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;lab8_driver.c,263 :: 		Label3.FontName        = Tahoma26x33_Regular;
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R2, [R0, #0]
;lab8_driver.c,264 :: 		Label3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;lab8_driver.c,265 :: 		Label3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;lab8_driver.c,267 :: 		Box1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
STR	R1, [R0, #0]
;lab8_driver.c,268 :: 		Box1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+4)
MOVT	R0, #hi_addr(_Box1+4)
STRB	R1, [R0, #0]
;lab8_driver.c,269 :: 		Box1.Left            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+6)
MOVT	R0, #hi_addr(_Box1+6)
STRH	R1, [R0, #0]
;lab8_driver.c,270 :: 		Box1.Top             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+8)
MOVT	R0, #hi_addr(_Box1+8)
STRH	R1, [R0, #0]
;lab8_driver.c,271 :: 		Box1.Width           = 316;
MOVW	R1, #316
MOVW	R0, #lo_addr(_Box1+10)
MOVT	R0, #hi_addr(_Box1+10)
STRH	R1, [R0, #0]
;lab8_driver.c,272 :: 		Box1.Height          = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Box1+12)
MOVT	R0, #hi_addr(_Box1+12)
STRH	R1, [R0, #0]
;lab8_driver.c,273 :: 		Box1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+14)
MOVT	R0, #hi_addr(_Box1+14)
STRB	R1, [R0, #0]
;lab8_driver.c,274 :: 		Box1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+16)
MOVT	R0, #hi_addr(_Box1+16)
STRH	R1, [R0, #0]
;lab8_driver.c,275 :: 		Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+18)
MOVT	R0, #hi_addr(_Box1+18)
STRB	R1, [R0, #0]
;lab8_driver.c,276 :: 		Box1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+19)
MOVT	R0, #hi_addr(_Box1+19)
STRB	R1, [R0, #0]
;lab8_driver.c,277 :: 		Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+20)
MOVT	R0, #hi_addr(_Box1+20)
STRB	R1, [R0, #0]
;lab8_driver.c,278 :: 		Box1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+21)
MOVT	R0, #hi_addr(_Box1+21)
STRB	R1, [R0, #0]
;lab8_driver.c,279 :: 		Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+22)
MOVT	R0, #hi_addr(_Box1+22)
STRB	R1, [R0, #0]
;lab8_driver.c,280 :: 		Box1.Gradient_Start_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Box1+24)
MOVT	R0, #hi_addr(_Box1+24)
STRH	R1, [R0, #0]
;lab8_driver.c,281 :: 		Box1.Gradient_End_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Box1+26)
MOVT	R0, #hi_addr(_Box1+26)
STRH	R1, [R0, #0]
;lab8_driver.c,282 :: 		Box1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box1+28)
MOVT	R0, #hi_addr(_Box1+28)
STRH	R1, [R0, #0]
;lab8_driver.c,283 :: 		Box1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+30)
MOVT	R0, #hi_addr(_Box1+30)
STRB	R1, [R0, #0]
;lab8_driver.c,284 :: 		Box1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box1+32)
MOVT	R0, #hi_addr(_Box1+32)
STRH	R1, [R0, #0]
;lab8_driver.c,286 :: 		Box2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Box2+0)
MOVT	R0, #hi_addr(_Box2+0)
STR	R1, [R0, #0]
;lab8_driver.c,287 :: 		Box2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+4)
MOVT	R0, #hi_addr(_Box2+4)
STRB	R1, [R0, #0]
;lab8_driver.c,288 :: 		Box2.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+6)
MOVT	R0, #hi_addr(_Box2+6)
STRH	R1, [R0, #0]
;lab8_driver.c,289 :: 		Box2.Top             = 154;
MOVS	R1, #154
MOVW	R0, #lo_addr(_Box2+8)
MOVT	R0, #hi_addr(_Box2+8)
STRH	R1, [R0, #0]
;lab8_driver.c,290 :: 		Box2.Width           = 319;
MOVW	R1, #319
MOVW	R0, #lo_addr(_Box2+10)
MOVT	R0, #hi_addr(_Box2+10)
STRH	R1, [R0, #0]
;lab8_driver.c,291 :: 		Box2.Height          = 98;
MOVS	R1, #98
MOVW	R0, #lo_addr(_Box2+12)
MOVT	R0, #hi_addr(_Box2+12)
STRH	R1, [R0, #0]
;lab8_driver.c,292 :: 		Box2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+14)
MOVT	R0, #hi_addr(_Box2+14)
STRB	R1, [R0, #0]
;lab8_driver.c,293 :: 		Box2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+16)
MOVT	R0, #hi_addr(_Box2+16)
STRH	R1, [R0, #0]
;lab8_driver.c,294 :: 		Box2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+18)
MOVT	R0, #hi_addr(_Box2+18)
STRB	R1, [R0, #0]
;lab8_driver.c,295 :: 		Box2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+19)
MOVT	R0, #hi_addr(_Box2+19)
STRB	R1, [R0, #0]
;lab8_driver.c,296 :: 		Box2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+20)
MOVT	R0, #hi_addr(_Box2+20)
STRB	R1, [R0, #0]
;lab8_driver.c,297 :: 		Box2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+21)
MOVT	R0, #hi_addr(_Box2+21)
STRB	R1, [R0, #0]
;lab8_driver.c,298 :: 		Box2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+22)
MOVT	R0, #hi_addr(_Box2+22)
STRB	R1, [R0, #0]
;lab8_driver.c,299 :: 		Box2.Gradient_Start_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+24)
MOVT	R0, #hi_addr(_Box2+24)
STRH	R1, [R0, #0]
;lab8_driver.c,300 :: 		Box2.Gradient_End_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+26)
MOVT	R0, #hi_addr(_Box2+26)
STRH	R1, [R0, #0]
;lab8_driver.c,301 :: 		Box2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+28)
MOVT	R0, #hi_addr(_Box2+28)
STRH	R1, [R0, #0]
;lab8_driver.c,302 :: 		Box2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+30)
MOVT	R0, #hi_addr(_Box2+30)
STRB	R1, [R0, #0]
;lab8_driver.c,303 :: 		Box2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box2+32)
MOVT	R0, #hi_addr(_Box2+32)
STRH	R1, [R0, #0]
;lab8_driver.c,305 :: 		Image1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;lab8_driver.c,306 :: 		Image1.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;lab8_driver.c,307 :: 		Image1.Left            = 119;
MOVS	R1, #119
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;lab8_driver.c,308 :: 		Image1.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;lab8_driver.c,309 :: 		Image1.Width           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;lab8_driver.c,310 :: 		Image1.Height          = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;lab8_driver.c,311 :: 		Image1.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;lab8_driver.c,312 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;lab8_driver.c,313 :: 		Image1.Picture_Name    = eagle_jpg;
MOVW	R1, #lo_addr(_eagle_jpg+0)
MOVT	R1, #hi_addr(_eagle_jpg+0)
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;lab8_driver.c,314 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;lab8_driver.c,315 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;lab8_driver.c,316 :: 		}
L_end_InitializeObjects:
BX	LR
; end of lab8_driver_InitializeObjects
lab8_driver_IsInsideObject:
;lab8_driver.c,318 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;lab8_driver.c,319 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_lab8_driver_IsInsideObject130
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_lab8_driver_IsInsideObject129
; X end address is: 0 (R0)
;lab8_driver.c,320 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_lab8_driver_IsInsideObject128
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_lab8_driver_IsInsideObject127
; Y end address is: 4 (R1)
L_lab8_driver_IsInsideObject126:
;lab8_driver.c,321 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;lab8_driver.c,319 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_lab8_driver_IsInsideObject130:
L_lab8_driver_IsInsideObject129:
;lab8_driver.c,320 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_lab8_driver_IsInsideObject128:
L_lab8_driver_IsInsideObject127:
;lab8_driver.c,323 :: 		return 0;
MOVS	R0, #0
;lab8_driver.c,324 :: 		}
L_end_IsInsideObject:
BX	LR
; end of lab8_driver_IsInsideObject
_DrawLabel:
;lab8_driver.c,333 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;lab8_driver.c,334 :: 		if (ALabel->Visible != 0) {
ADDW	R1, R0, #27
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel10
;lab8_driver.c,335 :: 		if (ALabel->VerticalText != 0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel11
;lab8_driver.c,336 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawLabel12
L_DrawLabel11:
;lab8_driver.c,338 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawLabel12:
;lab8_driver.c,339 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;lab8_driver.c,340 :: 		}
L_DrawLabel10:
;lab8_driver.c,341 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;lab8_driver.c,343 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;lab8_driver.c,344 :: 		if (AImage->Visible != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage13
;lab8_driver.c,345 :: 		TFT_Image_Jpeg(AImage->Left, AImage->Top, AImage->Picture_Name);
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
BL	_TFT_Image_Jpeg+0
;lab8_driver.c,346 :: 		}
L_DrawImage13:
;lab8_driver.c,347 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawBox:
;lab8_driver.c,349 :: 		void DrawBox(TBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;lab8_driver.c,350 :: 		if (ABox->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawBox14
;lab8_driver.c,351 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox15
;lab8_driver.c,352 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;lab8_driver.c,353 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;lab8_driver.c,354 :: 		}
IT	AL
BAL	L_DrawBox16
L_DrawBox15:
;lab8_driver.c,356 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;lab8_driver.c,357 :: 		}
L_DrawBox16:
;lab8_driver.c,358 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;lab8_driver.c,359 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; ABox end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;lab8_driver.c,360 :: 		}
L_DrawBox14:
;lab8_driver.c,361 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawRoundBox:
;lab8_driver.c,363 :: 		void DrawRoundBox(TBox_Round *Around_box) {
; Around_box start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Around_box end address is: 0 (R0)
; Around_box start address is: 0 (R0)
;lab8_driver.c,364 :: 		if (Around_box->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundBox17
;lab8_driver.c,365 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundBox18
;lab8_driver.c,366 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;lab8_driver.c,368 :: 		Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
;lab8_driver.c,367 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;lab8_driver.c,368 :: 		Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;lab8_driver.c,367 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
LDR	R0, [SP, #4]
;lab8_driver.c,369 :: 		}
IT	AL
BAL	L_DrawRoundBox19
L_DrawRoundBox18:
;lab8_driver.c,372 :: 		Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
;lab8_driver.c,371 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;lab8_driver.c,372 :: 		Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;lab8_driver.c,371 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
LDR	R0, [SP, #4]
;lab8_driver.c,373 :: 		}
L_DrawRoundBox19:
;lab8_driver.c,374 :: 		TFT_Set_Pen(Around_box->Pen_Color, Around_box->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;lab8_driver.c,377 :: 		Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
ADDW	R1, R0, #30
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;lab8_driver.c,376 :: 		Around_box->Left + Around_box->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; Around_box end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;lab8_driver.c,375 :: 		TFT_Rectangle_Round_Edges(Around_box->Left + 1, Around_box->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
UXTH	R0, R1
UXTH	R1, R2
;lab8_driver.c,376 :: 		Around_box->Left + Around_box->Width - 2,
UXTH	R2, R3
;lab8_driver.c,377 :: 		Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
;lab8_driver.c,378 :: 		}
L_DrawRoundBox17:
;lab8_driver.c,379 :: 		}
L_end_DrawRoundBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawRoundBox
_DrawScreen:
;lab8_driver.c,381 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #40
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;lab8_driver.c,393 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;lab8_driver.c,394 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;lab8_driver.c,395 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;lab8_driver.c,396 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;lab8_driver.c,397 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;lab8_driver.c,398 :: 		round_box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;lab8_driver.c,399 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;lab8_driver.c,401 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen133
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen132
IT	AL
BAL	L_DrawScreen22
L__DrawScreen133:
L__DrawScreen132:
;lab8_driver.c,402 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
_LX	[R2, ByteOffset(GPIOE_ODR+0)]
STRB	R1, [SP, #36]
;lab8_driver.c,403 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R2, ByteOffset(GPIOE_ODR+0)]
;lab8_driver.c,404 :: 		TFT_Init_ILI9341_8bit(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_ILI9341_8bit+0
;lab8_driver.c,405 :: 		TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 8, 9);                                  // Initialize touch panel
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
MOVS	R3, #9
UXTH	R0, R1
UXTH	R1, R2
MOVS	R2, #8
BL	_TP_TFT_Init+0
;lab8_driver.c,406 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;lab8_driver.c,407 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;lab8_driver.c,408 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;lab8_driver.c,409 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;lab8_driver.c,410 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #36]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;lab8_driver.c,411 :: 		}
IT	AL
BAL	L_DrawScreen23
L_DrawScreen22:
;lab8_driver.c,413 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen23:
;lab8_driver.c,416 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen24:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen25
;lab8_driver.c,417 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen26
;lab8_driver.c,418 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;lab8_driver.c,419 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen27
;lab8_driver.c,420 :: 		label_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;lab8_driver.c,421 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;lab8_driver.c,422 :: 		DrawLabel(local_label);
LDR	R0, [SP, #8]
BL	_DrawLabel+0
;lab8_driver.c,423 :: 		}
L_DrawScreen27:
;lab8_driver.c,424 :: 		}
L_DrawScreen26:
;lab8_driver.c,426 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen28
;lab8_driver.c,427 :: 		local_box = GetBox(box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #20]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #24]
;lab8_driver.c,428 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen29
;lab8_driver.c,429 :: 		box_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;lab8_driver.c,430 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;lab8_driver.c,431 :: 		DrawBox(local_box);
LDR	R0, [SP, #24]
BL	_DrawBox+0
;lab8_driver.c,432 :: 		}
L_DrawScreen29:
;lab8_driver.c,433 :: 		}
L_DrawScreen28:
;lab8_driver.c,435 :: 		if (round_box_idx < CurrentScreen->Boxes_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen30
;lab8_driver.c,436 :: 		local_round_box = GetBox_Round(round_box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #28]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #32]
;lab8_driver.c,437 :: 		if (order == local_round_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen31
;lab8_driver.c,438 :: 		round_box_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;lab8_driver.c,439 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;lab8_driver.c,440 :: 		DrawRoundBox(local_round_box);
LDR	R0, [SP, #32]
BL	_DrawRoundBox+0
;lab8_driver.c,441 :: 		}
L_DrawScreen31:
;lab8_driver.c,442 :: 		}
L_DrawScreen30:
;lab8_driver.c,444 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen32
;lab8_driver.c,445 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;lab8_driver.c,446 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen33
;lab8_driver.c,447 :: 		image_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;lab8_driver.c,448 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;lab8_driver.c,449 :: 		DrawImage(local_image);
LDR	R0, [SP, #16]
BL	_DrawImage+0
;lab8_driver.c,450 :: 		}
L_DrawScreen33:
;lab8_driver.c,451 :: 		}
L_DrawScreen32:
;lab8_driver.c,453 :: 		}
IT	AL
BAL	L_DrawScreen24
L_DrawScreen25:
;lab8_driver.c,454 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #40
BX	LR
; end of _DrawScreen
_Get_Object:
;lab8_driver.c,456 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;lab8_driver.c,457 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;lab8_driver.c,458 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;lab8_driver.c,459 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;lab8_driver.c,460 :: 		box_round_order     = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
STRH	R3, [R2, #0]
;lab8_driver.c,462 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object34:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object35
;lab8_driver.c,463 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;lab8_driver.c,464 :: 		if (local_label->Active != 0) {
ADDW	R2, R3, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object37
;lab8_driver.c,466 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;lab8_driver.c,465 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;lab8_driver.c,466 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	lab8_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object38
;lab8_driver.c,467 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;lab8_driver.c,468 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;lab8_driver.c,469 :: 		}
L_Get_Object38:
;lab8_driver.c,470 :: 		}
L_Get_Object37:
;lab8_driver.c,462 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;lab8_driver.c,471 :: 		}
IT	AL
BAL	L_Get_Object34
L_Get_Object35:
;lab8_driver.c,474 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object39:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object40
;lab8_driver.c,475 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;lab8_driver.c,476 :: 		if (local_image->Active != 0) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object42
;lab8_driver.c,478 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;lab8_driver.c,477 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;lab8_driver.c,478 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	lab8_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object43
;lab8_driver.c,479 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;lab8_driver.c,480 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;lab8_driver.c,481 :: 		}
L_Get_Object43:
;lab8_driver.c,482 :: 		}
L_Get_Object42:
;lab8_driver.c,474 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;lab8_driver.c,483 :: 		}
IT	AL
BAL	L_Get_Object39
L_Get_Object40:
;lab8_driver.c,486 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object44:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object45
;lab8_driver.c,487 :: 		local_box = GetBox(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,488 :: 		if (local_box->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object47
;lab8_driver.c,490 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;lab8_driver.c,489 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;lab8_driver.c,490 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	lab8_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object48
;lab8_driver.c,491 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;lab8_driver.c,492 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,493 :: 		}
L_Get_Object48:
;lab8_driver.c,494 :: 		}
L_Get_Object47:
;lab8_driver.c,486 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;lab8_driver.c,495 :: 		}
IT	AL
BAL	L_Get_Object44
L_Get_Object45:
;lab8_driver.c,498 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object49:
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
; X start address is: 28 (R7)
; X end address is: 28 (R7)
; Y start address is: 32 (R8)
; Y end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object50
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
;lab8_driver.c,499 :: 		local_round_box = GetBox_Round(_object_count);
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_box+0)
MOVT	R2, #hi_addr(_local_round_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,500 :: 		if (local_round_box->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object52
;lab8_driver.c,502 :: 		local_round_box->Width, local_round_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_box+0)
MOVT	R6, #hi_addr(_local_round_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;lab8_driver.c,501 :: 		if (IsInsideObject(X, Y, local_round_box->Left, local_round_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;lab8_driver.c,502 :: 		local_round_box->Width, local_round_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	lab8_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object53
;lab8_driver.c,503 :: 		box_round_order = local_round_box->Order;
MOVW	R4, #lo_addr(_local_round_box+0)
MOVT	R4, #hi_addr(_local_round_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
STRH	R3, [R2, #0]
;lab8_driver.c,504 :: 		exec_round_box = local_round_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,505 :: 		}
L_Get_Object53:
;lab8_driver.c,506 :: 		}
L_Get_Object52:
;lab8_driver.c,498 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;lab8_driver.c,507 :: 		}
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
IT	AL
BAL	L_Get_Object49
L_Get_Object50:
;lab8_driver.c,509 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;lab8_driver.c,510 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object54
;lab8_driver.c,511 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object54:
;lab8_driver.c,512 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object55
;lab8_driver.c,513 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object55:
;lab8_driver.c,514 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object56
;lab8_driver.c,515 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object56:
;lab8_driver.c,516 :: 		if (box_round_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object57
;lab8_driver.c,517 :: 		_object_count = box_round_order;
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object57:
;lab8_driver.c,518 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;lab8_driver.c,521 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;lab8_driver.c,522 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;lab8_driver.c,523 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;lab8_driver.c,524 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,525 :: 		exec_round_box      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,527 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;lab8_driver.c,529 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press58
;lab8_driver.c,530 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press59
;lab8_driver.c,531 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press60
;lab8_driver.c,532 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press61
;lab8_driver.c,533 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;lab8_driver.c,534 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;lab8_driver.c,535 :: 		}
L_Process_TP_Press61:
;lab8_driver.c,536 :: 		}
L_Process_TP_Press60:
;lab8_driver.c,537 :: 		}
L_Process_TP_Press59:
;lab8_driver.c,539 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press62
;lab8_driver.c,540 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press63
;lab8_driver.c,541 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press64
;lab8_driver.c,542 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;lab8_driver.c,543 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;lab8_driver.c,544 :: 		}
L_Process_TP_Press64:
;lab8_driver.c,545 :: 		}
L_Process_TP_Press63:
;lab8_driver.c,546 :: 		}
L_Process_TP_Press62:
;lab8_driver.c,548 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press65
;lab8_driver.c,549 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press66
;lab8_driver.c,550 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press67
;lab8_driver.c,551 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;lab8_driver.c,552 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;lab8_driver.c,553 :: 		}
L_Process_TP_Press67:
;lab8_driver.c,554 :: 		}
L_Process_TP_Press66:
;lab8_driver.c,555 :: 		}
L_Process_TP_Press65:
;lab8_driver.c,557 :: 		if (_object_count == box_round_order) {
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press68
;lab8_driver.c,558 :: 		if (exec_round_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press69
;lab8_driver.c,559 :: 		if (exec_round_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press70
;lab8_driver.c,560 :: 		exec_round_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;lab8_driver.c,561 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;lab8_driver.c,562 :: 		}
L_Process_TP_Press70:
;lab8_driver.c,563 :: 		}
L_Process_TP_Press69:
;lab8_driver.c,564 :: 		}
L_Process_TP_Press68:
;lab8_driver.c,566 :: 		}
L_Process_TP_Press58:
;lab8_driver.c,567 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;lab8_driver.c,569 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;lab8_driver.c,571 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up71
;lab8_driver.c,573 :: 		case 6: {
L_Process_TP_Up73:
;lab8_driver.c,574 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up74
;lab8_driver.c,575 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,576 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up137
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up136
L__Process_TP_Up135:
;lab8_driver.c,577 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;lab8_driver.c,576 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up137:
L__Process_TP_Up136:
;lab8_driver.c,579 :: 		break;
IT	AL
BAL	L_Process_TP_Up72
;lab8_driver.c,580 :: 		}
L_Process_TP_Up74:
;lab8_driver.c,581 :: 		break;
IT	AL
BAL	L_Process_TP_Up72
;lab8_driver.c,584 :: 		case 7: {
L_Process_TP_Up78:
;lab8_driver.c,585 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up79
;lab8_driver.c,586 :: 		exec_round_box = (TBox_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,587 :: 		if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #31
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up139
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up138
L__Process_TP_Up134:
;lab8_driver.c,588 :: 		DrawRoundBox(exec_round_box);
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;lab8_driver.c,587 :: 		if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up139:
L__Process_TP_Up138:
;lab8_driver.c,590 :: 		break;
IT	AL
BAL	L_Process_TP_Up72
;lab8_driver.c,591 :: 		}
L_Process_TP_Up79:
;lab8_driver.c,592 :: 		break;
IT	AL
BAL	L_Process_TP_Up72
;lab8_driver.c,594 :: 		}
L_Process_TP_Up71:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_Process_TP_Up73
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #7
IT	EQ
BEQ	L_Process_TP_Up78
L_Process_TP_Up72:
;lab8_driver.c,596 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;lab8_driver.c,597 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;lab8_driver.c,599 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;lab8_driver.c,602 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up83
;lab8_driver.c,604 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up84
;lab8_driver.c,605 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up85
;lab8_driver.c,606 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up86
;lab8_driver.c,607 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up86:
;lab8_driver.c,608 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up87
;lab8_driver.c,609 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up88
;lab8_driver.c,610 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up88:
L_Process_TP_Up87:
;lab8_driver.c,611 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;lab8_driver.c,612 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;lab8_driver.c,613 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;lab8_driver.c,614 :: 		}
L_Process_TP_Up85:
;lab8_driver.c,615 :: 		}
L_Process_TP_Up84:
;lab8_driver.c,618 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up89
;lab8_driver.c,619 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up90
;lab8_driver.c,620 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up91
;lab8_driver.c,621 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up91:
;lab8_driver.c,622 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up92
;lab8_driver.c,623 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up93
;lab8_driver.c,624 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up93:
L_Process_TP_Up92:
;lab8_driver.c,625 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;lab8_driver.c,626 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;lab8_driver.c,627 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;lab8_driver.c,628 :: 		}
L_Process_TP_Up90:
;lab8_driver.c,629 :: 		}
L_Process_TP_Up89:
;lab8_driver.c,632 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up94
;lab8_driver.c,633 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up95
;lab8_driver.c,634 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up96
;lab8_driver.c,635 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up96:
;lab8_driver.c,636 :: 		if (PressedObject == (void *)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up97
;lab8_driver.c,637 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up98
;lab8_driver.c,638 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up98:
L_Process_TP_Up97:
;lab8_driver.c,639 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;lab8_driver.c,640 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;lab8_driver.c,641 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;lab8_driver.c,642 :: 		}
L_Process_TP_Up95:
;lab8_driver.c,643 :: 		}
L_Process_TP_Up94:
;lab8_driver.c,646 :: 		if (_object_count == box_round_order) {
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up99
;lab8_driver.c,647 :: 		if (exec_round_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up100
;lab8_driver.c,648 :: 		if (exec_round_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up101
;lab8_driver.c,649 :: 		exec_round_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up101:
;lab8_driver.c,650 :: 		if (PressedObject == (void *)exec_round_box)
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up102
;lab8_driver.c,651 :: 		if (exec_round_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up103
;lab8_driver.c,652 :: 		exec_round_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up103:
L_Process_TP_Up102:
;lab8_driver.c,653 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;lab8_driver.c,654 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;lab8_driver.c,655 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;lab8_driver.c,656 :: 		}
L_Process_TP_Up100:
;lab8_driver.c,657 :: 		}
L_Process_TP_Up99:
;lab8_driver.c,659 :: 		}
L_Process_TP_Up83:
;lab8_driver.c,660 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;lab8_driver.c,661 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;lab8_driver.c,662 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;lab8_driver.c,664 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;lab8_driver.c,666 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;lab8_driver.c,667 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;lab8_driver.c,668 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;lab8_driver.c,669 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,670 :: 		exec_round_box      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;lab8_driver.c,672 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;lab8_driver.c,674 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down104
;lab8_driver.c,675 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down105
;lab8_driver.c,676 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down106
;lab8_driver.c,677 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;lab8_driver.c,678 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;lab8_driver.c,679 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down107
;lab8_driver.c,680 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;lab8_driver.c,681 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;lab8_driver.c,682 :: 		}
L_Process_TP_Down107:
;lab8_driver.c,683 :: 		}
L_Process_TP_Down106:
;lab8_driver.c,684 :: 		}
L_Process_TP_Down105:
;lab8_driver.c,686 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down108
;lab8_driver.c,687 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down109
;lab8_driver.c,688 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;lab8_driver.c,689 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;lab8_driver.c,690 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down110
;lab8_driver.c,691 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;lab8_driver.c,692 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;lab8_driver.c,693 :: 		}
L_Process_TP_Down110:
;lab8_driver.c,694 :: 		}
L_Process_TP_Down109:
;lab8_driver.c,695 :: 		}
L_Process_TP_Down108:
;lab8_driver.c,697 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down111
;lab8_driver.c,698 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down112
;lab8_driver.c,699 :: 		if (exec_box->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down113
;lab8_driver.c,700 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;lab8_driver.c,701 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;lab8_driver.c,702 :: 		}
L_Process_TP_Down113:
;lab8_driver.c,703 :: 		PressedObject = (void *)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;lab8_driver.c,704 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;lab8_driver.c,705 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down114
;lab8_driver.c,706 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;lab8_driver.c,707 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;lab8_driver.c,708 :: 		}
L_Process_TP_Down114:
;lab8_driver.c,709 :: 		}
L_Process_TP_Down112:
;lab8_driver.c,710 :: 		}
L_Process_TP_Down111:
;lab8_driver.c,712 :: 		if (_object_count == box_round_order) {
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down115
;lab8_driver.c,713 :: 		if (exec_round_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down116
;lab8_driver.c,714 :: 		if (exec_round_box->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #31
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down117
;lab8_driver.c,715 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;lab8_driver.c,716 :: 		DrawRoundBox(exec_round_box);
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundBox+0
;lab8_driver.c,717 :: 		}
L_Process_TP_Down117:
;lab8_driver.c,718 :: 		PressedObject = (void *)exec_round_box;
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;lab8_driver.c,719 :: 		PressedObjectType = 7;
MOVS	R3, #7
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;lab8_driver.c,720 :: 		if (exec_round_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down118
;lab8_driver.c,721 :: 		exec_round_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;lab8_driver.c,722 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;lab8_driver.c,723 :: 		}
L_Process_TP_Down118:
;lab8_driver.c,724 :: 		}
L_Process_TP_Down116:
;lab8_driver.c,725 :: 		}
L_Process_TP_Down115:
;lab8_driver.c,727 :: 		}
L_Process_TP_Down104:
;lab8_driver.c,728 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;lab8_driver.c,730 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lab8_driver.c,731 :: 		if (TP_TFT_Press_Detect()) {
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP119
;lab8_driver.c,732 :: 		if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_TP_TFT_Get_Coordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP120
;lab8_driver.c,734 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;lab8_driver.c,735 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP121
;lab8_driver.c,736 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;lab8_driver.c,737 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;lab8_driver.c,738 :: 		}
L_Check_TP121:
;lab8_driver.c,739 :: 		}
L_Check_TP120:
;lab8_driver.c,740 :: 		}
IT	AL
BAL	L_Check_TP122
L_Check_TP119:
;lab8_driver.c,741 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP123
;lab8_driver.c,742 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;lab8_driver.c,743 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;lab8_driver.c,744 :: 		}
L_Check_TP123:
L_Check_TP122:
;lab8_driver.c,745 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;lab8_driver.c,747 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lab8_driver.c,748 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;lab8_driver.c,749 :: 		TFT_BLED = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
_SX	[R0, ByteOffset(GPIOE_ODR+0)]
;lab8_driver.c,750 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;lab8_driver.c,751 :: 		TP_TFT_Set_Default_Mode();
BL	_TP_TFT_Set_Default_Mode+0
;lab8_driver.c,752 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Start_TP:
;lab8_driver.c,754 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lab8_driver.c,755 :: 		Init_MCU();
BL	_Init_MCU+0
;lab8_driver.c,757 :: 		InitializeTouchPanel();
BL	lab8_driver_InitializeTouchPanel+0
;lab8_driver.c,759 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Start_TP124:
SUBS	R7, R7, #1
BNE	L_Start_TP124
NOP
NOP
NOP
NOP
;lab8_driver.c,760 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;lab8_driver.c,761 :: 		Calibrate();
BL	_Calibrate+0
;lab8_driver.c,762 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;lab8_driver.c,764 :: 		InitializeObjects();
BL	lab8_driver_InitializeObjects+0
;lab8_driver.c,765 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;lab8_driver.c,766 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;lab8_driver.c,767 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;lab8_driver.c,768 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
lab8_driver____?ag:
L_end_lab8_driver___?ag:
BX	LR
; end of lab8_driver____?ag
