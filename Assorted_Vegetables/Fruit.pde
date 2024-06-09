public class Fruit{
private PVector position, velocity, acceleration;
private float mass, radius;
//private int whatFruit = (int)(Math.random() * 11);
private int whatFruit = 0;
private boolean isSlashed = false;
private boolean cut; //when we replace the spheres with fruit
private PImage watermelon, coconut, lemon, cut_coconut, cut_lemon;


public Fruit(float x, float y, float xspeed, float yspeed, float radius_, float mass_){
  position = new PVector(x, y);
  velocity = new PVector(xspeed, yspeed);
  acceleration = new PVector(0, 0);
  mass = mass_;
  radius = radius_;
  whatFruit = (int)(Math.random() * 13);
  cut = false; 
}
public Fruit(float x, float y, float xspeed, float yspeed, float radius_, float mass_, int FruitType){
  position = new PVector(x, y);
  velocity = new PVector(xspeed, yspeed);
  acceleration = new PVector(0, 0);
  mass = mass_;
  radius = radius_;
  whatFruit = FruitType;
  if(FruitType == 0){
    cut = false;
  }else{
 cut = true;
  }
}
//Starting Watermelon
public Fruit(float x, float y, float xspeed, float yspeed, float radius_, float mass_, int FruitType, boolean isCut){
  position = new PVector(x, y);
  velocity = new PVector(xspeed, yspeed);
  acceleration = new PVector(0, 0);
  mass = mass_;
  radius = radius_;
  whatFruit = FruitType;
  cut = isCut;
}


public boolean isDead(){
  return (velocity.y > 0 && position.y > 925);
}

public void applyForce(PVector f){
  acceleration.add(PVector.div(f, mass));
}

public int getScore(){return 0;}

public void move(){
  velocity.add(acceleration);
  position.add(velocity);
  acceleration.set(0, 0);
}

public PVector attractTo(Fruit other){
  float distance = PVector.dist(this.position, other.position);
  double mag = 20 * this.mass * other.mass / (Math.pow(distance, 2));
  PVector force = PVector.sub(other.position, this.position);
  force.normalize();
  force.setMag((float) mag);
  return force;
}
// 0 = Bomb
// 1 = Watermelon
// 2 = Coconut
// 3 = Lemon
// 4 = Orange
// 5 = Lime
// 6 =
// 7 =
// 8 = freeze banana
// 9 =
// 10 =
// 11 =
// 20 = 
// 21 = cutWatermelon
// 22 = cutCoconut
// 23 = cutLemon
// 24 = 
// 25 =
// 26 =

public void display(){
      noStroke();
   if(whatFruit == 0){
     fill(0);
     circle(position.x, position.y, (float)radius * 2);
     fill(240, 0, 0);
     quad(position.x - 35, position.y - 30, position.x - 25, position.y -30, position.x + 25, position.y + 30, position.x + 35, position.y + 30);
     quad(position.x - 35, position.y + 30, position.x - 25, position.y + 30, position.x + 25, position.y - 30, position.x + 35, position.y - 30);

 }
  if(whatFruit == 1){
      radius = 150;
      fill(64, 205, 64);
      watermelon = loadImage("bigWatermelon.png");
      watermelon.resize((int)radius, 0);
      image(watermelon, position.x, position.y);
      //ellipse(position.x, position.y, 2 *(float)radius * (float)Math.sqrt(2), 2 * (float)radius);
}
  if(whatFruit == 21){
      radius = 100;
      watermelon = loadImage("cutWatermelon.png");
      watermelon.resize((int)radius, 0);
      image(watermelon, position.x, position.y);
}
  if(whatFruit == 2){
      radius = 125;
      coconut = loadImage("Coconut.png");
      coconut.resize((int)radius, 0);
      image(coconut, position.x, position.y);
}  if(whatFruit == 22){
      radius = 125;
      cut_coconut = loadImage("cutCoconut.png");
      cut_coconut.resize((int)radius, 0);
      image(cut_coconut, position.x, position.y);
}
  if(whatFruit == 3){
      radius = 65;
      lemon = loadImage("Lemon.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 23){
      radius = 85;
      cut_lemon = loadImage("cutLemon.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
  if(whatFruit == 4){
      radius = 105;
      lemon = loadImage("Orange.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 24){
      radius = 105;
      cut_lemon = loadImage("cutOrange.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
  if(whatFruit == 5){
      radius = 70;
      lemon = loadImage("Lime.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 25){
      radius = 70;
      cut_lemon = loadImage("cutLime.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
  if(whatFruit == 6){
      radius = 120;
      lemon = loadImage("Mango.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 26){
      radius = 110;
      cut_lemon = loadImage("cutMango.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
  if(whatFruit == 7){
      radius = 140;
      lemon = loadImage("Pineapple.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 27){
      radius = 140;
      cut_lemon = loadImage("cutPineapple.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
  if(whatFruit == 8){
      radius = 70;
      lemon = loadImage("Kiwi.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 28){
      radius = 70;
      cut_lemon = loadImage("cutKiwi.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
  if(whatFruit == 9){
      radius = 50;
      lemon = loadImage("Strawberry.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 29){
      radius = 50;
      cut_lemon = loadImage("cutStrawberry.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
  if(whatFruit == 10){
      radius = 80;
      lemon = loadImage("Greenapple.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 30){
      radius = 80;
      cut_lemon = loadImage("cutGreenapple.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
  if(whatFruit == 11){
      radius = 80;
      lemon = loadImage("Redapple.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 31){
      radius = 80;
      cut_lemon = loadImage("cutRedapple.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
      }
 if(whatFruit == 12){
     
      radius = 200;
      if (mode == 0){
       radius = 80;
     }
      lemon = loadImage("Redapple.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 32){
      radius = 200;
      cut_lemon = loadImage("cutRedapple.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
     fill(0);
}



public void slashed(){
  if (!cut && pmouseX > position.x - radius && pmouseX < position.x + radius && pmouseY > position.y - radius && pmouseY < position.y + radius){
    isSlashed = true; 
      if(whatFruit == 0){
        if (mode == 1){
          score -= 10;
          if (score <= 0){
            score = 0;
          }
          
        }
        if (mode == 0){
        lives = 0;
        }
      //Explode
      }
  }
}




}
