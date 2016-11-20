/* By Canves origin */
// Translate Controller
float canvesX, canvesY;
  // there is no speed cause just scale & rotation

// Scale Controller
float currentScale = 2;
float scaleV = 0.01; // scale velocity
float threshold = 2; // let from upper limit to change with equals to currentScale
boolean state = false; // true for +, false for - // let from - to inside

// Four Rectangle
float rectangleX, rectangleY; // all oridinate from same
float size = 200;
color uL, uR, lL, lR;

void setup() {
  size(1280, 720);
  rectMode(CENTER);
  
  // move origin to center of window
  canvesX = width / 2;
  canvesY = height / 2;
  
  // rectagle initialize
  rectangleX = width / 2; // let it look like moving with ordinary equals to origin that is translating
  rectangleY = height / 2;
  strokeWeight(1.5);
  
  // color change initialize
  uL = color((int)random(255), (int)random(255), (int)random(255)); 
  uR = color((int)random(255), (int)random(255), (int)random(255));
  lL = color((int)random(255), (int)random(255), (int)random(255));
  lR = color((int)random(255), (int)random(255), (int)random(255));
}

void draw() {
  translate(canvesX, canvesY);
  rotate(radians(frameCount));

  // Scale
  if (state) { // +
    if (currentScale > threshold) { // over the upper limit
      state = false;
    } else {
      currentScale += scaleV;
    }
  } else { // -
    if (currentScale < -threshold) { // over the lower limit
      state = true;
    } else {
      currentScale -= scaleV;
    }
  }
  scale(currentScale);

  // Color Cahnge
  if (frameCount % 10 == 0) { // changer each 10 frame
    uL = color((int)random(255), (int)random(255), (int)random(255));
    uR = color((int)random(255), (int)random(255), (int)random(255));
    lL = color((int)random(255), (int)random(255), (int)random(255));
    lR = color((int)random(255), (int)random(255), (int)random(255));
    
    // Draw Four Rectangles different with +/- relative position
    fill(uL, 150);
    rect(-rectangleX, -rectangleY, size, size);
    fill(uR, 150);
    rect(rectangleX, -rectangleY, size, size);
    fill(lL, 150);
    rect(-rectangleX, rectangleY, size, size);
    fill(lR, 150);
    rect(rectangleX, rectangleY, size, size);
  } else {
    // Draw Four Rectangles
    fill(uL, 150);
    rect(-rectangleX, -rectangleY, size, size);
    fill(uR, 150);
    rect(rectangleX, -rectangleY, size, size);
    fill(lL, 150);
    rect(-rectangleX, rectangleY, size, size);
    fill(lR, 150);
    rect(rectangleX, rectangleY, size, size);
  }
}