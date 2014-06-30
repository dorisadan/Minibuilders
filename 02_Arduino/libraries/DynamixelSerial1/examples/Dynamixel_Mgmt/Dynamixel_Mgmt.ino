#include <DynamixelSerial1.h>

void setup(){
Dynamixel.begin(1000000,2);  // Inicialize the servo at 1Mbps and Pin Control 2
delay(1000);

// resetMixels();

// setMixel(1, 2);


}

void loop(){
  searchMixels();
}

void setMixel(int currentID, int newID) {
  Dynamixel.setID(currentID, newID);
  delay(500);
}


void resetMixels(){

  for(int id = 0 ; id <= 5; id++) { 

    Dynamixel.reset(id);


    Serial.begin(9600);
    Serial.print(id);
    Serial.print(" ");

    Serial.print("RESET");


    Serial.println();
    Serial.end();

    delay(500);                            
  } 

}

void searchMixels(){

  for(int id = 0 ; id <= 5; id++) { 
    int stat = Dynamixel.ping(id);

    Serial.begin(9600);
    Serial.print(id);
    Serial.print(" ");

    if (stat == -1) {
      Serial.print("ERROR");
    } 
    else {
      Serial.print("OK");
    } 

    Serial.println();
    Serial.end();

    delay(500);                            
  } 

}
