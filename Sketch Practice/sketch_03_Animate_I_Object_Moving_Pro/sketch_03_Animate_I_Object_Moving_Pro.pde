// Center
float centerX, centerY; // ordinary
float centerRadius = 100;
float ridusChange = 10;
boolean touch = false;

// Moveing
float moveX, moveY; // ordinary
float speedX, speedY;
float xMax = 10;
float yMax = 10;
float moveRadius = 10;

void setup() {
  size(1280, 720);

  centerX = moveX = width / 2;
  centerY = moveY = height / 2;
  speedX = random(-xMax, xMax);
  speedY = random(-yMax, yMax);
}

void draw() {

  // Bounce Boundary
  if ((moveY-moveRadius/2) < 0 || (moveY+moveRadius/2) > 720) {
    speedY *= -1;
  }
  if ((moveX-moveRadius/2) < 0 || (moveX+moveRadius/2) > 1280) {
    speedX *= -1;
  }

  // Center Area Change
  float distance = sqrt(sq(moveX - centerX) + sq(moveY - centerY)); // the distance between two circle
  if (distance < centerRadius) { // touching
    if (!touch) { // avoide continuously larging when small circle in the center circle
      touch = true;
      centerRadius += ridusChange;
      fill(255, 48);
      ellipse(centerX, centerY, centerRadius*2, centerRadius*2);
    }
  } else {
    touch = false;
  }

  // Moveing
  fill(255);
  ellipse(moveX, moveY, moveRadius*2, moveRadius*2);
  moveX += speedX;
  moveY += speedY;
}