// General Controller
color colorPool[] = {#00a9ff, #c78aea, #4bed40, #6fdfff};

/* Wava Line */
int pathCount = 360;
// with Left Ball
float[] lineXL = new float[pathCount];
float[] lineYL = new float[pathCount];
float amplitudeL = 100; // + first wave down, - first wave up
float freqMagL = 7; // frequency magnication 
// with Right Ball
float[] lineXR = new float[pathCount];
float[] lineYR = new float[pathCount];
float amplitudeR = -50;
float freqMagR = 5;
// with Up ball
float[] lineXU = new float[pathCount];
float[] lineYU = new float[pathCount];
float amplitudeU = 50; // + first wave right, - first wave left
float freqMagU = 3;
// with Down ball
float[] lineXD = new float[pathCount];
float[] lineYD = new float[pathCount];
float amplitudeD = -100;
float freqMagD = 10;

/* Ball */
float radius = 40;
// Left Ball
float xL;
float firstYL, yL;
// Right Ball
float xR;
float firstYR, yR;
// Up Ball
float firstXU, xU;
float yU;
// Down Ball
float firstXD, xD;
float yD;

void setup() {
  size(1280, 720);

  // line base control
  strokeWeight(1.5);
  smooth();

  // initialize ball ordinary
  xL = width / 8;
  xR = width - xL;
  firstYL = yL = firstYR = yR = height / 2;
  yU = height / 8;
  yD = height - yU;
  firstXU = xU = firstXD = xD = width / 2;

  // initialize line 
  for (int i=0; i<pathCount; i++) {
    // with left : +x direction
    float addRateXL = (width-xL)*i / pathCount; // divide width to each line(i/pathCount) except the part before no line : first large the (width-x) then divide pathCount space
    lineXL[i] = xL + addRateXL;
    lineYL[i] = firstYL;
    // with right : -x direction
    float addRateXR = xR*i / pathCount;
    lineXR[i] = xR - addRateXR;
    lineYR[i] = firstYR;
    // with up : +y direction
    float addRateYU = (height-yU)*i / pathCount;
    lineXU[i] = firstXU;
    lineYU[i] = yU + addRateYU;
    // with down : -y direction
    float addRateYD = yD*i / pathCount;
    lineXD[i] = firstXD;
    lineYD[i] = yD - addRateYD;
  }
}

void draw() {
  background(150); // let ball trajectory be not obvious

  // Wave Line with Left Ball: just need to change the y direction follow the ball (( the follow wave like echo, so draw before ball
  for (int i=pathCount-1; i>=0; i--) { // move data from last
    if (i == 0) { // have no wave at first
      lineYL[0] = yL; // with left ball : lineY[0] follow ball center Y
      lineYR[0] = yR; // with right ball
      lineXU[0] = xU; // with up ball
      lineXD[0] = xD; // with down ball
    } else if (i == pathCount-1) { // have no follow curve after this point
      lineYL[pathCount-1] = lineYL[i-1]; // with left ball
      lineYR[pathCount-1] = lineYR[i-1]; // with right ball
      lineXU[pathCount-1] = lineXU[i-1]; // with up ball
      lineXD[pathCount-1] = lineXD[i-1]; // with down ball
    } else {
      // with left ball
      lineYL[i] = lineYL[i-1]; // lineY[i] follow lineY[i-1]
      line(lineXL[i], lineYL[i], lineXL[i+1], lineYL[i+1]); // the two point of the line must be updated aready, or look serrated. First point must be more near ball than another point
      // with right ball
      lineYR[i] = lineYR[i-1];
      line(lineXR[i], lineYR[i], lineXR[i+1], lineYR[i+1]);
      // with up ball
      lineXU[i] = lineXU[i-1];
      line(lineXU[i], lineYU[i], lineXU[i+1], lineYU[i+1]);
      // with down ball
      lineXD[i] = lineXD[i-1];
      line(lineXD[i], lineYD[i], lineXD[i+1], lineYD[i+1]);
    }
  }

  // Ball update : just change y direction
  yL = firstYL + amplitudeL*sin(radians(frameCount*freqMagL)); // = cos frame+n  n = odd number * 90
  yR = firstYR + amplitudeR*sin(radians(frameCount*freqMagR));
  xU = firstXU + amplitudeU*sin(radians(frameCount*freqMagU));
  xD = firstXD + amplitudeD*sin(radians(frameCount*freqMagD));
  
  // draw ball
  fill(colorPool[0]);
  ellipse(xL, yL, radius, radius);
  fill(colorPool[1]);
  ellipse(xR, yR, radius, radius);
  fill(colorPool[2]);
  ellipse(xU, yU, radius, radius);
  fill(colorPool[3]);
  ellipse(xD, yD, radius, radius);
}