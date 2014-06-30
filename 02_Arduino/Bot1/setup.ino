void setupMan(){
  stop();
  Serial.println("STARTING MANUAL SETUP");
  startSetupMode();
  setupMotors();
  manual_calibration(220); 
  endSetupMode();
  update_speed(DEFAULT_SPEED);  
  Serial.println("MANUAL SETUP READY");
}

void startQuickSetup() {
  startSetupMode();
  communicationSetup();
  Serial.println("STARTING QUICK BOOT SETUP");
  setupMotors();
  manual_calibration(40);
  update_speed(DEFAULT_SPEED);
  endSetupMode();
  Serial.println("QUICK BOOT SETUP READY");
}


void communicationSetup() {
  Serial.begin(9600);
  inputString.reserve(200);
}


void startSetupMode() {
  pinMode(LED_STATUS_PIN, OUTPUT);
  for (int i=0; i <= 5; i++){
    digitalWrite(LED_STATUS_PIN, HIGH);
    delay(100);
    digitalWrite(LED_STATUS_PIN, LOW);
    delay(100);
  } 
  digitalWrite(LED_STATUS_PIN, HIGH);
}

void endSetupMode() {
  digitalWrite(LED_STATUS_PIN, LOW);
  delay(500);
  Serial.println("ALL READY");
}

void setupMotors(){
  Dynamixel.begin(1000000,2);  // Inicialize the servo at 1Mbps and Pin Control 2
  delay(2000);
  Dynamixel.setEndless(M1_ID,ON);
  Dynamixel.setEndless(M2_ID,ON);
  Dynamixel.setEndless(M3_ID,ON);
  set_motors(0,0);
  Serial.println("MOTORS READY");

}







