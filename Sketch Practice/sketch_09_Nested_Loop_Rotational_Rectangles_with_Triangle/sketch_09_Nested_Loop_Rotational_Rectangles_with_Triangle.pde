// Controller
int countRow = 20; // * try more different sount can find interesting thing
int countCol = 10;
float rectW = 20; // 80 is interesting

void setup() {
  size(1280,720);
  rectMode(CENTER);
}

void draw() {
  background(200);
  
  for (int i=0; i<countRow; i++) {
    for (int j=0; j<countCol; j++) {
      /* retric each rectangle with a triangle */
      pushMatrix();
      // each origin control
      float x = i*width / (countRow - 1);
      float y = j*height / (countCol - 1);
      translate(x, y);
      rotate(radians(10*i + 3*j + frameCount));
      
      // draw triangle
      fill(#ff0000); // red
      noStroke();
      triangle(0, -1.8*rectW, rectW*0.3, -rectW-5, -rectW*0.3, -rectW-5);
      
      // draw rectangle
      fill(255);
      stroke(0);
      rect(0, 0, rectW*2, rectW*2);
      popMatrix();
    }
  }
  /*frameRate(150);
  println(frameRate);*/
}