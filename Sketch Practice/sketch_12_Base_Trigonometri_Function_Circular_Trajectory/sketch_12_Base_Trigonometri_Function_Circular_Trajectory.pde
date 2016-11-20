// Canves
float oriX, oriY;

// Circular Trajectory
float r = 300; // the raidus of circular trajectory =  hypotenuse of right triangle
float moveX, moveY;
float moveRaidus = 40;

void setup() {
  size(1280, 720);
  
  oriX = width / 2;
  oriY = height / 2;
}

void draw() {
  translate(oriX, oriY); // need to change the origin each frame, so write here
  
  /* CW */
  // circular trajectory with a ball : Clockwise from x axis(r, 0)
  moveX = r * cos(radians(frameCount)); // cos -> x direction
  moveY = r * sin(radians(frameCount)); // sin -> y direction
  ellipse(moveX, moveY, moveRaidus, moveRaidus);
  // circular trajectory with a ball : CW from -y axis(0, -r)
  moveX = r*0.75 * cos(radians(frameCount)); // equals to sin -> x direction
  moveY = r*0.75 * sin(radians(frameCount)); // equals to -cos -> y direction
  ellipse(moveY, -moveX, moveRaidus, moveRaidus);
  // circular trajectory with a ball : CW from -x axis(-r, 0)
  moveX = r*0.5 * cos(radians(frameCount)); // -cos -> x direction
  moveY = r*0.5 * sin(radians(frameCount)); // -sin -> y direction
  ellipse(-moveX, -moveY, moveRaidus, moveRaidus);
  // circular trajectory with a ball : CW from y axis(0, r)
  moveX = r*0.25 * cos(radians(frameCount)); // equals to -sin -> x direction
  moveY = r*0.25 * sin(radians(frameCount)); // equals to cos -> y direction
  ellipse(-moveY, moveX, moveRaidus, moveRaidus);
  
  /* CCW */
  // circular trajectory with a ball : Counterclockwise from x axis(r, 0)
  moveX = r * cos(radians(frameCount)); // cos -> x direction
  moveY = r * sin(radians(frameCount)); // -sin -> y direction
  ellipse(moveX, -moveY, moveRaidus, moveRaidus);
  // circular trajectory with a ball : CCW from -y axis(0, -r)
  moveX = r*0.75 * cos(radians(frameCount)); // equals to -sin -> x direction
  moveY = r*0.75 * sin(radians(frameCount)); // equals to -cos -> y direction
  ellipse(-moveY, -moveX, moveRaidus, moveRaidus);
  // circular trajectory with a ball : CCW from -x axis(-r, 0)
  moveX = r*0.5 * cos(radians(frameCount)); // -cos -> x direction
  moveY = r*0.5 * sin(radians(frameCount)); // sin -> y direction
  ellipse(-moveX, moveY, moveRaidus, moveRaidus);
  // circular trajectory with a ball : CCW from y axis(0, r)
  moveX = r*0.25 * cos(radians(frameCount)); // equals to sin -> x direction
  moveY = r*0.25 * sin(radians(frameCount)); // equals to cos -> y direction
  ellipse(moveY, moveX, moveRaidus, moveRaidus);
}