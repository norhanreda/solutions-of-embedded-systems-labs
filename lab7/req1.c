unsigned int period = 0;
int dutyCycle = 0;
void main() {


period = PWM_TIM1_Init(500);

dutyCycle = period * 0.2;
PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL4);

PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);
while(1){}

}