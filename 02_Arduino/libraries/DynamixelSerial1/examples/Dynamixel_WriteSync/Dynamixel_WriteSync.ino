#include <DynamixelSerial1.h>

void setup(){
  Dynamixel.begin(1000000);  // Inicialize the servo at 1Mbps and Pin Control 2
  delay(1000);
}

void loop(){


  Dynamixel.setEndless(1,ON);
  
  Dynamixel.setEndless(2,ON);

  Dynamixel.turnSync(1, 2, RIGHT,100);

  delay(2000);

  Dynamixel.turnSync(1, 2, LEFT,100);
  
  delay(2000);

  Dynamixel.setEndless(1,OFF);
  
  Dynamixel.setEndless(2,OFF);

  Dynamixel.moveSpeedSync(1, 2, 200,200);
  
  delay(1000);
  
  Dynamixel.moveSpeedSync(1, 2, 0,200);
  
  delay(1000);



}


