class Blob {
  PVector pos, vel;
  float r;


  Blob(float x, float y) {
    pos = new PVector (x, y);
    r = 70;
    vel = PVector.random2D();
    vel.mult(random(2, 5));
    r = random(200, 400);
  }
  void update() {
    pos.add(vel);
    if (pos.x>width || pos.x<0) {
      vel.x*= -1;
    }
    if (pos.y>height || pos.y<0) {
      vel.y*= -1;
    }
  }
  void show() {
    noFill();
    stroke(0);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}