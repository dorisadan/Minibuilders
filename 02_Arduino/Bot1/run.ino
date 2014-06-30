void run() {
  if (isRun) {
    display_run();
    unsigned int sensors[5];
    int position = qtrrc.readLine(sensors);

    int error = 0;

    int markDetectorValue = 0;

    for (int i = 0; i < LAPDETECTORS; i++)
    {
      markDetectorValue = markDetectorValue + sensors[i];
    }

    if (DEBUG2) { // if true, generate sensor dats via serial output
      Serial.print("LAP DETECTOR");
      Serial.print("\t V:");
      Serial.print(markDetectorValue);
      Serial.print("\t Vlast:");
      Serial.println(markDetectorPrevValue);
    }

    enlapsedTime = runTimmer.value(); 
    enlapsedLenght = enlapsedTime * traverseSpeed;

    if (markDetectorValue >= (LAPDETECTORS*1000) && markDetectorPrevValue < (LAPDETECTORS*1000)) {
      error = lastError;
      runTimmer.stop();
      lapTime = enlapsedTime; 
      lapLenght = enlapsedLenght;
      zStepLenght = lapLenght/zRatio;

      Serial.print("LAP DONE ");
      Serial.print(currentLap);
      Serial.print(": ");
      Serial.print(lapTime/1000);
      Serial.print(" s. (");
      Serial.print(lapTime);
      Serial.print(" ms. - ");
      Serial.print(lapLenght);
      Serial.println(" lenght.)");

      // if(currentLap <= 1) stop(); //UNCOMMENT TO STOP AFTER FIRST LAYER

      currentLap++;
      zStep = 0;
      runTimmer.reset();
      runTimmer.start();
    } 
    else {
      error = position - stripeMPoint;
    }


    if((autoZ == true) && ((enlapsedLenght - lastEnlapsedLenght) >= zStepLenght) && (lapTime <= enlapsedLenght) && (zStep <= ZSTEPS)) {
      lastEnlapsedLenght = enlapsedLenght;
      Serial.print("STEP Z UP ");
      Serial.print("\tSTEP LENGHT: ");
      Serial.print(lapLenght); 
      Serial.print("\tSTEP: ");
      Serial.print(zStep);
      Serial.print(" of ");
      Serial.print(" LAYER: ");
      Serial.println(currentLap);
      // move_up_z_step();
      zStep++;
    }

    markDetectorPrevValue = markDetectorValue;

    ///

    int motorSpeed = 0;

    if (abs(error) < agTrgg) {
      motorSpeed = (kp * error + kd * (error - lastError))/10;
    }

    else {

      if (DEBUG) { // if true, generate sensor dats via serial output
        Serial.print("AGRESSIVE PID");
        Serial.print("\t E:");
        Serial.print(error);
        Serial.print("\t AGG T:");
        Serial.println(agTrgg);
      }

      motorSpeed = ((kp*AGCF) * error + (kd*AGCF) * (error - lastError))/10;
    }


    lastError = error;

    int leftMotorSpeed = traverseSpeed - motorSpeed;
    int rightMotorSpeed = traverseSpeed + motorSpeed;

    if (DEBUG) { // if true, generate sensor dats via serial output
      Serial.print("P: ");
      Serial.print(position);
      Serial.print("\t E: ");
      Serial.print(error);
      Serial.print("\t M: ");
      Serial.print(motorSpeed);
      Serial.print("\t ML: ");
      Serial.print(leftMotorSpeed);
      Serial.print("\t MR: ");
      Serial.println(rightMotorSpeed);
    }

    // set motor speeds using the two motor speed variables above
    set_motors(leftMotorSpeed, rightMotorSpeed);
  } 
  else {
    set_motors(0,0);
    stop_z();
    display_not_run();

  }
}

void toggle_run() {
  if (isRun) {
    stop();
  } 
  else {
    start();
  } 
}

void start() {
  Serial.println("RUN");
  runTimmer.start();
  isRun = true;


}

void stop() {
  Serial.println("STOP");
  set_motors(0, 0);
  move_stop_z();
  runTimmer.stop();
  isRun = false;
}

void display_run()
{
  unsigned long currentMillis = millis();

  if(currentMillis - previousMillis > 500) {
    previousMillis = currentMillis;   

    if (ledState == LOW)
      ledState = HIGH;
    else
      ledState = LOW;

    digitalWrite(LED_STATUS_PIN, ledState);
  }
}

void display_not_run()
{
  digitalWrite(LED_STATUS_PIN, LOW);
}

void setZAut() {
  if (autoZ) {
    autoZ = false;
    Serial.print("Z STEP AUTO");
  } 
  else {
    autoZ = true;
    Serial.print("Z STEP DISABLED");
  } 
}
































