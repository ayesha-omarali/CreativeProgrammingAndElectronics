import java.util.Random;
Astroids[] astroidArray = new Astroids[15];
SpaceShip ship;
void setup() {
  size(400, 400);
  smooth();
  
  ship = new SpaceShip();
  
  //prepare astroid debris
  for (int i=0; i < astroidArray.length; i++) {
    int leftOrRight = new Random().nextBoolean() ? 0 : 400;
    astroidArray[i] = new Astroids(leftOrRight, random(0, 380));
  }
}

void keyPressed() {
  if(keyCode == UP){
    ship.isGoingUp = true;
    ship.isGoingDown = false;

  } else if (keyCode == DOWN) {
    ship.isGoingUp = false;
    ship.isGoingDown = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    ship.isGoingUp = false;
  } else if (keyCode == DOWN) {
    ship.isGoingDown = false;
  }
}

void updateCollisions() {
  for (int i=0; i < astroidArray.length; i++) {
    astroidArray[i].update();
    astroidArray[i].drawAstroid();
    
    if(ship.increaseDifficulty){
      astroidArray[i].increaseDifficulty();
    } else if (ship.decreaseDifficulty){
      astroidArray[i].decreaseDifficulty();
    }
    
    if(astroidArray[i].hasHitShip(ship)){
      ship.respawn();
      ship.score--;
      ship.decreaseDifficulty = true;
    }
  }
  ship.decreaseDifficulty = false;
  ship.increaseDifficulty = false;

}

void increaseDifficulty() {
  if (ship.score % 5 == 0) {
    
  }
}

void draw() {
  background(0);
  ship.update();
  ship.drawSpaceShip();
  Score currScore = new Score(50);
  currScore.drawScore(ship.score);
  
  updateCollisions();
}
