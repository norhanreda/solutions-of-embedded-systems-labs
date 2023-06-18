/*int i;
void main() {

     GPIO_Digital_Output(&GPIOD_BASE,  _GPIO_PINMASK_ALL);
     GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);

      GPIOD_ODR = 0;
	  GPIOE_ODR = 0;

     while(1)
     {
	  for ( i=0 ; i<4; i++){

	  GPIOD_ODR |= (1<<i)|(1<<(i+4))|(1<<(i+8))|(1<<(i+12));
          GPIOE_ODR |= (1<<(i+8))|(1<<(i+12));
	  Delay_ms(100);

	}
	for ( i=0 ; i<4; i++){

	  GPIOD_ODR &= ~((1<<i)|(1<<(i+4))|(1<<(i+8))|(1<<(i+12)));
      GPIOE_ODR &= ~((1<<(i+8))|(1<<(i+12)));
	  Delay_ms(100);

	}
     }

}               */