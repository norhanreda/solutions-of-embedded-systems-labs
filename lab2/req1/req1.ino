
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

 ISR(INT0_vect)
{
  PORTC=^PORTC;    //Toggle PORTC 
 // _delay_ms(50);    // Software debouncing control delay 
  
}

void initiate_interrupt() {
  SREG = SREG & (~(1<<7)); //disaple interrupts
  DDRD &= (~(1<<PD2)); // pin2 input
  //GICR |= (1<<INT0);  //enable external interrupt 0
  EIMSK |= (1<<INT0);  //enable external interrupt 0
  //MCUCR = 1<<ISC01 | 1<<ISC00;  /* Trigger INT0 on rising edge */
 EICRA |= 1<<ISC01 | 1<<ISC00;  /* Trigger INT0 on rising edge */
  SREG = SREG | (1<<7); //enaple interrupts


}

void setup() {
   
  // put your setup code here, to run once:
   initiate_interrupt();
   DDRC |= (1<<PC0); // pin6 output
   PORTC &=  (~(1<<PC0)); //LED OFF
 // PORTC |=  (1<<PC0); //LED OFF

}

void loop() {
  // put your main code here, to run repeatedly:

}
