//   ______    ___   _____       ___   _______
// .' ___  | .'   `.|_   _|    .'   `.|_   __ \
/// .'   \_|/  .-.  \ | |     /  .-.  \ | |__) |
//| |       | |   | | | |   _ | |   | | |  __ /
//\ `.___.'\\  `-'  /_| |__/ |\  `-'  /_| |  \ \_
// `.____ .' `.___.'|________| `.___.'|____| |___|
//   ______       _       ____    ____  ________
// .' ___  |     / \     |_   \  /   _||_   __  |
/// .'   \_|    / _ \      |   \/   |    | |_ \_|
//| |   ____   / ___ \     | |\  /| |    |  _| _
//\ `.___]  |_/ /   \ \_  _| |_\/_| |_  _| |__/ |
// `._____.'|____| |____||_____||_____||________|
//By Ethan Fang (1-2)
//2022/10/05

//Imports
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Audio setup
Minim minim;
AudioPlayer success;
AudioPlayer failure;
AudioPlayer music;

//Text setup
PFont retro;
int fSize = 50;
int ty = height/2-50;

//Modes
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//Gif setup
PImage[] gif;
int nFrames;
int f;

//RNG for game
int wRand = (int) random(0,8);
int cRand = (int) random(0,8);
int binRand = (int) random(1,5);

//Colors for game
color red = color(255,0,0);
color green = color(0,255,0);
color blue = color(0,0,255);
color yellow = color(255,255,0);
color purple = color(255,0,255);
color orange = color(255,148,0);
color black = 10;
color white = 220;

//Misc colors
color magenta = #fa62ff;

//Color/word arrays
String[] words = {"RED", "GREEN", "BLUE", "YELLOW", "PURPLE", "ORANGE", "BLACK", "WHITE"};
color[] colors = {red, green, blue, yellow, purple, orange, black, white};

//Misc states
int score;
int highscore;
int timer = 1000;
boolean timeOut = false;

void setup(){  
  minim = new Minim(this);
  success = minim.loadFile("SUCCESS.wav");
  failure = minim.loadFile("FAILURE.wav");
  music = minim.loadFile("Resonance.mp3");
  
  music.loop();
  
  nFrames = 24;
  gif = new PImage[nFrames];
  
  int i = 0;
  while(i<24){
    gif[i] = loadImage("giphy-"+i+".png");
    i=i+1;
  }
  
  strokeWeight(8);
  
  size(500,500);
  textSize(100);
  textAlign(CENTER,CENTER);
  retro = createFont("LaserCorps-mLZqa.otf", 100);
  mode = INTRO;
  
  if(binRand > 2){
    cRand = wRand;
  }
}

void draw(){
  if(mode == INTRO){
    intro();
  }else if(mode == GAME){
    game();
    ty++;
    if(ty >= height){
      mode = GAMEOVER;
    }
  }else if(mode == PAUSE){
    pausescreen();
  }else if(mode == GAMEOVER){
    gameover();
  }else{
    println("Segmentation fault (core dumped)");
  }
}

void keyPressed(){
  if(mode == INTRO && key == ENTER){
    mode = GAME;
    ty = height/2-50;
  } else if(mode == GAME) {
    if((key == 'y' && wRand == cRand) || (key == 'n' && wRand != cRand)){
      success();
    }else if((key == 'y' && wRand != cRand) || (key == 'n' && wRand == cRand)){
      mode = GAMEOVER;
    }
  } else if(mode == GAMEOVER){
    if(key == ENTER){
      mode = INTRO;
    }
  }
}

void mousePressed(){
  if(mode == INTRO && sbContact(400,400,100)){
    mode = GAME;
    ty = height/2-50;
  } else if(mode == GAME) {
    boolean contact = ybContact(0, 0, width/2, height);
    if((contact && wRand == cRand) || (!contact && wRand != cRand)){
      success();
    }else {
      mode = GAMEOVER;
    }
  } else if(mode == GAMEOVER){
    mode = INTRO;
  }

}
