PFont font;
int lives;
PImage waterMelonScore;
int highScore = 0;
int trueTimer;
boolean menu;
boolean freezerTime =false;
Game Veggie;
int freezeCounter = 1000;
PImage standard, freeze;
int mode;

void setup(){
  font =  createFont("go3v2.ttf", 32);
    standard = loadImage("Wood2.png");
    freeze = loadImage("Frozen2.png");
     //image(standard,0,0);
     //image(standard,0,550);
  textFont(font);
  size(1200, 900); 
  //background(standard);
  Veggie = new Game();
  waterMelonScore = loadImage("Watermelon.png");
  menu = true;

}

void draw(){
  //standard = loadImage("Wood2.png");
 
  if(menu){
   Veggie.displayMenu();
  }else{
    
    Veggie.display();
    image(waterMelonScore, 20, 40);
    textSize(25);
    fill(color(255, 215, 0));
    text("Best: " + highScore, 20, 150);
    textSize(50);
    fill(color(0,0,0));
    
  }
}
 void mousePressed(){
  if (lives == 0){
    if(mouseX > 450 && mouseX < 750 && mouseY > 450 && mouseY <600){
      setup();
    }
  }
}

void mouseMoved(){
}
