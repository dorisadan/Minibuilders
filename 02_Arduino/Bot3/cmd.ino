String inputString = "";         // a string to hold incoming data
boolean commandComplete = false;  // whether the string is complete

void checkCommands() {
  if (Serial.available()) {
    char inChar = (char)Serial.read(); 
    // add it to the inputString:
    inputString += inChar;
    // if the incoming character is a newline, set a flag
    // so the main loop can do something about it:
    if (inChar == '\n') {
      commandComplete = true;
    } 
  }

  if (commandComplete) {
    // not really optimize on strings but easier to learn
    // get the first character of the string which is the commands
    char command = inputString.substring(0,1).charAt(0);
    // get the rest of the string which is the integer value
    float value = inputString.substring(1).toInt();
    // clean the string to receive more commands
    inputString = "";
    // set the commands complete to false
    commandComplete = false;
    // execute the received commands with the attached value
    runCommand(command, value);

  }

  delay(1);

}

void runCommand(char commands, float value){
  switch (commands) {
  case 'L':   
    Serial.println("COMMAND L "); 
    setTargetSpeedLeft(value);
    break;
  case 'R':   
    Serial.println("COMMAND R "); 
    setTargetSpeedRight(value);
    break;
  }
}


void setupCommands() {
  Serial.begin(9600);  
  inputString.reserve(200);
}
