// Attractor
PVector attractor;
float radiusAttrac = 80;
float amplitude = 200;
float timer = 0;

// Tractor
PVector position;
PVector velocity;
PVector acceleration;
float radius = 40;
float rangeY;

void setup() {
  size(1280,720);
  
  attractor = new PVector(0, 0);
  
  rangeY = height/2 * 0.5;
  position = new PVector(width/2, rangeY);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
}

void draw() {
  background(148);
  
  /* Tractor */
  // Bounce
  if (position.x - radius < 0 || position.x + radius > width) {
    velocity.x *= -1;
  }
  if (position.y - radius < 0 || position.y + radius > height) {
    velocity.y *= -1;
  }
  // Tracting
  acceleration = PVector.sub(attractor, position);
  acceleration.mult(0.005);
  velocity.add(acceleration);
  velocity.x *= 0.98; // just x cause attractor just change x direction
  position.add(velocity);
  // draw
  ellipse(position.x, position.y, radius, radius);
  
  /* Attractor */
  // move just change x
  attractor.x = width/2 + amplitude*cos(radians(timer)); // cos : from +amplitude, sin : from 0
  attractor.y = height/2;
  timer += 5; // make time difference
  // draw line
  noFill();
  line(width/2-amplitude, height/2, width/2+amplitude, height/2);
  // draw ball
  fill(255);
  ellipse(attractor.x, attractor.y, radiusAttrac, radiusAttrac);
}