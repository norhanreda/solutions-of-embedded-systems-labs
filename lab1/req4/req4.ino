#include <avr/io.h>
#include <util/delay.h>
 int count=0;
 bool curr=HIGH;
bool prev=HIGH;
void setup() {
  // put your setup code here, to run once:
DDRB &= (~(1<<PB0)); //in

DDRD |= (1<<PD0); //out
DDRD |= (1<<PD1); //out
DDRD |= (1<<PD2); //out
DDRD |= (1<<PD3); //out
DDRD |= (1<<PD4); //out
DDRD |= (1<<PD5); //out
DDRD |= (1<<PD6); //out
DDRD |= (1<<PD7); //out

  PORTD |= (1<<PD0);
  PORTD |= (1<<PD1);
   PORTD |= (1<<PD2);
     PORTD &= (~(1<<PB3));
      PORTD |= (1<<PD4);
       PORTD |= (1<<PD5);
        PORTD |= (1<<PD6);

}

void loop() {
  // put your main code here, to run repeatedly:
 
  prev=curr;
  curr=PINB & (1<<PB0);
if(prev == 0 && curr == 1) //DOWN PRESSED 1
{
  if(count==9)
  {
    count=0;
  }
   count++;

   if(count==0)
  {
   PORTD |= (1<<PD0);
   PORTD |= (1<<PD1);
    PORTD |= (1<<PD2);
     PORTD &= (~(1<<PB3));
      PORTD |= (1<<PD4);
       PORTD |= (1<<PD5);
        PORTD |= (1<<PD6);
  }
  else if(count==1)
  {
    PORTD &= (~(1<<PD0));
   PORTD &= (~(1<<PD1));
    PORTD |= (1<<PD2);
     PORTD &= (~(1<<PB3));
      PORTD &= (~(1<<PD4));
       PORTD &= (~(1<<PD5));
        PORTD |= (1<<PD6);
  }
  if(count==2)
  {
    
  }
  if(count==3)
  {
    
  }
  if(count==4)
  {
    
  }
  if(count==5)
  {
    
  }
  if(count==6)
  {
    
  }
  if(count==7)
  {
    
  }
  if(count==8)
  {
    
  }
  if(count==9)
  {
    
  }
  
  
 _delay_ms(30);
}
 

}
