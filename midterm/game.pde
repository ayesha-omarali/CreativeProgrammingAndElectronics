import processing.sound.*;
SoundFile backgroundMusic;

Astroids[] astroidArray = new Astroids[15];
SpaceShip ship;
boolean atStartScreen = true;

void setup() {
  size(400, 400);
  smooth();
  
  backgroundMusic = new SoundFile(this, "FantasiaFantasia.mp3");
  backgroundMusic.loop();
  
  ship = new SpaceShip();
  
  //prepare astroid debris
  for (int i=0; i < astroidArray.length; i++) {
    astroidArray[i] = new Astroids();
  }
}

void keyPressed() { //all key code interactions
  if(keyCode == UP){ // move ship up
    ship.isGoingUp = true;
    ship.isGoingDown = false;

  } else if (keyCode == DOWN) { //move ship down
    ship.isGoingUp = false;
    ship.isGoingDown = true;
  } else if (keyCode == 81) { //restart
    atStartScreen = true;
    ship.score = 0; // reset score 
  }
}

void keyReleased() {
  if (keyCode == UP) { //stop moving ship up
    ship.isGoingUp = false;
  } else if (keyCode == DOWN) { //stop moving ship down 
    ship.isGoingDown = false;
  }
}

void updateCollisions() { // draws each astroid using Astroids class, and updates score if collision with ship
  for (int i=0; i < astroidArray.length; i++) {
    astroidArray[i].update();
    astroidArray[i].drawAstroid(); //draw astroids
    
    if(ship.increaseDifficulty){ // check if time to increase speed 
      astroidArray[i].increaseDifficulty(); // update speed for astroids
    } else if (ship.decreaseDifficulty){
      astroidArray[i].decreaseDifficulty(); // decrease speed for astroids 
    }
    
    if(astroidArray[i].hasHitShip(ship)){ //if collision
      ship.respawn(); //respawn ship
      ship.score--; //deduct score
      ship.decreaseDifficulty = true;
    }
  }
  ship.decreaseDifficulty = false;
  ship.increaseDifficulty = false;

}

void draw() {
  background(0);
  
  if(atStartScreen){ // title screen 
    startScreen();
    updateCollisions();

  } else { // playing game 
    startOverButton();
    ship.update();
    ship.drawSpaceShip();
    Score currScore = new Score(50);
    currScore.drawScore(ship.score); 
    
    updateCollisions(); // what draws the atroids and keeps track of collisions
  }
}

void startOverButton(){
  fill(255);
  textSize(10);
  textAlign(RIGHT);
  text("Press 'Q' to quit!", width - 10, height - 20);
}

void startScreen(){
  String message = "Click anywhere to start!";
  PFont f = createFont("silom", 20);
  textFont(f, 20);
  stroke(0,0,0);
  textAlign(CENTER);
  text(message, width/2, height/2);
  
  textFont(f, 15);
  textAlign(CENTER);
  text("UP & DOWN Keys to cross avoiding the astroids!", width/2, height/2 +  30);
}

void mouseClicked(){
  if(atStartScreen){
    atStartScreen = false;
  }
}
