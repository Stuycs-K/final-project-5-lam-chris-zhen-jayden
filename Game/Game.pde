int score; 
int lives;
String gameMode;
int time;
int gravitationalConstant = 20; 
ArrayList<Fruit>Fruits;
int countdown;
Fruit Floor; 
int w = 1200;
int h = 900;
int difficulty = 3; 

void setup(){
  size(1200, 900); 
  time = 0;
  Floor = new Fruit(width/2, 150000, 0, 0, 100, 500000000);
  Fruits = new ArrayList<Fruit>();
  lives = 3;
  countdown = 20;
  
}

void draw(){
  background(255);
   
  
 //Fruit array
  for (int i = 0; i < Fruits.size(); i++){
    Fruit f = Fruits.get(i);
    f.move();
    f.display();
    f.applyForce(f.attractTo(Floor));
    f.slashed(); 
    if(f.isSlashed){
      // Make something for bomb explosion 
      Fruits.remove(f);
      Fruits.add(new Fruit(f.position.x, f.position.y, 5, 0, 50, 50.0, f.whatFruit));
      Fruits.add(new Fruit(f.position.x,f.position.y, -5, 0, 50, 50.0, f.whatFruit));
       //if slashed make two fruits; 
    }
      
    
    if (f.isDead()){
      
      Fruits.remove(f);
      if (!f.cut && f.whatFruit != 0){
        lives--;
       }
    }
  }
  
  if (lives == 0){
        fill(color(255, 0, 0));
        text("X", 10, 100);
        text("X", 80, 100);
        text("X", 150, 100);
        fill(color(0, 0, 0));
  }
  
  //Launchign fruit and time;
  //randomize timing to x amount after all fruits are cut
  if (lives > 0){
      fill(color(0, 0, 0));
      textSize(10) ;
      text(time, 10, 10);
      textSize(100) ;
    if(lives == 3){
        fill(color(0, 0, 0));
        text("X", 10, 100);
        text("X", 80, 100);
        text("X", 150, 100);
    }
    if (lives == 2){
      fill(color(255, 0, 0));
      text("X", 150, 100);
      fill(color(0, 0, 0));
       text("X", 10, 100);
        text("X", 80, 100);
    }
    if (lives == 1){
      fill(color(255, 0, 0));
      text("X", 150, 100);
      text("X", 80, 100);
        fill(color(0, 0, 0));
       text("X", 10, 100);

    }
  
      
  int spawntime = (int)(Math.random()*30 + 10);
    if (Fruits.size() == 0 && time % spawntime == 0){
    
    for (int i = 0; i < difficulty; i++){
      int spawnwidth = (int)((Math.random() * (w - 200)) + 100);
      int speedup = (int)((Math.random() * -5) - 25);
    Fruits.add(new Fruit(spawnwidth, 1000, (int)(Math.random() * 2) - (int)(Math.random() * 2), speedup, 50, 50.0));
    }
    //will need to randomize the speed within certain limits and location of launch;
    }
  }
  
  
  
  
  //Timer 
  if(countdown == 0){
    countdown = 20;
    time++; 
  }
   if(countdown > 0){
    countdown --;
  }

}

 

void mouseMoved(){
}
