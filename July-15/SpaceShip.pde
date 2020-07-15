class SpaceShip {
  
  float x, y, size;
  int score;
  boolean isGoingUp, isGoingDown, increaseDifficulty, decreaseDifficulty;
  
  SpaceShip(){
    x = width/2;
    y = height - 20;
    score = 0;
    size = 27;
  }
  
  void respawn() {
    y = height - 20;
    isGoingUp = false;
    isGoingDown = false;
  }
  
  void update() {
    if(isGoingUp && y > 0) {
      y -= 2; //go up!
    } else if (isGoingDown && y < height - 20) {
      y += 2; //go down!
    }
    
    if (updateScore()){
      score++;
      if(score % 2 == 0){
        increaseDifficulty = true;
      } else {
        increaseDifficulty = false;
      }
      respawn();
    }
  }
  
  boolean updateScore() {
    if (y <= 0) {
      return true;
    }
    return false;
  }
  
  void drawSpaceShip() {
    PImage photo;
    photo = loadImage("SpaceShipImg.png");
    image(photo, x, y, size, size);
  }
}
