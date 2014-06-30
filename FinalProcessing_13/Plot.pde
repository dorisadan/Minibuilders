
class Plot {
  String id;
  int pp;
  boolean isBrake;
  float dd, aa;
  float yy, xx, zz;
  float prevxx, prevyy, prevzz;


  Plot(String _id, int _pp, boolean _isBrake, float _dd, float _aa, float _xx, float _prevxx, float _yy, float _prevyy, float _zz, float _prevzz) {

    id=_id;
    pp=_pp;
    isBrake=_isBrake;
    dd=_dd;
    aa=_aa;
    xx = _xx;
    prevxx= _prevxx;
    yy = _yy;
    prevyy= _prevyy;
    zz = _zz;
    prevzz= _prevzz;
  }

  void draw(int i, int entries) {


    if (isBrake == true && i > 0 && i+1 < entries) {
      closeShape();
    } 

    if (isBrake == true && i >= 0 && i+1 < entries) {
      startShape();
    } 

    if (path==true) {
      curveVertex(xx, yy, zz);
    } 
    if (pts==true) {
      stroke(0, 173, 239);
      strokeWeight(4);
      point (xx, yy, zz);
    } 


    if (isBrake == true && i+1 >= entries) {
      closeShape();
    }
  }
  void startShape() {
    noFill();
    stroke(255);
    strokeWeight(2);
    beginShape();
    pushMatrix();
    translate(0, 0, 0);
  }
  void closeShape() {
    endShape(); 
    popMatrix();
  }
}

