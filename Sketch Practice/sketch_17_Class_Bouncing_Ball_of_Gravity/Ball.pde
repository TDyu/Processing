class Ball{
  private PVector position;
  private PVector velocity;
  private final PVector g;
  private float radius;
  private color colorRan;
  
  public Ball() {
    this.position = new PVector(width/2, height*0.25);
    this.velocity = new PVector(0, 0);
    this.g = new PVector(0, 1);
    this.radius = 60;
    this.colorRan = color(random(255), random(255), random(255));
  }
  
  public void drawBall() {
    fill(colorRan);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  public void update() {
    velocity.add(g);
    position.add(velocity);
    
    if (position.y-radius < 0 || position.y+radius > height) {
      velocity.y *= -1;
      position.y = height - radius;
      colorRan = color(random(255), random(255), random(255));
    }
  }
}