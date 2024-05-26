int score; 
int lives;
String gameMode;
int time;
int gravitationalConstant = 20; 
ArrayList<Fruit>Fruits;
int countdown;
Fruit Floor; 

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
    if(f.isSlashed()){
      Fruits.remove(f);
       //if slashed make two fruits; 
    }
    if (f.isDead()){
      Fruits.remove(f);
      lives--;
      
    }
  }
  
  
  //Launchign fruit and time;
  if (lives > 0){
  text(time, 10, 10);
  
    if (Fruits.size() == 0 && time % 20 == 0){
    Fruits.add(new Fruit(600, 1000, 0.0, -25, 6, 50.0));
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
