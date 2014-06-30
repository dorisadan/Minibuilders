/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float v_push1 = 0.0f;
float v_push2 = 0.0f;
float v_push3 = 0.0f;
float v_push4 = 0.0f;
float v_push5 = 0.0f;
float v_push6 = 0.0f;
float v_push7 = 0.0f;
float v_push8 = 0.0f;
float v_push9 = 0.0f;
float v_push10 = 0.0f;
float v_push11 = 0.0f;
float v_push12 = 0.0f;
float v_toggle1 = 0.0f;
float v_toggle2 = 0.0f;
float v_toggle3 = 0.0f;
float v_toggle4 = 0.0f;
public float v_fader1 = 1.0f;
public float v_fader2 = 1.0f;
public float v_fader3 = 1.0f;
public float v_fader4 = 1.0f;


//public float xxx = 0;

void OscSetup() {
  //size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 8000);

  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("192.168.1.12", 8000);
}


void OscDraw() {
}


void oscEvent(OscMessage theOscMessage) {

  String addr = theOscMessage.addrPattern();
  float  val  = theOscMessage.get(0).floatValue();

  if (addr.equals("/1/push1")) { 
    v_push1 = val;
    triggerA();
  }

  else if (addr.equals("/1/push2")) { 
    v_push2 = val;
    triggerB();
  }
  else if (addr.equals("/1/push3")) { 
    v_push3 = val;
    triggerE();
  }
  else if (addr.equals("/1/push4")) { 
    v_push4 = val;
    triggerF();
  }
  else if (addr.equals("/1/toggle1")) { 
    v_toggle1 = val;
    path=true;
  }
  else if (addr.equals("/1/toggle2")) {     
    v_toggle2 = val;
    pts=true;
  }
  else if (addr.equals("/1/toggle3")) {     //changt to button
    v_push7 = val;
    // autoMode();
  }
  else if (addr.equals("/1/toggle4")) {     //changt to button
    v_push8 = val;
    // manualNewStep();
  }
  else if (addr.equals("/2/push5")) { 
    v_push5 = val;
    triggerI();
  }
  else if (addr.equals("/2/push6")) { 
    v_push6 = val;
    triggerJ();
  }
  else if (addr.equals("/2/push7")) { 
    v_push9 = val;
    triggerL();
  }
  else if (addr.equals("/2/push8")) { 
    v_push10 = val;
    triggerM();
  }
  //    else if (addr.equals("/2/push1")) { 
  //    v_push11 = val;
  //    triggerN();
  //  }  
  else if (addr.equals("/2/fader3")) { 
    v_fader2 = val;
    motorMoveDirectionSpeedJin();
  }
  else if (addr.equals("/2/fader1")) {
    v_fader3 = val;
    motorMoveDirectionSteerJin();
  }

  else if (addr.equals("/3/fader6")) { 
    v_fader1 = val;
    motorMoveDirectionSpeed();
  }
  else if (addr.equals("/3/fader8")) { 
    v_fader4 = val;
    // motorMoveDirectionSteer();
  }
}

