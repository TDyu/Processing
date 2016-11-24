PVector position;
PVector velocity;
//PVector acceleration;
PVector g = new PVector(0, 1); // gravity just have vertical direction
float raidus = 60;

void setup() {
  size(1280, 720);
  
  position = new PVector(width/2, 100);
  velocity = new PVector(0, 0); // v0 = 0
  //acceleration = new PVector(0, 0);
}

void draw() {
  background(148);
  
  velocity.add(g); // V = v0 + at.  t : frame
  position.add(velocity); // X = x0 + vt.
  //acceleration.mult(0); // = no acceleration.
  
  // Bouncing : just deal with vertical direction cause of gravity
  if (position.y+raidus > height || position.y-raidus < 0) { // Boundary
    velocity.y *= -0.9; // Bouncing degree
    position.y = height - raidus; // limit lower position
  }
  
  ellipse(position.x, position.y, raidus*2, raidus*2);
}