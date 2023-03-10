
void timer1_init()
{
  
  TCNT2 = 0;
  OCR2A = 250;

  DDRB |= 8; //00001000

  // non PWM
  TCCR2B |= (1 << 7);

  // CTC mode
  //TCCR2B &= ~8; //0111
  TCCR2A |= 2;  //10
  TCCR2A &= ~1; // WGM21=0

  // toggle OC2A
  TCCR2A |= (1 << 6);
  TCCR2A &= ~(1 << 7);

  // setting clock/1024
  // TCCR2B |= 7; 111
   TCCR2B |= ((1 << CS22) | (1 << CS20) | (1 << CS21));
}

void setup() {
  // put your setup code here, to run once:
   timer1_init();

}

void loop() {
  // put your main code here, to run repeatedly:

}
