//Attractor (Ball by mouse) ((Tracted
PVector attractor;
float raidusAttra = 80;

//Attracted (small ball) ((Tractor
PVector position;
PVector velocity;
PVector acceleration;
float raidus = 40;

void setup() {
  size(1280, 720);
  
  attractor = new PVector(0, 0); // Ball by mouse position at first
  
  position = new PVector(width/2, height/2); // Tractor
  velocity = new PVector(0, 0); // v0 = 0
  acceleration = new PVector(0, 0); // a0 = 0
}

void draw() {
  background(148);
  
  /* Tractor (small ball) */
  // Bounce
  if (position.x - raidus < 0 || position.x + raidus > width) {
    velocity.x *= -1;
  }
  if (position.y - raidus < 0 || position.y + raidus > height) {
    velocity.y *= -1;
  }
  // Tracting
  acceleration = PVector.sub(attractor, position); // Distance as a
  acceleration.mult(0.005); // let it just move (be attacted) a little // if 1 -> run to attractor center
  velocity.add(acceleration);
  velocity.mult(0.98); // slower
  position.add(velocity);
  //draw
  ellipse(position.x, position.y, raidus, raidus);
  
  /* Attractor */
  // set ordinary
  attractor.x = mouseX;
  attractor.y = mouseY;
  //draw
  fill(255);
  ellipse(attractor.x, attractor.y, raidusAttra, raidusAttra);
}