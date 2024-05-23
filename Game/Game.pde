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
}

void draw(){
  for (Fruit f : Fruits){
    f.move();
    f.display();
    f.applyForce(f.attractTo(Floor));
  }
  time++; 
}

void mouseMoved(){
}
