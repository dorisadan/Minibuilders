void setupPID(){
  readMotors();
  pidLeftWheels.SetMode(AUTOMATIC);
  pidRightWheels.SetMode(AUTOMATIC);
}

void computeMotorSpeed(){
  pidLeftWheels.Compute();
  pidRightWheels.Compute();
}

void setTargetSpeedLeft(int sLeft){
  targetSpeedLeft = sLeft;
}

void setTargetSpeedRight(int sRight){
  targetSpeedRight = sRight;
}


double averageBackFront(double inputSpeedA, double inputSpeedB){
  return (inputSpeedA + inputSpeedB) / 2;
}





