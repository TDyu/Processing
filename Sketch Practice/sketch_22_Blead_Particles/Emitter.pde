class Emitter {
  private PVector position;
  private ArrayList<Particle> list;
  private final int countMax;
  
  public Emitter(float x, float y) {
    this.position = new PVector(x, y);
    this.list = new ArrayList<Particle>();
    this.countMax = 3000;
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
      this.list.get(i).display();
      
      if (this.list.get(i).isDead()) { // Should Be Last
        this.list.remove(i);
      }
    }
  }
  
  public int getSize() {
    return this.list.size();
  }
}