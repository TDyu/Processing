class Ball {
  private PVector position;
  private PVector velocity;
  private final PVector g;
  private float radius;
  private color colorRan;
  
  public Ball() {
    position = new PVector(random(width), height*0.25);
    velocity = new PVector(0, 0);
    g = new PVector(0, 0.5);
    radius = 40;
    colorRan = color(random(255), random(255), random(255));
  }
  
  public void updata() {
    velocity.add(g);
    position.add(velocity);
    
    if (position.y+radius >height) {
      velocity.y *= -1;
      position.y = height - radius;
      colorRan = color(random(255), random(255), random(255));
    }
  }
  
  public void drawBall() {
    fill(colorRan);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
}