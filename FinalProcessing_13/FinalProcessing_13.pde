import processing.serial.*;
import controlP5.*;
ControlWindow controlWindow;
import peasy.*;
PeasyCam cam;
ControlP5 cp5;
Serial myPort;  



boolean path = false;
boolean pts = false;
boolean autoMode = false;
boolean stepStarted = false;

int currentVehiclePoint = -1;

int entries = 0;
String dataPath = "reverwsed.csv"; // 
String[] loadedData; // array to parse the data file
Plot[] plots;

Vehicle v;

public float boxSize = 1000;

void setup() {

  pastSpeed = speed;
  pastSpeedJin = speedJin;
  
  pastSpeedBot1 = speedBot1;
 

  pastDirection = direction;
  pastDirectionUp = directionUp; 
  pastShifts=shifts;

  pastSteerJin = steerJin;


  
 
  

  size(1100, 1100, P3D);

  selectSerialPort();  
  OscSetup();


  //initializing camera
  cam = new PeasyCam(this, 1500);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(2000);
  println("DORI"+"   "+Serial.list());

  //  String portName = Serial.list()[0];
  //  myPort = new Serial(this, portName, 9600);

  cp5 = new ControlP5(this);
  controlP5setup();
  controlWindow.addCanvas(new MyCanvas());

  parseData("data/" + dataPath); // load data file
}



void draw() {
  background(0);
  OscDraw();

  ///

  if (speed != pastSpeed) {
    motorMoveDirectionSpeed();
    speed = pastSpeed;
  }

  if (steer != pastSteer) {
    motorMoveDirectionSteer();
    steer = pastSteer;
  }   

  if (shifts != pastShifts) {
    crabotshifts();
    pastShifts = shifts;
  }   


  if (speedJin != pastSpeedJin) {
    motorMoveDirectionSpeedJin();
    speedJin = pastSpeedJin;
  } 


  if (steerJin != pastSteerJin) {
    motorMoveDirectionSteerJin();
    steerJin = pastSteerJin;
  } 
  
    if (speedBot1 != pastSpeedBot1) {
    motorSpeedBot1();
    speedBot1 = pastSpeedBot1;
  }




  ///

  for (int i = 0; i < entries; i++) {    
    plots[i].draw(i, entries);
  }

  if (stepStarted == true) {
    if (v.arrive() == false) newStep();
    v.display();
    v.displayOrigin();
    v.displayTarget();
  }

  drawBox();
  //  checkSerial();
}


void parseData (String amDataFile) { 
  loadedData = loadStrings(amDataFile); 
  plots = new Plot[loadedData.length];
  entries = round(loadedData.length);

  String[] prevSegments = {
  };

  for (int i = 0; i < entries; i++) {
    String[] segments = split(loadedData[i], ',');
    String id = segments[0];
    int pp = int(segments[1]);
    boolean isBrake = (i <= 0 || i+1 >= entries || int(prevSegments[1]) != int(segments[1])) ? true : false;      //change to spiral
    float dd = float(segments[2]);
    float aa = float(segments[3]);
    float xx = float(segments[4]);
    float prevxx = (i <= 0) ? float(segments[4]) : float(prevSegments[4]);
    float yy = float(segments[5]);
    float prevyy = (i <= 0) ? float(segments[5]) : float(prevSegments[5]);
    float zz = float(segments[6]);
    float prevzz = (i <= 0) ? float(segments[6]) : float(prevSegments[6]);


    prevSegments = segments;

    plots[i]= new Plot(id, pp, isBrake, dd, aa, xx, prevxx, yy, prevyy, zz, prevzz);
  }
}
//draw box
void drawBox() {
  stroke(237, 42, 123);
  strokeWeight(1);
  noFill();
  box(boxSize);
  fill(147, 149, 151);
  pushMatrix();
  translate(0, 0, -boxSize/2);
  rect(-boxSize/2, -boxSize/2, boxSize, boxSize);
  popMatrix();
}

void newStep() {
  if (autoMode == true) {
    stepStarted = true;
    currentVehiclePoint++;
    int i = currentVehiclePoint;

    v = new Vehicle(plots[i+1].xx, plots[i+1].yy, plots[i+1].zz, plots[i].xx, plots[i].yy, plots[i].zz);
  }
}

void manualNewStep() {
  stepStarted = true;
  currentVehiclePoint++;
  int i = currentVehiclePoint;
  v = new Vehicle(plots[i+1].xx, plots[i+1].yy, plots[i+1].zz, plots[i].xx, plots[i].yy, plots[i].zz);
}

