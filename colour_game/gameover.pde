void gameover(){
  if(score > highscore){
    highscore = score;
  }
  
  background(magenta);
  fill(255);
  textSize(100);
  text("Game\nOver!", width/2, height/2-120);
  
  textSize(20);
  text("Press enter\nto continue", width/2, height/2+50);
  
  textSize(50);
  text("Score:"+score, width/2, height/2+130);
  text("Highscore: "+highscore, width/2, height/2+170);
  
  failure.play();
}
