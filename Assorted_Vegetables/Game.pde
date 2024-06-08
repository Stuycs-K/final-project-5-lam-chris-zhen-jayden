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
int fruityCounter;
float angleRotate = 0.0;

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
    fruityCounter = 0;
    background(standard);
   
  }
  
  public void displayMenu(){
      Fruit a = new Fruit(width/2, height/2, 0, 0, 20, 20.0, 1, false);
    
 background(standard);
  if (Fruits.size() == 0){
   
    Fruits.add(a);
    
  }
  a.move();
    a.display();
    Fruits.get(0).slashed();
    if(Fruits.get(0).isSlashed){
      menu= false;
    }else{
    translate(width/2 + 75, height/2 + 70);
    strokeWeight(1);
    pushMatrix();
    rotate(radians(angleRotate));
    fill(color(255, 255, 255));
    text("           Classic Mode", 0, 0);
    popMatrix();
  
  angleRotate += 5;
    }
  }
  
  public void display(){
    
    fill(0, 0, 0);
    textSize(100);
     if (freezerTime){
    background(freeze);
  }else{
 background(standard);
  }
  
  if(keyPressed){
    mode++;
  }
  if(mode == 5){
    mode = 0;
  }
 // background(255);
 fill(color(0, 50, 200));
   text("" + mode, 10, 500);
   fill(0, 0, 0);
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
        if (score > highScore){
        highScore = score; 
        }
        fill(color(100, 100, 0));
        rect(450, 450, 300, 150);
        fill(color(100, 0, 100));
        textSize(50);
        text("Play Again", 465, 545);
        text(highScore, 465, 500);
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
        fill(color(0, 50, 200));
        
        text("X", 910, 100);
        text("X", 980, 100);
        text("X", 1050, 100);
        fill(0, 0, 0);
    }
    if (lives == 2){
      fill(color(255, 0, 0));
      text("X", 1050, 100);
      fill(color(0, 50, 200));
       text("X", 910, 100);
        text("X", 980, 100);
        fill(color(0, 0, 0));
    }
    if (lives == 1){
      fill(color(255, 0, 0));
      text("X", 1050, 100);
      text("X", 980, 100);
        fill(color(0, 50, 200));
       text("X", 910, 100);
       fill(color(0, 0, 0));

    }
  
  int spawntime = (int)(Math.random()*30 + 10);
  if(mode == 3){
    spawntime = 1;
    difficulty = 9;
  }
    if (Fruits.size() == 0 && time % spawntime == 0){
    
    for (int i = 0; i < (int)(Math.random()*(difficulty - 1) + 1); i++){
      int spawnwidth = (int)((Math.random() * (w - 400)) + 300);
      int speedup = (int)((Math.random() * -5) - 25);
      
      fruityCounter++; 
    Fruit a = new Fruit(spawnwidth, 1000, (int)(Math.random() * 4) - (int)(Math.random() * 4), speedup, 50, 50.0);
     
     
      
      if (fruityCounter == 6){
        a = new Fruit(spawnwidth, 1000, (int)(Math.random() * 5) - (int)(Math.random() * 5), speedup, 50, 50.0, 0);
     
      }
      
      if (a.whatFruit == 12){
        a = new Freeze(a.position.x, a.position.y, a.velocity.x, a.velocity.y, a.radius, a.mass);
      }
   Fruits.add(a);
    if (fruityCounter == 6){
        fruityCounter = 0;
      }
    }
  }
  
  //FREEZE
  
  
  // IF FROZEN CHANGE BACKGROUND TO A FROZEN BACKGROUND
  if(freezerTime){
  for(int i = 0; i < Veggie.Fruits.size(); i++){
        Fruit f = Veggie.Fruits.get(i);
       
        PVector l = f.acceleration;
   if (freezerTime){
      if (freezeCounter > 0){
        if ((!f.cut) && f.whatFruit !=  0 && f.velocity.y > 0 ){
          
          
          f.acceleration.y = 0.015;
         

        }
      
        freezeCounter--;
      }
      else{
        background(standard);
       f.acceleration = l;
       freezeCounter = 1000;
        freezerTime = false;
       
      }
   }
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
  }
  if ( score % 25 == 0 && score != 0 && lives > 0 && lives < 3){ //|| combo > 0){
      lives++;
    }
  }
}

}
