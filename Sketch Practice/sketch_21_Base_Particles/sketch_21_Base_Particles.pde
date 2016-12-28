Emitter emitter;

void setup() {
  size(1280, 720);
  
  emitter = new Emitter(width/2, 100);
}

void draw() {
  background(148);
  
  emitter.generate();
  
  if (emitter.list.size() > 0) { // Make sure there is something
    emitter.update();
  }
}

void mousePressed() {
  emitter.generate();
}