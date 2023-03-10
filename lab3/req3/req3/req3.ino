
volatile int tot_overflow = 0;
// TIMER0 overflow interrupt service routine
// called whenever TCNT0 overflows

ISR(TIMER2_COMPB_vect)
{
  tot_overflow++;
  if (tot_overflow >= 31)
  {
    PORTC ^= (1 << PC0); // toggles the led
    tot_overflow = 0;
  }
}

void timer2_init()
{
  TCCR2A &= 0;
  TCCR2B |= ((1 << 7) | (1 << 3));
  SREG &= ~(1 << 7);
  TCCR2B &= ~(1 << 6);

  TCCR2B |= 0x07;
  TCCR2B &= ~(1 << 4);
  TCCR2B &= ~(1 << 5);

  TIMSK2 |= (1 << OCIE2B);

  OCR2B = 123;
  SREG |= (1 << 7);
}
void setup() {
  // put your setup code here, to run once:
  // connect led to pin PC0
  DDRC |= (1 << PC0);
  // initialize timer
  timer2_init();
  

}

void loop() {
  // put your main code here, to run repeatedly:
  

}
