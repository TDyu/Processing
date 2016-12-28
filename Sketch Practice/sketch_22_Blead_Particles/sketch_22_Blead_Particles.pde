Emitter emitter;

void setup() {
  size(1280, 720);
  noStroke();
  blendMode(ADD); // additive blending with white clip: C = min(A*factor + B, 255)
  
  emitter = new Emitter(width/2, 100);
}

void draw() {
  background(0);
  
  emitter.creat();
  
  if (emitter.getSize() > 0) {
    emitter.update();
  }
}

void mousePressed() {
  emitter.creat();
}