
// global variable to count the number of overflows
volatile uint8_t tot_overflow;
// TIMER0 overflow interrupt service routine
// called whenever TCNT0 overflows
ISR(TIMER2_OVF_vect)
{
  // keep a track of number of overflows
  tot_overflow++;
}

void timer2_init()
{
  // initialize counter
  TCNT2 = 0;

  // enable overflow interrupt
  TIMSK2 |= (1 << TOIE2);

  
 
  TCCR2B |= ((1 << CS22) | (1 << CS20) | (1 << CS21));
  
  
  
}

void setup() {
  // put your setup code here, to run once:
  // connect led to pin PC0
  DDRC |= (1 << PC0);
  PORTC &= (~(1 << PC0));
  // enable global interrupts
  sei();
  // initialize timer
  timer2_init();

}

void loop() {
  // put your main code here, to run repeatedly:
   if (tot_overflow >= 30) 
    {
 
      // check if the timer count reaches 131
      if (TCNT2 >= 131)
      {

        PORTC ^= (1 << PC0); // toggles the led
        TCNT2 = 0;           // reset counter
        tot_overflow = 0;    // reset overflow counter
      }
    }

}
