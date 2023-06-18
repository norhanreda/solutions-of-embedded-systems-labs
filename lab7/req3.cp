#line 1 "D:/Astudy/third year/second term/embedded/labs/lab7/req3.c"
unsigned int period = 0;
int decrease = 0;
int dutyCycle = 0;
int i =0;
void main(){




period = PWM_TIM4_Init(4000);

while(1){

for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
{
PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);
PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PD12);
}

for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
{
PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL2);
PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
}

for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
{
PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL3);
PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PD14);
}


for( dutyCycle =0; dutyCycle<period ;dutyCycle++)
{
PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL4);
PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PD15);
}

Delay_us(50);

for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
{
PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);
PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PD12);
}
for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
{
PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL2);
PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
}
for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
{
PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL3);
PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PD14);
}
for( dutyCycle =period; dutyCycle>0 ;dutyCycle--)
{
PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL4);
PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PD15);
}
}
}
