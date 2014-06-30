char lastCmd = 'A';
char lastStatus = 'T';
float lastValue = 0.0;

String inputString = "";         // a string to hold incoming data

boolean transmissionComplete = false;  // whether the string is complete
boolean instructionComplete = true;  // whether the string is complete

boolean direction = true;
boolean pastDirection;

boolean directionUp = true;
boolean pastDirectionUp;

boolean triggerR=false;



int shifts =0;
int pastShifts=0;

public int speedJin = 100;
int pastSpeedJin;

int speedJin1 = 100;
int steerJin = 1;
int steerJinIntMulti=1;
int pastSteerJin;
int steerJinInt;

int steer = 0;
int pastSteer;
int steerInt;

int speedBot1 = 0;
int pastSpeedBot1 ;


int bot1SpeedUp=1;

int speed;
int speed1;
int pastSpeed;

public int speedBot1Value=0;
public int speedBot2Value=0;
public int steerBot2Value=0;
public int shiftsBot2Value=0;
public int speedBot3Value=0;
public int steerBot3Value=0;






///////////////////////// COMUNICATION /////////////

//public void triggerAA() {  
//  sendCMD('AA', 0);
//}

//public void triggerBB() {  
//  sendCMD('BB', 0);
//}

public void triggerE() {  
  sendCMD('E', 0);
}

//public void triggerFF() {  
//  sendCMD('FF', 0);
//}


///////////////////////////////////bot 1///////////////////////////////////////


public void triggerL() {  
  sendCMD('L', 100);
}
public void triggerR() { 

  speedBot1Value= speedBot1Value+15;
  speedBot1 = speedBot1Value;
  cp5.getController("speedBot1").setValue( speedBot1Value);
}
public void triggerS() {  

  speedBot1Value = speedBot1Value-15;
  speedBot1 = speedBot1Value;
  cp5.getController("speedBot1").setValue( speedBot1Value);
}

public void motorSpeedBot1() {

  speedBot1Value = speedBot1;

  if ( speedBot1Value>300) {
    speedBot1Value=300;
  }

  if ( speedBot1Value<=0) {
    speedBot1Value=0;
  }

  sendCMD('N', speedBot1Value);
}

public void triggerbot1b() {  
  sendCMD('V', 0);
}

public void triggerM() {  
  sendCMD('M', 0);
}

///////////////////////////////////////      BOT 2      ///////////////////////////////////////////

public void triggerD() {  
  sendCMD('D', 0);
}

public void triggerC() {  
  speedBot2Value= speedBot2Value+5;
  speed = speedBot2Value;
  cp5.getController("speed").setValue( speedBot2Value);
}

public void triggerQ() {  
  speedBot2Value= speedBot2Value-5;
  speed = speedBot2Value;
  cp5.getController("speed").setValue( speedBot2Value);
}

public void motorMoveDirectionSpeed() {


  speedBot2Value = speed;

  if ( speedBot2Value>100) {
    speedBot2Value=100;
  }

  if ( speedBot2Value<=0) {
    speedBot2Value=0;
  }
  //speed1 = speed;
  sendCMD('G', speedBot2Value);
}

public void triggerP() {
  steerBot2Value= steerBot2Value+1;
  steer = steerBot2Value;
  cp5.getController("steer").setValue( steerBot2Value);
}

public void triggerT() {  
  steerBot2Value= steerBot2Value-1;
  steer = steerBot2Value;
  cp5.getController("steer").setValue( steerBot2Value);
}

public void motorMoveDirectionSteer() {
  //steerInt= steer;

  steerBot2Value = steer;

  if ( steerBot2Value>5) {
    steerBot2Value=5;
  }

  if ( steerBot2Value<(-5)) {
    steerBot2Value=(-5);
  }

  sendCMD('O', steerBot2Value);
}

public void triggerW() {  
  shiftsBot2Value= shiftsBot2Value-1;
  shifts = shiftsBot2Value;
  cp5.getController("shifts").setValue( shiftsBot2Value);
}

public void triggerX() {  
  shiftsBot2Value= shiftsBot2Value+1;
  shifts = shiftsBot2Value;
  cp5.getController("shifts").setValue( shiftsBot2Value);
}



public void crabotshifts() {

  shiftsBot2Value = shifts;

  if ( shiftsBot2Value>5) {
    shiftsBot2Value=5;
  }

  if ( shiftsBot2Value<(-5)) {
    shiftsBot2Value=(-5);
  }


  sendCMD('U', shiftsBot2Value);
  // println("jin"+"   "+shifts);
}





///////////////////////////////////////      BOT 3      ///////////////////////////////////////////

public void triggerY() {  
  sendCMD('Y', 0);
}

public void triggerZ() {  
  speedBot3Value= speedBot3Value+5;
  speedJin = speedBot3Value;
  cp5.getController("speedJin").setValue( speedBot3Value);
}


public void triggerF() {  
  speedBot3Value= speedBot3Value-5;
  speedJin = speedBot3Value;
  cp5.getController("speedJin").setValue( speedBot3Value);
}

public void motorMoveDirectionSpeedJin() {

  speedBot3Value = speedJin;

  if ( speedBot3Value>100) {
    speedBot3Value=100;
  }

  if ( speedBot3Value<=0) {
    speedBot3Value=0;
  }


  sendCMD('K', speedBot3Value);
}

public void triggerI() {  
  sendCMD('I', 0);
}

public void triggerJ() {  
  sendCMD('J', 0);
}



public void triggerB() {  
  steerBot3Value= steerBot3Value-2;
  steerJin = steerBot3Value;
  cp5.getController("steerJin").setValue( steerBot3Value);
}

public void triggerA() {  
  steerBot3Value= steerBot3Value+2;
  steerJin = steerBot3Value;
  cp5.getController("steerJin").setValue( steerBot3Value);
}

public void motorMoveDirectionSteerJin() {

  steerBot3Value = steerJin;

  if ( steerBot3Value>20) {
    steerBot3Value=20;
  }

  if ( steerBot3Value<-20) {
    steerBot3Value=-20;
  }



  sendCMD('H', steerBot3Value);
}

/////////////////////////////////////////////////////////////////////////////  sending CMD   ///////////////////////////////////////////////////////////////////////////////////////////

public void sendCMD(char cmd, float valueFloat) { 


  int value = int(valueFloat);


  print("SENDING CMD: ");
  print(cmd);
  print(" VALUE: ");
  print(value);
  print(" >> ");
  print(cmd);     
  println(str(value));

  myPort.write(cmd);     
  myPort.write(str(value));
  myPort.write('\n');
}

public boolean sendCMDResponse(char cmd, float valueFloat) { 

  int value = int(valueFloat);

  if (instructionComplete == true) {
    print("SENDING CMD: ");
    print(cmd);
    print(" VALUE: ");
    print(value);
    print(" >> ");
    print(cmd);     
    println(str(value));

    lastCmd = cmd;
    lastStatus = 'F';
    lastValue = value;

    instructionComplete = false;

    myPort.write(cmd);     
    myPort.write(str(value));
    myPort.write('\n');

    return true;
  } 
  else {
    return false;
  }
}

void moveUp() {
}



void serialEvent(Serial myPort) {
  char inChar = myPort.readChar(); 
  // add it to the inputString:
  inputString += inChar;
  // if the incoming character is a newline, set a flag
  // so the main loop can do something about it:
  if (inChar == '\n') {
    transmissionComplete = true;
  } 

  if (transmissionComplete) {

    println(inputString);

    // clean the string to receive more commands
    inputString = "";
    // set the commands complete to false
    transmissionComplete = false;
  }
}

/*
void serialEvent(Serial myPort) {
 char inChar = myPort.readChar(); 
 // add it to the inputString:
 inputString += inChar;
 // if the incoming character is a newline, set a flag
 // so the main loop can do something about it:
 if (inChar == '\n') {
 transmissionComplete = true;
 } 
 
 if (transmissionComplete) {
 
 // not really optimize on strings but easier to learn
 // get the first character of the string which is the commands
 char status = inputString.substring(0, 1).charAt(0);
 char comand = inputString.substring(1, 2).charAt(0);
 
 // get the rest of the string which is the integer value
 float value = float(inputString.substring(2));
 
 
 // clean the string to receive more commands
 inputString = "";
 // set the commands complete to false
 transmissionComplete = false;
 // execute the received commands with the attached value
 print("CMD: ");
 println(comand);
 print("VALUE: ");
 println(value);
 print("STATUS: ");
 println(status);
 
 lastCmd = comand;
 lastStatus = status;
 lastValue = value;
 
 if (comand == lastCmd && value == lastValue) {
 println("DONE");
 instructionComplete = true;
 }
 }
 }*/
