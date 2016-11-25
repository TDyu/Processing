// Moving Ball
PVector ballPos; // ball position
float radius = 60;

// Targit
int targitNumber = 10;
PVector[] targitPos= new PVector[targitNumber];
PVector targitNowPos;
int targitCount = 0;

void targitDisplay() {
  for (int i=0; i<targitNumber; i++) {
    textSize(32);
    text(i+1, targitPos[i].x, targitPos[i].y);
  }
}

void setup() {
  size(1280, 720);
  
  // Ball
  ballPos = new PVector(width/2, height/2);
  
  // Targit
  for (int i=0; i<targitNumber; i++) {
    targitPos[i] = new PVector(random(width), random(height));
  }
  targitNowPos = targitPos[0].copy(); // use copy() to avoid that targitNowPos is modified with targit[targitCount] also is modified 
}

void draw() {
  //background(148);
  
  // Targit Deploy
  targitDisplay();
  
  // Move
  PVector displacement = PVector.sub(targitNowPos, ballPos); // displacement -> directed distance : the latter - the former
  displacement.mult(0.05); // slower
  ballPos.add(displacement);
  
  // Prepare Next
  if (PVector.dist(ballPos, targitNowPos) < 1 && targitCount < targitNumber-1) { // cannot == 0 cause " displacement.mult(0.05)" let it must not arrive the targit
    targitCount++;
    targitNowPos = targitPos[targitCount].copy();
  }
  
  // draw Ball
  ellipse(ballPos.x, ballPos.y, radius, radius);
}