class Emitter {
  private PVector position;
  private ArrayList<Particle> list;

  public Emitter(float x, float y) {
    this.position = new PVector(x, y);
    this.list = new ArrayList<Particle>();
  }

  public void generate() {
    for (int i=0; i<10; i++) { // add 10 particles at each frame.
      this.list.add(new Particle(position));
    }
  }

  public void update() {
    this.position = new PVector(mouseX, mouseY);

    for (int i=0; i<this.list.size(); i++) { // each particle move
      this.list.get(i).update();
      this.list.get(i).display();
      
      if (this.list.get(i).isDead()) { // Should Be Last
        this.list.remove(i);
      }
    }
  }
}