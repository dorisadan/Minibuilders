

class Vehicle {
  PVector location;
  PVector origin;
  PVector target;
  PVector velocity;
  PVector acceleration;
  float r;            // maximum speed mapped in the radius according to location
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  public float d;
  float dMin = 0.01;

  Vehicle(float x, float y, float z, float prevx, float prevy, float prevz) {
    acceleration = new PVector(0, 0, 0);
    velocity = new PVector(0, 0, 0);
    origin = new PVector(prevx, prevy, prevz);
    location = new PVector(prevx, prevy, prevz);
    target = new PVector(x, y, z);
    r = 6;
    d = 0;
    maxspeed = 10;
    maxforce = 0.1;
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  boolean arrive() {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target

    //float d = desired.mag();
    d = desired.mag();


    if (d <= dMin) {
      return false;
    } 

    //Text

    // Normalize desired and scale with arbitrary damping within 100 pixels
    desired.normalize();
    if (d < 100) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.mult(m);
    } 
    else {
      desired.mult(maxspeed);
    }

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);

    update();
    //motor();
//    debugDisplay();

    return true;
  }


  void motor() {
    //    println(location.x + " " + location.y + " " + location.z);
    textMode(SCREEN);
    textSize(12);
    text("Steps"+"  "+int(d), 10, 50);
    textMode(SCREEN);
    text("Point"+"  "+ currentVehiclePoint, 10, 30);
  }

  void displayOrigin() {
    stroke(255, 0, 0);
    strokeWeight(1);
    pushMatrix();
    translate(origin.x, origin.y, origin.z);
    sphere(3);
    popMatrix();
  }

  void displayTarget() {
    stroke(42, 237, 123);
    strokeWeight(1);
    pushMatrix();
    translate(target.x, target.y, target.z);
    sphere(3);
    popMatrix();
  }

  void display() {

    stroke(255);
    strokeWeight(1);
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(3);
    popMatrix();
  }
}

