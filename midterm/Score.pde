/* This class draws the current score on the game screen */ 
class Score {
  int x, y;
  
  Score(int xInit){
    x = xInit;
    y = height - 20;
  }
  
  void drawScore(int currentScore) {
    fill(255);
    textAlign(CENTER);
    textSize(60);
    text(currentScore, this.x, this.y);
  }
}
