
void setup() {
  size(200,200);
  rectMode(CENTER); 
  ellipseMode(CENTER);
}

float theta = 0.0;

void draw() {
  background(76, 188, 194);

  
  theta += 0.03; //velocity 
  noStroke();
  fill(84, 100, 222);
  float angle = theta;

  // draw all the points along a sine wave 
  for (int x = 0; x <= width; x += 10) {
    // Calculate y value based off of sine function
    float y = map(sin(angle), -1, 1, 0, height); //scaled to the pixel dimension of the window
    ellipse(x, y, 16, 16);
    // Increment angle
    angle += .2;
  }
  
  for (int x = 0; x <= width; x += 10) {
    float y = map(sin(angle), -1, 1, 0, height);
    ellipse(x, y, 16, 16);
    angle += .1;
  }
  
  fill(255);


  drawBody();
  
}

void drawBody() {
  fill(235, 42, 126);
  triangle(80, 170, 100, 70, 120, 170); //body
  stroke(0, 0, 0);
  line(90, 170, 85, 190); //left leg
  line(110, 170, 115, 190); //right leg
  
  noFill(); //hair
  bezier(100, 40, 10, 10, 10, 190, 20, 120); //right hair
  bezier(100, 40, 17, 20, 18, 190, 20, 120); //right hair
  bezier(100, 40, 37, 10, 23, 190, 20, 120); //right hair
  bezier(100, 35, 67, 10, 23, 190, 20, 120); //right hair
  bezier(100, 40, 37, 10, 23, 20, 20, 20); //right hair
  bezier(100, 40, 37, 10, 23, 40, 20, 60); //right hair
  bezier(100, 30, 37, 10, 23, 70, 20, 80); //right hair



  bezier(100, 40, 190, 10, 190, 190, 185, 120); //left hair
  bezier(100, 40, 200, 10, 190, 190, 185, 120); //left hair
  bezier(100, 30, 150, 10, 190, 190, 185, 120); //left hair
  bezier(100, 40, 150, 10, 190, 150, 185, 100); //left hair
  bezier(100, 40, 150, 10, 190, 100, 185, 100); //left hair
  bezier(100, 35, 150, 10, 190, 100, 200, 50); //left hair
  bezier(100, 40, 150, 10, 190, 100, 200, 80); //left hair

  fill(140, 75, 22);
  ellipse(100,70,60,60); //head
}

