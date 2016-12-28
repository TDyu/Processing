Emitter emitter;

void setup() {
  size(1280, 720);
  noStroke();
  blendMode(ADD);
  
  emitter = new Emitter(width/2, 100);
}

void draw() {
  background(0);
  
  emitter.creat();
  
  if (!emitter.isEmpty()) {
    emitter.update();
  }
}

void mousePressed() {
  emitter.creat();
}