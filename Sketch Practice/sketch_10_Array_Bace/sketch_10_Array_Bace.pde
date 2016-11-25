// Controller
int count = 10;
float xMax = 10;
float yMax = 8;
float radius = 40;
color[] c = {#00a9ff, #c78aea, #4bed40}; // Color Pool : SII, NII, XII ...XD

// Generator
float[] x = new float[count];
float[] y = new float[count];
float[] speedX = new float[count];
float[] speedY = new float[count];

void setup() {
  size(1280, 720);
  
  // initialize array of each circle
  for (int i=0; i<count; i++) {
    x[i] = width / 2;
    y[i] = height / 2;
    speedX[i] = random(-xMax, xMax);
    speedY[i] = random(-yMax, yMax);
  }
}

void draw() {
  for (int i=0; i<count; i++) {
    // each Bounce Boundary
    if ((x[i]-radius/2) < 0 || (x[i]+radius/2) > width){
      speedX[i] *= -1;
    }
    if ((y[i]-radius/2) < 0 || (y[i]+radius/2) > height){
      speedY[i] *= -1;
    }
    
    // each move
    x[i] += speedX[i];
    y[i] += speedY[i];
    
    // each draw
    int rand = (int)random(0, 3);
    fill(c[rand]);
    ellipse(x[i], y[i], radius, radius);
  }
}