
void set_motors_z_auto(int motorSpeed){
  if (zRatio > 0) {
    int zSpeed = zRatio * motorSpeed;
    Dynamixel.turn(M3_ID, LEFT, zSpeed);  //CNC
  } 
  else {
    Dynamixel.turn(M3_ID, LEFT, 0);  //CNC
  }
}

void move_up_z_step(){
  Dynamixel.turn(M3_ID, LEFT, 600);  //CNC
  delay(10);
  Dynamixel.turn(M3_ID, LEFT, 0);  //CNC
}

void move_set_up_manual(){
  Dynamixel.turn(M3_ID, LEFT, DEFAULT_Z_STEP_SPEED);  //CNC
  delay(25);
  Dynamixel.turn(M3_ID, LEFT, 0);  //CNC
}

void move_stop_z(){
  Dynamixel.turn(M3_ID, LEFT, 0);  //CNC
}

void move_set_down_manual(){
  Dynamixel.turn(M3_ID, RIGHT, DEFAULT_Z_STEP_SPEED);  //CNC
  delay(25);
  Dynamixel.turn(M3_ID, RIGHT, 0);  //CNC
}

void set_motors(int motor1speed, int motor2speed)
{
  // Dynamixel.turn - Must change by a turnSync function that will send two different speed at two different motors sync.
  Dynamixel.turn(M1_ID, LEFT,motor1speed); // Not using sync could cause trouble. Read above.
  Dynamixel.turn(M2_ID, RIGHT,motor2speed); // Not using sync could cause trouble. Read above.
}

void calibrateIRturn()
{
  Dynamixel.turn(M1_ID, LEFT,600); // Not using sync could cause trouble. Read above.
  Dynamixel.turn(M2_ID, LEFT,600); // Not using sync could cause trouble. Read above.
  delay(1500);
  Dynamixel.turn(M1_ID, RIGHT,600); // Not using sync could cause trouble. Read above.
  Dynamixel.turn(M2_ID, RIGHT,600); // Not using sync could cause trouble. Read above.
  delay(1500);
}



void stop_z()
{
  Dynamixel.turn(M3_ID, RIGHT, 0);  //CNC
}




