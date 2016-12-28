class Particle {
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float lifeSpan; // Life Time
  private final float radius; // Display
  
  public Particle(PVector position) {
    this.position = position.copy(); // use copy to avoid rewrite.
    this.velocity = new PVector(random(-10, 10), 0); // only x direction move
    this.acceleration = new PVector(0, 1);
    this.lifeSpan = 60;
    this.radius = 10;
  }
  
  public void update() {
    this.velocity.add(acceleration);
    this.position.add(velocity);
  }
  
  public boolean isDead() {
    this.lifeSpan -= 1;
    
    if (this.lifeSpan <= 0) {
      return true;
    } else {
      return false;
    }
  }
  
  public void display() {
    ellipse(this.position.x, this.position.y, radius*2, radius*2);
  }
}