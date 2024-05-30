public class Game{
int score; 

int comboTime;

String gameMode;
int time;
int gravitationalConstant = 20; 
ArrayList<Fruit>Fruits;
int countdown;
Fruit Floor; 
int w = 1200;
int h = 900;
int difficulty = 3; 
int highScore; 

float death_x, death_y;
  public Game(){
    time = 0;
    comboTime = 0;
    Floor = new Fruit(width/2, 150000, 0, 0, 100, 500000000);
    Fruits = new ArrayList<Fruit>();
    lives = 3;
    countdown = 20;
    score = 0;
    difficulty = 3;
  }
  
  void display(){
     background(255);
  if(comboTime > 0){
    comboTime--;
  }else{
    comboTime = 0;
    combo = 0;
  }
 //Fruit array
  for (int i = 0; i < Fruits.size(); i++){
    Fruit f = Fruits.get(i);
    f.move();
    f.display();
    f.applyForce(f.attractTo(Floor));
    f.slashed(); 
    if(f.isSlashed){
      if(!(f.whatFruit == 0)){
      combo++;
      comboTime += 500;
      if(comboTime > 500){
        comboTime = 500;
      }
      score += combo;
      death_x = f.position.x;
      death_y = f.position.y;
      f.displayCombo(death_x, death_y);
      // Make something for bomb explosion 
      Fruits.remove(f);
      System.out.println(death_y);
      Fruits.add(new Fruit(f.position.x, f.position.y, 5, 0, 50, 50.0, f.whatFruit));
      Fruits.add(new Fruit(f.position.x,f.position.y, -5, 0, 50, 50.0, f.whatFruit));
       //if slashed make two fruits; 
    }
    }
      
    
    if (f.isDead()){
      
      Fruits.remove(f);
      if (!f.cut && f.whatFruit != 0){
        lives--;
       }
    }
  }
  
     //Displaying score
     fill(color(255, 215, 0));
     text(score, 1000, 100);
  
  if (lives == 0){
        while(Fruits.size() >0){
          Fruits.remove(0);
        }
        fill(color(255, 0, 0));
        text("X", 10, 100);
        text("X", 80, 100);
        text("X", 150, 100);
        fill(color(0, 0, 0));
        highScore = score; 
        fill(color(100, 100, 0));
        rect(450, 450, 300, 150);
  }
  
  //Launchign fruit and time;
  //randomize timing to x amount after all fruits are cut
  if(lives < 0){
    lives = 0;
  }
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
    
    for (int i = 0; i < (int)(Math.random()*difficulty + 1); i++){
      int spawnwidth = (int)((Math.random() * (w - 200)) + 100);
      int speedup = (int)((Math.random() * -5) - 25);
    Fruit a = new Fruit(spawnwidth, 1000, (int)(Math.random() * 2) - (int)(Math.random() * 2), speedup, 50, 50.0);
     
      int bombNum = 0;
      for (Fruit k: Fruits){
        if (k.whatFruit == 0){
          bombNum++;
        }
      }
      if (bombNum >= 3 && a.whatFruit == 0){
        a = new Fruit(spawnwidth, 1000, (int)(Math.random() * 2) - (int)(Math.random() * 2), speedup, 50, 50.0, (int)(Math.random() * 3 + 1));
     
      }
   Fruits.add(a);
    
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
  if (time % 100 == 0){
    if (difficulty < 9){
      difficulty++; 
    }
    if (lives > 0 && lives < 3 || combo > 0){
      lives++;
    }
  }
  }
}

}
