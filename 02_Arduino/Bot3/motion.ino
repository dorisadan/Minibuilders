void setupMotion() {
  Dynamixel.begin(1000000,2);  // Inicialize the servo at 1Mbps and Pin Control 2
  Dynamixel.setEndless(MOTOR_FRONT_LEFT,ON);
  Dynamixel.setEndless(MOTOR_FRONT_RIGHT,ON);
  Dynamixel.setEndless(MOTOR_BACK_LEFT,ON);
  Dynamixel.setEndless(MOTOR_BACK_RIGHT,ON);
}


void runMotors(){
  Dynamixel.turnSync(MOTOR_FRONT_LEFT, MOTOR_BACK_LEFT, RIGHT,outputSpeedLeft); 
  Dynamixel.turnSync(MOTOR_FRONT_RIGHT, MOTOR_BACK_RIGHT, LEFT,outputSpeedRight); 
}

void readMotors(){
  inputSpeedLeft = averageBackFront(Dynamixel.readSpeed(MOTOR_FRONT_LEFT), Dynamixel.readSpeed(MOTOR_BACK_LEFT));
  delay(50); // Safety, can be removed
  inputSpeedRight = averageBackFront(Dynamixel.readSpeed(MOTOR_FRONT_RIGHT), Dynamixel.readSpeed(MOTOR_BACK_RIGHT));
  delay(50); // Safety, can be removed
}


