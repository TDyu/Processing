class Particle {
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private final float speedMax;
  private float lifeSpan; // life time
  private final float radius;
  
  public Particle(PVector position) {
    this.position = position.copy(); // must use copy()
    this.velocity = new PVector(0 ,0);
    this.speedMax = 0.1;
    this.acceleration = new PVector(random(-speedMax, speedMax), random(0.5));
    this.lifeSpan = random(15, 100);
    this.radius = 10;
  }
  
  public void update() {
    this.velocity.add(this.acceleration);
    this.velocity.mult(0.95);
    this.position.add(this.velocity);
  }
  
  public boolean isDead() {
    this.lifeSpan -= 1;
    
    if (this.lifeSpan <= 0) {
      return true;
    } else {
      return false;
    }
  }
  
  public void edgeDetect() {
    if (this.position.x > width || this.position.x < 0) {
      this.velocity.x *= -1; // Bounce
      this.acceleration.x *= -1;
    }
    if (this.position.y > height || this.position.y < 0) {
      this.velocity.y *= -1; // Bounce
      this.acceleration.y *= -1;
    }
  }
  
  public void display() {
    fill(80);
    ellipse(this.position.x, this.position.y, this.radius*2, this.radius*2);
  }
}