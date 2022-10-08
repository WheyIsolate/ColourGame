void intro(){
  score = 0;
  
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if (f == nFrames) f = 0;
  
  fill(magenta);
  textFont(retro);
  text("COLOR\nGAME",250,200);
  
  startButton(400,400,100,white);
  
  failure.pause();
  failure.rewind();
}

boolean sbContact(int x, int y, int r){
  if(dist(x,y,mouseX,mouseY) < r){
    return true;
  }else{
    return false;
  }
}

void startButton(int x, int y, int d, color c){
  fill(c);
  if(sbContact(x,y,d/2)){
    stroke(magenta);
  }else{
    stroke(c);
  }
  circle(x,y,d);
  
  fill(magenta);
  textFont(retro);
  text(">",405,390);
}
