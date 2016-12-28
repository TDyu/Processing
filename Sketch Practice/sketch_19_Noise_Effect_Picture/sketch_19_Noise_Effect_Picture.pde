// Image
PImage img;
PVector[] particles; // each pixel position
color[] eachParColor; // each pixel color

void setup() {
  size(1280, 720);
  
  noStroke(); // avoid black stroke covoring
  
  // Load Image
  img = loadImage("Hahow Small.jpg"); // in data folder
  
  // New Array Memory for Pixel Data
  particles = new PVector[img.width*img.height];
  eachParColor = new color[img.width*img.height];
  
  // Load Pixel Data
  for (int i=0; i<img.width; i++) { // row
    for (int j=0; j<img.height; j++) { // column
      particles[img.width*j+i] = new PVector(i, j);
      eachParColor[img.width*j+i] = img.pixels[img.width*j+i];
    }
  }
}

void draw() {
  background(148);
  
  /* Image (directly load) (if use each pixel to draw then this can be not used)
  imageMode(CENTER);
  //image(img, 0, 0);
  //image(img, 0, 0, img.width*1.2, ing.height*1.2);
  image(img, width/2, height/2); */
  
  // Image (use each pixel)
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      if (random(20) < 17) { // for Noise Effect
        fill(eachParColor[img.width*j+i]);
        //rect(particles[img.width*j+i].x, particles[img.width*j+i].y, 1, 1); // Upper left corner
        rect(particles[img.width*j+i].x + width/8, particles[img.width*j+i].y + height/4, 1, 1);
      }
    }
  }
}