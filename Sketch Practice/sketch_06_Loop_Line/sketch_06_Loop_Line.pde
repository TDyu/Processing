// Controller
int count = 25;

void setup() {
  size(1280, 720);
}

void draw() {
  background(200);

  // many same graphics draw at one frame by loop
  for (int i=0; i<count; i++) {
    // circle ordinary part (( cause line need it to calculate distance so set here but citcle should draw after(under) the lines
    float x = i*width / (count - 1); // claim in here to new many same // calculate please see the note
    float y = 700 - (abs(count / 2 - i) * 10);
    
    // line part
    float differX = mouseX - x; // difference X
    float differY = mouseY - y;
    differX *= 0.8; // let it keep some space between mouse and line
    differY *= 0.8;
    line(x + differX, y + differY, x, y);
    
    // circle draw
    ellipse(x, y, 40, 40);
  }
}