final int XSPEED = 1;
final int ASTROIDSIZE = 10;

class Astroids {
  
  float x, y, xSpeed;
  boolean isGoingLeft;
  
  Astroids() {
    xSpeed = XSPEED; //determines speed of astroids crossing 
    resetAstroid();
  }
  
  /* draws and spawns astroids */
  void resetAstroid() { 
    y = random(height - 60);
    boolean spawnLeft = random(1) < 0.5;
    
    if(spawnLeft) {
      x = random(-width, 0);
      isGoingLeft = false;
    } else {
      x = random(width, width*2);
      isGoingLeft = true;
    }
  }
  
  /* Makes Astroids move */ 
  void update() {  
    if (isGoingLeft) {
      x -= xSpeed;
    } else {
      x += xSpeed;
    }

    if (isOffScreen()) {
      resetAstroid();
    }
  }
  
  /* rate which speed increases as difficulty increases */
  void increaseDifficulty() {
    xSpeed += .2;
  }
  
  /* rate which speed decreases as difficulty decreases */
  void decreaseDifficulty() {
    xSpeed -= .2;
  }

  /* checks if astroid is off screen to respawn */   
  boolean isOffScreen() {
    if ((x < -8) || (x > width + 8)) {
      return true;
    }
    return false;
  }
  
  boolean hasHitShip(SpaceShip ship) {
    //if distance between astroid and ship is less than the radius of the two combined (aka are touching)
    if(dist(x, y, ship.x, ship.y) < ASTROIDSIZE/2 + ship.size/2) {
      return true;
    }
    return false;
  }
  
  void drawAstroid() {
    fill(255);
    ellipse(x, y, ASTROIDSIZE, ASTROIDSIZE);
  }
}
