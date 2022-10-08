void game(){
  background(255);
  strokeWeight(0);

  yesButton(0, 0, width/2, height, 0);
  
  fill(magenta);
  textSize(50);
  text(score, width/2, height/2+100);
  
  fill(255);
  text("Yes (Y)", width/4, height/4);
  fill(0);
  text("No (N)", width*3/4, height/4);

  gText(words[wRand], width/2, ty, fSize);

}

void gText(String w, int x, int y, int s){
  fill(colors[cRand]);
  textFont(retro, s);
  text(w, x, y);
}

void success(){
  ty = height/2-50;
  score++;
  wRand = (int) random(0,8);
  cRand = (int) random(0,8);
  binRand = (int) random(0,4);
  
  if(binRand > 2){
    cRand = wRand;
  }
  
  success.play();
  success.rewind();
}

boolean ybContact(int x, int y, int w, int h){
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
    return true;
  }else{
    return false;
  }
}

void yesButton(int x, int y, int w, int h, color c){
  fill(c);
  rect(x,y,w,h);
}
