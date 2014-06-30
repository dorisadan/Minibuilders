void traverseMotors(int trvspeed){
  if (isRun || trvspeed == 0) {
    traverseLeft(trvspeed);
    traverseRight(trvspeed);
    Serial.println("TRAV MOTORS UPDATED");
  } 
  else {
    Serial.println("TRAV MOTORS NOT UPDATED (STOPED)");
  }
}


void traverseLeft(int leftSpeed){  
  Dynamixel.turnSync(M_FRNT_R_TRAVERSE,M_BACK_R_TRAVERSE,DIRECTION_A,leftSpeed);
}


void traverseRight(int rightSpeed){
  Dynamixel.turnSync(M_FRNT_L_TRAVERSE,M_BACK_L_TRAVERSE,DIRECTION_B,rightSpeed);
}

void setAngleZero(){
  angleAll(ALIGN_POSITION);
  Serial.println("MOTORS ALIGNED");
}


void angleAll(int anglePosition){
  angleLeft(anglePosition, DEFAULT_CORRECTION_SPEED);
  angleRght(anglePosition, DEFAULT_CORRECTION_SPEED);
}

void angleLeft(int leftPosition, int leftSpeed){  
  Dynamixel.moveSpeedSync(M_FRNT_R_ANGLE, M_BACK_R_ANGLE, leftPosition,leftSpeed);
}

void angleRght(int rightPosition, int rightSpeed){
  Dynamixel.moveSpeedSync(M_FRNT_L_ANGLE, M_BACK_L_ANGLE, rightPosition,rightSpeed);
}
//
void angleBackOposite(int leftPosition, int leftSpeed){  
  Dynamixel.moveSpeedSync(M_BACK_R_ANGLE, M_BACK_L_ANGLE, leftPosition,leftSpeed);
}

void angleFrontOposite(int rightPosition, int rightSpeed){
  Dynamixel.moveSpeedSync(M_FRNT_R_ANGLE, M_FRNT_L_ANGLE, rightPosition,rightSpeed);
}


void setAngleCorrection(int correction) {
  angleLeft(ALIGN_POSITION-correction, DEFAULT_CORRECTION_SPEED);
  angleRght(ALIGN_POSITION+correction, DEFAULT_CORRECTION_SPEED);
  Serial.print("ANGLE MOTORS SET\t");
  Serial.println(correction);
}
//////

void setAngleCorrectionOposite(int correction) {
  angleBackOposite(ALIGN_POSITION-correction, DEFAULT_CORRECTION_SPEED);
  angleFrontOposite(ALIGN_POSITION+correction, DEFAULT_CORRECTION_SPEED);
  Serial.print("ANGLE MOTORS SET\t");
  Serial.println(correction);
}

//////


void setTraverseSpeed(int tSpeed){
  traverseSpeed = tSpeed;
  Serial.print("TRAV MOTORS SET\t");
  Serial.println(traverseSpeed);
  traverseMotors(traverseSpeed);
}

void setExtruderCorrection(int correction) {
  correction = 512 + correction;
  Dynamixel.moveSpeed(M_EXTRUDER_ALIGN, correction, M_EXTRUDER_STEP_SPEED); 
  Serial.print("EXTRUDER MOTOR SET\t");
  Serial.println(correction);  
}







