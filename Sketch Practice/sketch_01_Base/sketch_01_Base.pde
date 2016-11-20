float a;

void setup(){
  size(1280, 720);
  background(#6fdfff);
  
  fill(#00a9ff);
  stroke(#000000);
  strokeWeight(5);
  ellipse(100, 100, 200, 200);
  
  fill(#c78aea);
  stroke(#000000);
  strokeWeight(5);
  rect(500, 100, 300, 300);
  rectMode(CENTER);
  rect(100, 500, 100, 100, 20, 30, 40, 50);
  
  a = 0;
}

void draw(){
  background(#ffdb49);
  println(frameCount);
  println(frameRate);
  if(a > 200)  setup();
  a++;
   println(a);
}