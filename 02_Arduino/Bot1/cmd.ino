

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
}

void runCommand(char commands, float value){
  switch (commands) {
  case 'L':   
    toggle_run();  
    break;
  case 'N':
    update_speed(value);      // set SPEED | DEFAULT_SPEED 120
    break;
  case 'V':   
    move_set_up_manual();    // move Z UP MANUALLY a big step | DEFAULT_Z_STEP_SPEED  600
    break;
  case 'M':   
    move_set_down_manual();  // move Z DOWN MANUALLY a big step | DEFAULT_Z_STEP_SPEED  600
    break;  
  case 'D':   
    set_z_ration(value);     // number of segments in which the LAP lenght is DEVIDED | ZSTEPS 10
    break;
  case 'X':   
    set_ag_trigger(value);   // set the error target to trigger the agressive PID settings | ERRORAG 1200
    break;
  case 'Z':   
    toggle_debugg();    // launch line follower calibration and stop
    break; 
  case 'W':   
    setupMan();    // launch line follower calibration and stop
    break;  
  case 'E':   
    setStripe(value);    // launch line follower calibration and stop
    break;
  case 'Q':   
    setZAut();    // launch line follower calibration and stop
    break;    
  }

}









