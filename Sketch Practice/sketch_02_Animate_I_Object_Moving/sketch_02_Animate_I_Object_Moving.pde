float x, y; // center cordinate
float speedX, speedY; // moving chang value (direction & speed)((the angle of Bounce please culculate the speedX & speedY

//Controller
float xMax = 10; // x change value range
float yMax = 8; // y change value range
float raidus = 40;

void setup(){ // initialize
  size(1280, 720); // (width, height)
  
  x = width / 2;  // from the window center
  y = height / 2; // from the window center
  speedX = random(-xMax, xMax);
  speedY = random(-yMax, yMax);
}

void draw(){ // change per fram
  ellipse(x, y, raidus, raidus); // circle (x, y, width, height)
 
  // Bounce Boundary of Circumference ((not center
  if((y-raidus/2) < 0 || (y+raidus/2) > height){
    speedY *= -1;
  }
  if((x-raidus/2) < 0 || (x+raidus/2) > width){
    speedX *= -1;
  }
  
  x += speedX; // move x
  y += speedY; // move y
}