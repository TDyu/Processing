// Controller
int countRow = 20;
int countCol = 10;
float rectW = 20; // width of each rectangle

void setup() {
  size(1280, 720);
  rectMode(CENTER);
}

void draw() {
  background(200);
  
  for (int i=0; i<countRow; i++) {
    for (int j=0; j<countCol; j++) {
      // retric each rectangle
      pushMatrix();
      float x = i*width / (countRow - 1);
      float y = j*height / (countCol - 1);
      translate(x, y);
      rotate(radians(10*i + 3*j + frameCount));
      rect(0, 0, rectW*2, rectW*2);
      popMatrix();
    }
  }
}