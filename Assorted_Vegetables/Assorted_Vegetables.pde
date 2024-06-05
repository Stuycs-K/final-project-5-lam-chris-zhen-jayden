PFont font;
int lives;
PImage waterMelonScore;
int highScore = 0;

Game Veggie;
void setup(){
  font =  createFont("go3v2.ttf", 32);
  textFont(font);
  size(1200, 900); 
  Veggie = new Game();
  waterMelonScore = loadImage("Watermelon.png");
}

void draw(){
   Veggie.display();
  image(waterMelonScore, 20, 40);
  textSize(25);
  text("Best: " + highScore, 20, 150);
  textSize(50);

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
