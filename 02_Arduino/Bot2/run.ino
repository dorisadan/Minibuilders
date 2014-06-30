int ledState = LOW;             // ledState used to set the LED
unsigned long previousMillis = 0;        // will store last time LED was updated

void toggle_run() {
  if (isRun) {
    stop();
  } 
  else {
    start();
  } 
}

void start() {
  isRun = true;
  Serial.println("RUN");
  traverseMotors(traverseSpeed);
  display_run();
}

void stop() {
  isRun = false;
  Serial.println("STOP");
  traverseMotors(0);
  display_not_run();
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

void run() {
  if (isRun) {
    display_run();
  } 
  else {
    display_not_run();
  }
}




