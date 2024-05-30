public class Fruit{
private PVector position, velocity, acceleration;
private float mass, radius;
//private int whatFruit = (int)(Math.random() * 11);
private int whatFruit = 0;
private boolean explode;
private boolean isSlashed = false;
private boolean cut; //when we replace the spheres with fruit
private int timer = 500;


public Fruit(float x, float y, float xspeed, float yspeed, float radius_, float mass_){
  position = new PVector(x, y);
  velocity = new PVector(xspeed, yspeed);
  acceleration = new PVector(0, 0);
  mass = mass_;
  radius = radius_;
  whatFruit = (int)(Math.random() * 2);
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
public void display(){
   if(whatFruit == 0){
     fill(0);
     noStroke();
     circle(position.x, position.y, (float)radius * 2);
     fill(240, 0, 0);
     quad(position.x - 35, position.y - 30, position.x - 25, position.y -30, position.x + 25, position.y + 30, position.x + 35, position.y + 30);
     quad(position.x - 35, position.y + 30, position.x - 25, position.y + 30, position.x + 25, position.y - 30, position.x + 35, position.y - 30);

 }

 
  if(whatFruit == 1){
      fill(64, 205, 64);
      noStroke();
      ellipse(position.x, position.y, 2 *(float)radius * (float)Math.sqrt(2), 2 * (float)radius);
}
     fill(0);

}


public void displayCombo(float x, float y){
  if(isSlashed && combo > 1){
   fill(255, 0, 0);
   textSize(100);
   if(timer > 0){
     text(combo + " Fruit Combo!", x, y);
     timer--;
   }
 }
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
