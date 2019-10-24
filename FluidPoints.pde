// FluidPoints.pde
// created by Austin Poor

FlowPoint[] flowpoints;

int n_particles = 1000;
float noise_scale = 0.01;
float time_scale = 1;
float time_delta = 0;
float time_jump = 10;


int file_n = 0;

void setup() {
  size(1280, 720);
  background(50);
  flowpoints = new FlowPoint[n_particles];
  for (int i = 0; i < n_particles; i++) {
    flowpoints[i] = new FlowPoint(random(width), random(height));
  }
}

void draw() {
  for (FlowPoint p : flowpoints) {
    PVector force = PVector.fromAngle(
      radians(360 * 
      noise(
        p.pos.x*noise_scale, 
        p.pos.y*noise_scale, 
        frameCount*time_scale + time_delta
        )
      )
      );
    p.addForce(force);
    p.update();
    p.show();
  }
}

void keyReleased() {
  if (key == 's') {
    save(file_n + ".png");
    println("Saving image: " + file_n + ".png");
    file_n++;
  } else if (key == 'r') {
    background(50);
    time_delta += time_jump;
    println("Resetting points.");
    for (int i = 0; i < n_particles; i++) {
      flowpoints[i] = new FlowPoint(random(width), random(height));
    }
  }
}
