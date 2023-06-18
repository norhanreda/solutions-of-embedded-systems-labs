#include "lab8_objects.h"
#include "lab8_resources.h"

//--------------------- User code ---------------------//

//----------------- End of User code ------------------//

// Event Handlers
void norhan() {

      GPIOD_ODR ^= 0xFFFF;
      DrawScreen(&Screen1);
}
void turnOff() {
      GPIOD_ODR = 0x0000;  
      DrawScreen(&Screen1);
}
void turn_on() {

    GPIOD_ODR = 0xFFFF;
    DrawScreen(&Screen1);
}