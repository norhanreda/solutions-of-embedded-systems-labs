uint16_t adc_result0;
uint8_t y;

void adc_init()
{
// AREF = AVcc
ADMUX = (1<<REFS0);
// ADC Enable and prescaler of 128
// 16000000/128 = 125000
ADCSRA = (1<<ADEN)|(1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0);
}

uint16_t adc_read(uint8_t ch)
{
// select the corresponding channel 0~5
// ANDing with ’7′ will always keep the value
// of ‘ch’ between 0 and 5
ch &= 0b00000111; // AND operation with 7
ADMUX = (ADMUX & 0xF8)|ch; // clears the bottom 3 bits before ORing
// start single conversion
// write ’1′ to ADSC
ADCSRA |= (1<<ADSC);
// wait for conversion to complete
// ADSC becomes ’0′ again
// till then, run loop continuously
while(ADCSRA & (1<<ADSC));
return (ADC);
}

void setup() {
  // put your setup code here, to run once:
// initialize adc

DDRB |= (1<<PB0);
DDRB |= (1<<PB1);
DDRB |= (1<<PB2);
PORTB &= (~(1<<PB0));
PORTB &= (~(1<<PB1));
PORTB &= (~(1<<PB2));

adc_init();
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
adc_result0 = adc_read(0); // read adc value at PC0
Serial.print(adc_result0);
Serial.print("\n");
// condition for led to turn on or off

y=(adc_result0*7.0)/1023;
//
PORTB=y;

//if (y ==1){
//PORTB |= (1<<PB0);
//PORTB &= (~(1<<PB1));
//PORTB &= (~(1<<PB2));
//}
//else if (y == 2){
//PORTB |= (1<<PB1);
//PORTB &= (~(1<<PB0));
//PORTB &= (~(1<<PB2));
//}
//else if (y == 3){
//PORTB |= (1<<PB0);
//PORTB |= (1<<PB1);
//PORTB &= (~(1<<PB2));
//}
//else if (y == 4){
//PORTB |= (1<<PB2);
//PORTB &= (~(1<<PB0));
//PORTB &= (~(1<<PB1));
//}
//else if (y == 5){
//PORTB |= (1<<PB0);
//PORTB |= (1<<PB2);
//PORTB &= (~(1<<PB1));
//}
//else if (y == 6){
//PORTB |= (1<<PB1);
//PORTB |= (1<<PB2);
//PORTB &= (~(1<<PB0));
//}
//else if (y == 7){
//PORTB |= (1<<PB1);
//PORTB |= (1<<PB2);
//PORTB |= (1<<PB0);
//}
//else if (y == 0){
//PORTB &= (~(1<<PB0));
//PORTB &= (~(1<<PB1));
//PORTB &= (~(1<<PB2));
//}
}
