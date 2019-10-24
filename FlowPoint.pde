// FlowPoint.pde
// created by Austin Poor

public class FlowPoint {
  
  PVector pos, vel, accel, prev_pos;
  float maxSpeed, opacity;
  float stroke_width;
  
  FlowPoint(float x, float y) {
    this.pos = new PVector(x,y);
    this.prev_pos = new PVector(x,y);
    this.vel = PVector.fromAngle(radians(random(360)));
    this.accel = new PVector(0,0);
    
    this.maxSpeed = 3;
    this.opacity = 0.01;
    this.stroke_width = 1   ;
  }
  void addForce(PVector addForce) {
    this.accel.add(addForce);
  }
  void update() {
    this.vel.add(this.accel);
    this.vel.limit(this.maxSpeed);
    this.prev_pos = new PVector(this.pos.x, this.pos.y);
    this.pos.add(this.vel);
    this.accel.mult(0);
    this.edges();
  }
  void show() {
    stroke(255, int(255*this.opacity));
    strokeWeight(this.stroke_width);
    //point(this.pos.x, this.pos.y);
    line(this.prev_pos.x, this.prev_pos.y, this.pos.x, this.pos.y);
  }
  void edges() {
    if (this.pos.x < 0) {
      this.pos.x = width;
      this.reset_prev_pos();
    } else if (this.pos.x > width) {
      this.pos.x = 0;
      this.reset_prev_pos();
    }
    if (this.pos.y < 0) {
      this.pos.y = height;
      this.reset_prev_pos();
    } else if (this.pos.y > height) {
      this.pos.y = 0;
      this.reset_prev_pos();
    }
  }
  void reset_prev_pos() {
    this.prev_pos = new PVector(this.pos.x, this.pos.y);
  }
}
