Ball ball;

void setup() {
  size(1280, 720);
  
  ball = new Ball();
}

void draw() {
  background(148);
  
  ball.update();
  ball.drawBall();
}