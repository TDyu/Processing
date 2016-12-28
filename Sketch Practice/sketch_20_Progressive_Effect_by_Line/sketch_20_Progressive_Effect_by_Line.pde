// Image
PImage pic;

/* Line Effect Generator */
// Controller
int painterCount = 10000; // use how much line. to much to quickly full.
float speedMax = 1; // to much to quickly full, but easily lose control(too much).
// Generator
PVector[] painter = new PVector[painterCount]; // each line start position
PVector[] velocity = new PVector[painterCount];
color[] originColor = new color[painterCount];
float speed;

void setup() {
  //size(1891, 617); //Hahow Banner
  //size(1000, 964); //Hahow Logo
  size(897, 806); //Processing
  background(255);
  strokeWeight(0.8);
  noStroke();

  // Load Image
  //pic = loadImage("Hahow.jpg");  //Hahow Banner
  //pic = loadImage("Hahow Logo.png"); //Hahow Logo
  pic = loadImage("Processing.jpg"); //Processing

  // Line
  for (int i=0; i<painterCount; i++) {
    painter[i] = new PVector(random(width), random(height));
    speed = random(-speedMax, speedMax);
    velocity[i] = new PVector(-speed, speed);
    originColor[i] = pic.get((int)painter[i].x, (int)painter[i].y);
  }
}

void draw() {
  //background(0);
  //image(pic, 0, 0);

  // Line
  if (frameCount < 50) { // set stop condition
    for (int i=0; i<painterCount; i++) {
      // Go Stright to draw line
      PVector lastPos = new PVector(painter[i].x, painter[i].y);
      lastPos.add(velocity[i]);

      // Color change processing
      color currentColor = pic.get((int)lastPos.x, (int)lastPos.y);
      float originColorSum = red(originColor[i]) + green(originColor[i]) + blue(originColor[i]);
      float currentColorSum = red(currentColor) + green(currentColor) + blue(currentColor);
      float bright = (0.3 * red(currentColor) / 255) + (0.6 * green(currentColor) / 255) + (0.1 * blue(currentColor) / 255);

      if (abs(originColorSum - currentColorSum) > 50) { // If the color difference is too much, it means that line direction should be changed. (Then the color change with line position.)
        speed = random(-speedMax, speedMax);
        velocity[i] = new PVector(random(-speedMax, speedMax), random(-speedMax, speedMax));
      } else { // draw line
        strokeWeight(map(bright, 0, 1.5, 1.8, 0.1));
        fill(currentColor);
        stroke(currentColor);

        if (bright < 1) { // if the position exposure (be white), then it did not to draw line.
          line (lastPos.x, lastPos.y, painter[i].x, painter[i].y); // from last position to now position
        }

        painter[i] = lastPos; // now position is the last position of next range.
      }

      // Boundary
      if (painter[i].x > width) {
        painter[i].x = 0;
      } else if (painter[i].x < 0) {
        painter[i].x = width;
      } else if (painter[i].y > height) {
        painter[i].y = 0;
      } else if (painter[i].y < 0) {
        painter[i].y = height;
      }
    }
  }
}

void mousePressed() {
  saveFrame("rendering/rendering####.jpg");
}