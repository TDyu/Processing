class Emitter {
  private PVector position;
  private ArrayList<Particle> list;
  private final int countMax;
  
  public Emitter(float x, float y) {
    this.position = new PVector(x, y);
    this.list = new ArrayList<Particle>();
    this.countMax = 300;
  }
  
  public void creat() {
    if (this.list.size() < this.countMax) {
      for (int i=0; i<10; i++) {
        this.list.add(new Particle(this.position));
      }
    }
  }
  
  public void update() {
    this.position = new PVector(mouseX, mouseY);
    
    for (int i=0; i<this.list.size(); i++) {
      this.list.get(i).update();
      this.list.get(i).edgeDetect();
      
      // Draw Line
      if (i > 0) { // avoid [-1]
        PVector lastPos = this.list.get(i-1).getPos();
        this.list.get(i).drawLine(lastPos);
      }
      
      // Should Be Last
      if (this.list.get(i).isDead()) {
        this.list.remove(i);
      }
    }
  }
  
  public boolean isEmpty() {
    return this.list.size() == 0;
  }
}