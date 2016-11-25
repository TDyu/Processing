ArrayList<Ball> ballList = new ArrayList<Ball>();

void setup() {
  size(1280, 720);
}

void draw() {
  background(148);
  
  for (Ball visit : ballList) {
    visit.updata();
    visit.drawBall();
  }
}

/*
void mousePressed() {
  ballList.add(new Ball());
}
*/

void keyPressed() {
  /*if (key == BACKSPACE || key == DELETE) {
    ballList.remove(0);
  } else if (key == ENTER || key == RETURN) {
    ballList.add(new Ball());
  }*/
  if (key == CODED) {
    if (keyCode == UP) {
      ballList.add(new Ball());
    } else if (keyCode == DOWN) {
      if (ballList.size() > 0) {
        ballList.remove(0);
      }
    }
  }
}