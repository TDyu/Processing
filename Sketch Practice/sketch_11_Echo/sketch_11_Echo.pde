// Ball
float x, y;
float speedX, speedY;
float xMax = 10;
float yMax = 8;
float raidus = 100;

// Echo
int numberOfEcho = 10;
int echoTime = 5; // here bace on frame so integer
int pathTotal = numberOfEcho * echoTime;
float[] echoX = new float[pathTotal];
float[] echoY = new float[pathTotal];

void setup() {
  size(1280, 720);
  noStroke(); // let echo look more natural
  
  // initialize ball
  x = width / 2;
  y = height / 2;
  speedX = random(-xMax, xMax);
  speedY = random(-yMax, yMax);
  
  // initialize echo : from same position with ball
  for (int i=0; i<pathTotal; i++) {
    echoX[i] = x;
    echoY[i] = y;
  }
}

void draw() {
  background(0); // let be look obvious when test
  
  // Echo : Since th echo is set to follow the ball, it drqw before ball
  if (frameCount <= (pathTotal + 1)) { // First Data Storing : not yet reached the next echo change time (pathTotal+1 : echo path + ball)
    for (int i=frameCount-2; i>=0; i--) { // move data has to from last (frameCount-2 : ball & index from 0)
      if (i == 0) { // this frame is for ball
        echoX[i] = x;
        echoY[i] = y;
        // nor need to draw
      } else { // draw echo
        echoX[i] = echoX[i-1];
        echoY[i] = echoY[i-1];
        if (i % echoTime == echoTime-1) { // let echo show each echoTime last = echoTime-1 : first two space then a echo
          fill(255, 255-i*(255/pathTotal)); // linearly change opacity
          ellipse(echoX[i], echoY[i], raidus, raidus);
        }
      }
    }
  } else { // need to update the echo and donot care the objet ball
    for (int i=pathTotal - 1; i>=0; i--) { // update moving from last (-1 : index from 0)
      if (i == 0) {
        echoX[i] = x;
        echoY[i] = y;
        // nor need to draw
      } else {
        echoX[i] = echoX[i-1];
        echoY[i] = echoY[i-1];
        if (i % echoTime == echoTime-1) { 
          fill(255, 255-i*(255/pathTotal));
          ellipse(echoX[i], echoY[i], raidus, raidus);
        }
      }
    }
  }
  
  // Ball
  if ((x - raidus/2) < 0 || (x + raidus/2) > width) { // Bounce Boundary
    speedX *= -1;
  }
  if ((y - raidus/2) < 0 || (y + raidus/2) > height) {
    speedY *= -1;
  }
  x += speedX; // move
  y += speedY;
  fill(255);
  ellipse(x, y, raidus, raidus);
}