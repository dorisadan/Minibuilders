import java.awt.event.KeyEvent; // D
import javax.swing.JOptionPane; // D

String portname = null;

int lf = 10;    // Linefeed in ASCII
String myString = null;

//String[] debugQueue = new String;


void openSerialPort()
{
  if (portname == null) return;
  if (myPort != null) myPort.stop();

  myPort = new Serial(this, portname, 9600);

  myPort.clear();
  myString = myPort.readStringUntil(lf);
  myString = null;
}

void selectSerialPort()
{
  String result = (String) JOptionPane.showInputDialog(this, 
  "Select the serial port that corresponds to your Arduino board.", 
  "Select serial port", 
  JOptionPane.PLAIN_MESSAGE, 
  null, 
  Serial.list(), 
  0);

  if (result != null) {
    portname = result;
    openSerialPort();
  }

  //  myPort.bufferUntil(lf);
}

void checkSerial() {
  while (myPort.available () > 0) {
    myString = myPort.readStringUntil(lf);
    if (myString != null) {
      println(myString);
    }
  }
}


//void queueDebug(String message) {
//  debugQueue = append(message);
//}

//void debugDisplay() {
//  if (debugQueue.length > 5) debugQueue = subset(debugQueue, 0); 
//  for (int i = 0; i < debugQueue.length; i++) {
//
//    textMode(SCREEN);
//    textSize(12);
//    text(debugQueue[i]);
//
//    //
//  }
//}                                                                                                                                                                                                                 

