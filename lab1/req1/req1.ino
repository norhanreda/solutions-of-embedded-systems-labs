#include <avr/io.h>
#include <util/delay.h>

void setup() {
  // put your setup code here, to run once:
  DDRD |= (1<<PD6); // pin6 output
  PORTD |=(1<<PD6); //LED OFF
  
  

}

void loop() {
  // put your main code here, to run repeatedly:
  PORTD &= (~(1<<PD6));//on
  _delay_ms(1000);
   PORTD |=(1<<PD6); //off
   _delay_ms(1000);
}
