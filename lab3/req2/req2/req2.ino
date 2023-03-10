
volatile uint8_t tot_overflow;
int currentNum = 0;

ISR(TIMER2_OVF_vect)
{
  tot_overflow++;
}

int convertNumber(int num)
{
  if(num == 0)
    return 0x7F;
  else if(num == 1)
    return 0x06;
  else if(num == 2)
    return 0x5B;
  else if(num == 3)
    return 0x4F;
  else if(num == 4)
    return 0x66;
  else if(num == 5)
    return 0x6D;
  else if(num == 6)
    return 0x7D;
  else if(num == 7)
    return 0x7;
  else if(num == 8)
    return 0xFF;
  else if(num == 9)
    return 0x6F;

}

//int convertNumber(int num)
//{
//  if(num == 0)
//    return 0x7E;
//  else if(num == 1)
//    return 0x60;
//  else if(num == 2)
//    return 0x6D;
//  else if(num == 3)
//    return 0x79;
//  else if(num == 4)
//    return 0x33;
//  else if(num == 5)
//    return 0x5B;
//  else if(num == 6)
//    return 0x7D;
//  else if(num == 7)
//    return 0xE0;
//  else if(num == 8)
//    return 0xFF;
//  else if(num == 9)
//    return 0x73;
//
//}

void timer2_init()
{
  TCCR2B |= ((1 << CS22) | (1 << CS21));
  TCNT2 = 0;
  TIMSK2 |= (1 << TOIE2);
  sei();
}


void setup() {
  // put your setup code here, to run once:
   // connect led to pin PC0
  DDRC |= 0xFF;
  // initialize timer
  timer2_init();

}

void loop() {
  
  // put your main code here, to run repeatedly:
  if (tot_overflow >= 244) 
    {
     
      // check if the timer count reaches 
      if (TCNT2 >= 36)
      {
        if (currentNum == 9)
        {
          currentNum = 0;
        }
        else
        {
          currentNum++;
        }
        PORTC = convertNumber(currentNum);

        
        TCNT2 = 0;        // reset counter
        tot_overflow = 0; // reset overflow counter
      }
    }

}
