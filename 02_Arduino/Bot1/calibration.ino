void manual_calibration(int calCycles) {
  if (DEBUG) { // if true, generate sensor dats via serial output
    Serial.println("Calibrating IR Follower:");
  }

  int i;
  for (i = 0; i < calCycles; i++)  // BEFORE 100 the calibration will take a few seconds
  {
    //calibrateIRturn();
    qtrrc.calibrate(QTR_EMITTERS_ON);
    delay(40);
  }
  set_motors(0,0);
  if (DEBUG) { // if true, generate sensor dats via serial output
    Serial.print("ID: ");
    Serial.print("\t");
    for (int i = 0; i < NUM_SENSORS; i++)
    {
      Serial.print(i);
      Serial.print("\t");
    }
    Serial.print("\n");
    Serial.print("Min: ");
    Serial.print("\t");
    for (int i = 0; i < NUM_SENSORS; i++)
    {
      Serial.print(qtrrc.calibratedMinimumOn[i]);
      Serial.print("\t");
    }
    Serial.print("\n");
    Serial.print("Max: ");
    Serial.print("\t");
    for (int i = 0; i < NUM_SENSORS; i++)
    {
      Serial.print(qtrrc.calibratedMaximumOn[i]);
      Serial.print("\t");
    }
    Serial.print("\n");
    Serial.print("\n");


  }

  Serial.println("CALIBRATION READY");

}

void launch_calibration () {
  toggle_run();
  setup();
}

void update_speed (int xy_speed) {

  if (DEBUG) { // if true, generate sensor dats via serial output
    Serial.print("Updated Speed: ");
    Serial.print("\t Vxy: ");
    Serial.print(xy_speed);
    Serial.print("\n");
  }

  /*

   50  .1 .2
   100 .2 .4
   
   */

  traverseSpeed = xy_speed;

  float v_kp = (xy_speed / 1000.0) * 2;
  float v_kd = v_kp * 3;

  updated_pid_params(v_kp, v_kd);
}


void updated_pid_params(float Kp, float Kd) {

  if (DEBUG) { // if true, generate sensor dats via serial output
    Serial.print("Updated PID: ");
    Serial.print("\t KP: ");
    Serial.print(Kp);
    Serial.print("\t KD: ");
    Serial.print(Kd);
    Serial.print("\n");
  }

  kp = Kp;
  kd = Kd;
}

void set_z_ration(int ZRatio){
  zRatio =ZRatio;
}

void set_ag_trigger(int agTrigger){
  agTrgg = agTrigger;
}

void setStripe(int stripe){
  agTrgg = stripe;
}




void toggle_debugg() {
  if (DEBUG) {
    DEBUG = 0;
  } 
  else {
    DEBUG = 1;
  } 
}



