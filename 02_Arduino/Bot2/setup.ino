void motorSetup(){
  Dynamixel.begin(1000000);  // Inicialize the servo at 1Mbps and Pin Control 2
  Dynamixel.setEndless(M_FRNT_R_TRAVERSE,ON);
  Dynamixel.setEndless(M_FRNT_L_TRAVERSE,ON);
  Dynamixel.setEndless(M_BACK_R_TRAVERSE,ON);
  Dynamixel.setEndless(M_BACK_L_TRAVERSE,ON);
  traverseMotors(0);
  Serial.println("MOTORS READY");
}

void cmdSetup(){
  inputString.reserve(200);
  Serial.begin(9600); 
  Serial.println("SETUP"); 
}

void endSetupMode() {
  stop();
  digitalWrite(LED_STATUS_PIN, LOW);
  delay(500);
  Serial.println("ALL READY");
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




