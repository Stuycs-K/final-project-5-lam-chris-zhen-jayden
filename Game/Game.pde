 int score; 
 int lives;
String gameMode;
int time;
int gravitationalConstant = 20; 
ArrayList<Fruit>Fruits;
Fruit Floor; 

void setup(){
  size(1200, 900); 
  time = 0;
  Floor = new Fruit(width/2, 150000, 0, 0, 100, 500000000);
  Fruits = new ArrayList<Fruit>();
  lives = 3;
}

void draw(){
  background(255);

  for (int i = 0; i < Fruits.size(); i++){
    Fruit f = Fruits.get(i);
    f.move();
    f.display();
    f.applyForce(f.attractTo(Floor));
    if (f.isDead()){
      Fruits.remove(f);
      lives--;
      
    }
  }
  if (lives > 0){
  time++; 
    if (Fruits.size() == 0 && time % 200 == 0){
    Fruits.add(new Fruit(600, 1000, 0.0, -25, 6.0, 50.0));
    //will need to randomize the speed within certain limits and location of launch;
    }
  }

}

void mouseMoved(){
}
