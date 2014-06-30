// TEST TRACKER FOR JIN
// PID based on sample code by Hazim Bitar/Techbitar and Pololu.com 

// POLULU QTR-8RC + DYNAMIXEL MOTORS



#include <QTRSensors.h>
#include <DynamixelSerial1.h>
#include <StopWatch.h>



StopWatch runTimmer;

#define KP .2//.1 //.2//.4/// experiment to determine this, start by something small that just makes your bot follow the line at a slow speed
#define KD .6//.2 //.4//.8// experiment to determine this, slowly increase the speeds and adjust this value. ( Note: Kp < Kd) 
#define ERRORAG 1200 // error trigger for the AGRESSIVE PID
#define DEFAULT_SPEED    140

#define AGCF 2.0 // AGRESSUIVE PID Ratio
#define M1_ID 10                // Dynamixel ID
#define M2_ID 11                // Dynamixel ID
#define M3_ID 12                     // Dynamixel ID- CNC
#define DEFAULT_Z_SPEED  0.01    // if speed transverse is 100 z speed will be 1
#define DEFAULT_Z_STEP_SPEED  600

#define MIDDLE_SENSOR 3         // sensor in the middle line
#define NUM_SENSORS  5          // number of sensors used
#define TIMEOUT       2500      // waits for 2500 us for sensor outputs to go low
#define EMITTER_PIN   2         // emitter is controlled by digital pin 2
#define DEBUG_DEFAULT 0                 // set to 1 if serial debug output needed
#define DEBUG2 0
#define LED_STATUS_PIN 13                 // set to 1 if serial debug output needed
#define LAPDETECTORS 3                 // set to 1 if serial debug output needed
#define ZSTEPS 40                 // set to 1 if serial debug output needed

#define TIMELAP 92692       // **** TIME IT  TAKES TO DO A LAP IN MILLISECONDS FOR THE FIRST TURN  2 min are 120s this are 120000 milliseconds      

#define STRIPEMID 1700

boolean DEBUG = DEBUG_DEFAULT;

int stripeMPoint = STRIPEMID;

long timer =0;

int zRatio = ZSTEPS;
int traverseSpeed = 0;
boolean isRun = false;
int ledState = LOW;             // ledState used to set the LED
unsigned long previousMillis = 0;        // will store last time LED was updated

float kp = KP;
float kd = KD;
int agTrgg = ERRORAG;

int lastError = 0;
int last_proportional = 0;
int integral = 0;

int markDetectorPrevValue = 0;
unsigned long lapTime = TIMELAP;
unsigned long enlapsedTime = 0;
unsigned long enlapsedLenght = 0;
unsigned long lastEnlapsedLenght = TIMELAP * DEFAULT_SPEED;
unsigned long lapLenght = 0;
unsigned long zStepLenght = (TIMELAP * DEFAULT_SPEED) / ZSTEPS;
int currentLap = 0;
int zStep = 0;

float val = 0.0;

boolean autoZ = false;


QTRSensorsRC qtrrc((unsigned char[]) {
  3, 4, 5, 6, 7, 8, 9, 10}
, //Define the pins for each sensor on the board
NUM_SENSORS, TIMEOUT, EMITTER_PIN); 

unsigned int sensorValues[NUM_SENSORS];

void setup()
{
  startQuickSetup();
}

void loop()
{
  checkCommands();
  run();
}




















