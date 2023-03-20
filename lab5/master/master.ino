
#define SS PB2
#define SCK PB5
#define MOSI PB3
#define MISO PB4

/////////////////
#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <string.h>
uint8_t count;

void master_INIT()
{
  DDRB|=(1<<MOSI)|(1<<SCK)|(1<<SS);
  DDRB&=~(1<<MISO);
  PORTB|=(1<<SS);
  SPCR|=(1<<SPE)|(1<<MSTR)|(1<<SPR0);
  SPSR&=~(1<<SPI2X);
}

///////////master////////////
void SPI_WRITE(char data)
{ 
  char flush_buffer;
  SPDR=data;
  while(!(SPSR &(1<<SPIF)));
  flush_buffer = SPDR;
}
char SPI_READ ()
{
  SPDR=0xff;
   while(!(SPSR &(1<<SPIF)));
   Serial.println(SPDR);
  return (SPDR);
  
}

/////////////slave///////////
void slave_INIT()
{
  DDRB&=~((1<<MOSI)|(1<<SCK)|(1<<SS));
  DDRB|=(1<<MISO);
  SPCR|=(1<<SPE);
  
}

char slave_read ()
{
 
   while(!(SPSR &(1<<SPIF)));
  return (SPDR);
  
}

void ss_enable()
{
PORTB&=~(1<<SS);
_delay_ms(1000);
}




void setup() {
  // put your setup code here, to run once:
  count=0;
  master_INIT();
  ss_enable();
  Serial.begin(9600);
 

}

uint8_t x;

void loop() {
  // put your main code here, to run repeatedly:

  
   count++;
   if(count > 100)
    count = 1;
   SPI_WRITE(count);
   _delay_ms(1500);
   x=(uint8_t)SPI_READ();
   Serial.print("Master received: ");
   Serial.println(x);
   _delay_ms(1000);
   //count=(int)(count);
  
  
   

}
