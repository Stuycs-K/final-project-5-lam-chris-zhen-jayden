public class Game{
int score; 
int comboTime;
int combo;
float deathx;
float deathy;
int lateTime;
String gameMode;
int time;
int gravitationalConstant = 20; 
ArrayList<Fruit>Fruits;
int countdown;
Fruit Floor; 
int w = 1200;
int h = 900;
int difficulty; 
int highScore; 
int mode;
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
  
  public void display(){
    fill(0, 0, 0);
    textSize(50);
  if(keyPressed){
    mode++;
  }
  if(mode == 5){
    mode = 0;
  }
  background(255);
   text("" + mode, 10, 500);
  if(combo >= 3){    
    fill(color(random(255), random(255), random(255)));
    textSize(50);
    text(combo + "FRUIT", deathx, deathy);
    text("COMBO", deathx, deathy + 40);

  }
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
        if (combo == 0){
          combo++;
          comboTime = 100;
        }else{
          if (comboTime > 0){
            combo++;
            comboTime = 100;
          }
           if (comboTime == 0){
              combo = 0;
              if (combo >= 3){
             }
            
          }
        }
        
        
     // combo++;
     // comboTime += 500;
     // if(comboTime > 500){
      //  comboTime = 500;
     // }
   //
 
    //  f.displayCombo(death_x, death_y);
      // Make something for bomb explosion
      }
         score += combo;
         deathx = f.position.x;
         deathy = f.position.y;
    if(mode == 1){
    }else{
      Fruits.remove(f);
    }
      Fruits.add(new Fruit(f.position.x, f.position.y, 5, 0, 50, 50.0, f.whatFruit + 20));
      Fruits.add(new Fruit(f.position.x,f.position.y, -5, 0, 50, 50.0, f.whatFruit + 20));
       //if slashed make two fruits; 
    
    }
    
      
    
    if (f.isDead()){
      Fruits.remove(f);
      if (!f.cut && f.whatFruit != 0 && mode != 2){
        lives--;
       }
    }
  
  }

     //Displaying score
     textSize(100);
     fill(color(255, 215, 0));
     text(score, 80, 100);
  
  if (lives == 0){
        while(Fruits.size() >0){
          Fruits.remove(0);
        }
        textSize(100);
        fill(color(255, 0, 0));
        text("X", 910, 100);
        text("X", 980, 100);
        text("X", 1050, 100);
        fill(color(0, 0, 0));
        highScore = score; 
        fill(color(100, 100, 0));
        rect(450, 450, 300, 150);
        fill(color(100, 0, 100));
        textSize(50);
        text("Play Again", 465, 545);
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
        text("X", 910, 100);
        text("X", 980, 100);
        text("X", 1050, 100);
    }
    if (lives == 2){
      fill(color(255, 0, 0));
      text("X", 1050, 100);
      fill(color(0, 0, 0));
       text("X", 910, 100);
        text("X", 980, 100);
    }
    if (lives == 1){
      fill(color(255, 0, 0));
      text("X", 1050, 100);
      text("X", 980, 100);
        fill(color(0, 0, 0));
       text("X", 910, 100);

    }
  
  int spawntime = (int)(Math.random()*30 + 10);
  if(mode == 3){
    spawntime = 1;
    difficulty = 9;
  }
    if (Fruits.size() == 0 && time % spawntime == 0){
    
    for (int i = 0; i < (int)(Math.random()*(difficulty - 1) + 1); i++){
      int spawnwidth = (int)((Math.random() * (w - 200)) + 100);
      int speedup = (int)((Math.random() * -5) - 25);
    Fruit a = new Fruit(spawnwidth, 1000, (int)(Math.random() * 4) - (int)(Math.random() * 4), speedup, 50, 50.0);
     
      int bombNum = 0;
      for (Fruit k: Fruits){
        if (k.whatFruit == 0){
          bombNum++;
        }
      }
      if (bombNum >= 3 && a.whatFruit == 0){
        a = new Fruit(spawnwidth, 1000, (int)(Math.random() * 5) - (int)(Math.random() * 5), speedup, 50, 50.0, (int)(Math.random() * 3 + 1));
     
      }
   Fruits.add(a);
    
    }
  }
  
  
  
  
  //Timer 
  comboTime--;
  if(countdown == 0){
    countdown = 20;
    time++; 
  }
   if(countdown > 0){
    countdown --;
  }
  if (time % 100 == 0 && countdown == 0){
    if (difficulty < 9){
      difficulty++; 
    }
    if (lives > 0 && lives < 3){ //|| combo > 0){
      lives++;
    }
  }
  }
}

}
