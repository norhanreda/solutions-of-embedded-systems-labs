#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

ISR(INT1_vect)
{
  for (int i = 0; i < 5; i++) {
  PORTC |= (1<<PC0); // led on
  PORTC |= (1<<PC1); // led on
  PORTC |= (1<<PC2); // led on
   _delay_ms(500);    
   PORTC &= (~(1<<PC0)); //led off
   PORTC &= (~(1<<PC1)); //led off
   PORTC &= (~(1<<PC2)); //led off
    _delay_ms(500);   
  } 
}

void initiate_interrupt() {
  SREG = SREG & (~(1<<7)); //disaple interrupts
  
  DDRD &= (~(1<<PD3)); // pin input
 PORTD |= (1<<PD3); // pull up
  
  //GICR |= (1<<INT1);  //enable external interrupt 0
  EIMSK |= (1<<INT1);  //enable external interrupt 0

  //MCUCR = 1<<ISC10 | 1<<ISC11;  /* Trigger INT0 on rising edge */
  EICRA = 1<<ISC10 | 1<<ISC11;  /* Trigger INT0 on rising edge */
  
  SREG = SREG | (1<<7); //enaple interrupts
}

void setup() {
   
  // put your setup code here, to run once:
   initiate_interrupt();
   DDRC |= (1<<PC0); // pin output
   DDRC |= (1<<PC1); // pin output
   DDRC |= (1<<PC2); // pin output
   
   PORTC &= (~(1<<PC0)); //led off
   PORTC &= (~(1<<PC1)); //led off
   PORTC &= (~(1<<PC2)); //led off

}

void loop() {
  // put your main code here, to run repeatedly:

  PORTC |= (1<<PC0); // led on
  PORTC &= (~(1<<PC1)); //led off
  PORTC &= (~(1<<PC2)); //led off
   _delay_ms(500);
  
  PORTC |= (1<<PC1); // led on
  PORTC &= (~(1<<PC0)); //led off
  PORTC &= (~(1<<PC2)); //led off
  
   _delay_ms(500);

   PORTC |= (1<<PC2); // led on
   PORTC &= (~(1<<PC0)); //led off
   PORTC &= (~(1<<PC1)); //led off
   
   
   _delay_ms(500);
  
}
