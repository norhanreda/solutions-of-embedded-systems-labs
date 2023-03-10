#include <avr/io.h>
#include <util/delay.h>
int curr=1;
int prev=1;
void setup() {
  // put your setup code here, to run once:
DDRB &= (~(1<<PB0)); //in
 //up activate 
PORTB |= (1<<PB0); //1

DDRC |= (1<<PC0); //out
PORTC |= (1<<PC0); // -ve off 1


}

void loop() {
  // put your main code here, to run repeatedly:
  prev=curr;
  curr=PINB & (1<<PB0);
if(prev == 1 && curr == 0) //UP PRESSED 0?
{
 
    PORTC ^= ((1<<PC0)); 
     _delay_ms(30);
 
}

}
