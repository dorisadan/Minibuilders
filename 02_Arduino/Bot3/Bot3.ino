#include <DynamixelSerial1.h>
#include <PID_v1.h>

// MOTOR PING PARAMETERS

#define MOTOR_FRONT_LEFT 22
#define MOTOR_FRONT_RIGHT 20
#define MOTOR_BACK_LEFT 23
#define MOTOR_BACK_RIGHT 21

// PID TUNNING PARAMETER

#define Kp 2 
#define Ki 5
#define Kd 1

double targetSpeedLeft, inputSpeedLeft, outputSpeedLeft;

PID pidLeftWheels(&targetSpeedLeft, &inputSpeedLeft, &outputSpeedLeft, Kp, Ki, Kd, DIRECT);

double targetSpeedRight, inputSpeedRight, outputSpeedRight;

PID pidRightWheels(&targetSpeedRight, &inputSpeedRight, &outputSpeedRight, Kp, Ki, Kd, DIRECT);


void setup(){
  setupCommands();
  delay(1000);
  setupMotion();
  setupPID();
}

void loop() {
  checkCommands();
  readMotors();
  computeMotorSpeed();
  runMotors();
  // delay(100); (in case this fails pleae try to add a little bit of delay
}









