#include <DynamixelSerial1.h>

#define LED_STATUS_PIN 13                 // set to 1 if serial debug output needed



#define M_FRNT_R_TRAVERSE  4                // Dynamixel ID
#define M_FRNT_L_TRAVERSE  2                // Dynamixel ID
#define M_BACK_R_TRAVERSE  5                // Dynamixel ID
#define M_BACK_L_TRAVERSE  3                // Dynamixel ID

#define M_FRNT_R_ANGLE  6                  // Dynamixel ID
#define M_FRNT_L_ANGLE  8                  // Dynamixel ID
#define M_BACK_R_ANGLE  9                  // Dynamixel ID
#define M_BACK_L_ANGLE  7                  // Dynamixel ID

#define TRAVERSE_DIRECTION FF



#if  TRAVERSE_DIRECTION == FOWARD  
  #define DIRECTION_A true        //FALSE
  #define DIRECTION_B false         //TRUE
#else
  #define DIRECTION_A false     //true
  #define DIRECTION_B true        //false
#endif


#define M_EXTRUDER_ALIGN 30                // Dynamixel ID
#define M_EXTRUDER_STEP_SPEED 200                // Dynamixel ID

#define ALIGN_POSITION 512

#define DEFAULT_TRAVERSE_SPEED 200

#define DEFAULT_CORRECTION_SPEED 1000


int traverseSpeed = DEFAULT_TRAVERSE_SPEED;
boolean isRun = false;

void setup(){
  startSetupMode();
  cmdSetup();
  motorSetup();
  setAngleZero();
  endSetupMode();
}

void loop() {
  checkCommands();
  run();
  delay(40);
}























