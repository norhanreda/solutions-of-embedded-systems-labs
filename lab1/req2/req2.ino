#include <avr/io.h>
#include <util/delay.h>
void setup() {
  // put your setup code here, to run once:
DDRB &= (~(1<<PB0));
DDRB &= (~(1<<PB1));
DDRC |= (1<<PC0);
DDRC |= (1<<PC1);
PORTC &= (~(1<<PC0));
PORTC &= (~(1<<PC1));
}

void loop() {
  // put your main code here, to run repeatedly:
if(PINB & (1<<PB0))
{
  PORTC |= (1<<PC0);
 // _delay_ms(30);
}
else
{
  PORTC &= (~(1<<PC0));
 // _delay_ms(30);
}
if(PINB & (1<<PB1))
{
  PORTC |= (1<<PC1);
  //_delay_ms(30);
}
else
{
  PORTC &= (~(1<<PC1));
 // _delay_ms(30);
}
}
