// Controller
int count = 100;

void setup() {
  size(1280, 720);
}

void draw() {
  background(200);

  for (int i=0; i<count; i++) {
    // circle ordinary part
    float x = i*width / (count -1);
    float y = 700 - (abs(count/2 - i) * 5);

    // line part
    float differX = mouseX - x; // difference between mouse and circle center
    float differY = mouseY - y;
    float dist = sqrt(sq(differX) + sq(differY)); // distance from mouce to circle center
    float s = map(dist, 500, 1200, 0.5, 1); // mapping value from domain 500~1200 to codomain 0.1~1 => Shrinkage
    differX *= s; // less to keep space
    differY *= s;
    line(x + differX, y + differY, x, y);

    // draw circle
    ellipse(x, y, 40, 40);
  }
}