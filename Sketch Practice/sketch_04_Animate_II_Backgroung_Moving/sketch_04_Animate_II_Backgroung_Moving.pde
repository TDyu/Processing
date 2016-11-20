/* By Canves origin */
// Translate Controller
float x, y; // origin ordinary // cannot set the value in here cause it must be fixed, so should set it in setup
float speedX = random(-5, 5);
float speedY = random(-5, 5);

// Scale Controller
float currentScale = 1;
float scaleV = 0.1; // scale velocity
float threshold = 1.2; // limit
boolean state = true; // true for +, false for -

void setup() {
  size(1280, 720);
  rectMode(CENTER); // use rectagle center to be rectangle ordinary (( defalt is upper left corner

  x = width / 2;
  y = height / 2;
  translate(x, y); // move origin to screen window center
}

void draw() {
  // Must be change canves first, or would be fixed in upper left cornor
  translate(x, y);
  rotate(radians(frameCount));
  x += speedX;
  y += speedY;

  // Scale
  if (state) { // true for +
    if (currentScale > threshold) { // over the upper limit
      state = false; // change to -
    } else {
      currentScale += scaleV; // keep +
    }
  } else { // false for -
    if (currentScale < -threshold) { // over the lower limit
      state = true; // change to +
    } else {
      currentScale -= scaleV; // keep -
    }
  }
  scale(currentScale);

  rect(0, 0, 150, 150);
  // for effect??so controll again
  translate(x, y);
  rotate(radians(frameCount));

  if (x < 0 || x > width) {
    speedX *= -1;
  }
  if (y < 0 || y > height) {
    speedY *= -1;
  }
}