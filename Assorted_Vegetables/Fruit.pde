public class Fruit{
private PVector position, velocity, acceleration;
private float mass, radius;
//private int whatFruit = (int)(Math.random() * 11);
private int whatFruit = 0;
private boolean explode;
private boolean isSlashed = false;
private boolean cut; //when we replace the spheres with fruit
private int timer = 500;
private PImage bomb, watermelon, coconut, lemon, cut_watermelon, cut_coconut, cut_lemon;


public Fruit(float x, float y, float xspeed, float yspeed, float radius_, float mass_){
  position = new PVector(x, y);
  velocity = new PVector(xspeed, yspeed);
  acceleration = new PVector(0, 0);
  mass = mass_;
  radius = radius_;
  whatFruit = (int)(Math.random() * 4);
  cut = false; 
}
public Fruit(float x, float y, float xspeed, float yspeed, float radius_, float mass_, int FruitType){
  position = new PVector(x, y);
  velocity = new PVector(xspeed, yspeed);
  acceleration = new PVector(0, 0);
  mass = mass_;
  radius = radius_;
  whatFruit = FruitType;
  cut = true;
}



public boolean isDead(){
  return (velocity.y > 0 && position.y > 900);
}

public void applyForce(PVector f){
  acceleration.add(PVector.div(f, mass));
}

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
// 4 = 
// 5 =
// 6 =
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
      radius = 100;
      coconut = loadImage("Coconut.png");
      coconut.resize((int)radius, 0);
      image(coconut, position.x, position.y);
}  if(whatFruit == 22){
      radius = 100;
      cut_coconut = loadImage("cutCoconut.png");
      cut_coconut.resize((int)radius, 0);
      image(cut_coconut, position.x, position.y);
}
  if(whatFruit == 3){
      radius = 75;
      lemon = loadImage("Lemon.png");
      lemon.resize((int)radius, 0);
      image(lemon, position.x, position.y);
}  if(whatFruit == 23){
      radius = 75;
      cut_lemon = loadImage("cutLemon.png");
      cut_lemon.resize((int)radius, 0);
      image(cut_lemon, position.x, position.y);
}
     fill(0);
}



public void slashed(){
  if (!cut && pmouseX > position.x - radius && pmouseX < position.x + radius && pmouseY > position.y - radius && pmouseY < position.y + radius){
    isSlashed = true; 
      if(whatFruit == 0){
        lives = 0;
      //Explode
      }
  }
}




}
