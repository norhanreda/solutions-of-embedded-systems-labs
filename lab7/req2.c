/*unsigned int period = 0;

int dutyCycle = 0;
 int i=0;
void main(){



period = PWM_TIM1_Init(3800);

while(1){



for( i =0; i<=100 ;i++)
{
 dutyCycle = period*(i /100.0);
PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL4);
PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);
Delay_ms(100);

}

for( i =100; i>=0 ;i--)
{
dutyCycle = period*(i /100.0);
PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL4);
PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);
Delay_ms(100);

}




}



}        */