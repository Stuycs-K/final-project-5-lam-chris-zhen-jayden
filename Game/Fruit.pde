public class Fruit{
private PVector position, velocity, acceleration;
private float mass, radius;
//public int whatFruit = (int)(Math.random() * 11);
private int whatFruit = 0;
private boolean explode;
private boolean isSlashed = false;
private boolean cut; //when we replace the spheres with fruit


public Fruit(float x, float y, float xspeed, float yspeed, float radius_, float mass_){
  position = new PVector(x, y);
  velocity = new PVector(xspeed, yspeed);
  acceleration = new PVector(0, 0);
  mass = mass_;
  radius = radius_;
  whatFruit = 0; 
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

public void display(){
 if(!isSlashed){
   if(whatFruit == 0){
     fill(0);
     noStroke();
     circle(position.x, position.y, (float)radius * 2);
   }
  
   
 }
}

public void slashed(){
  
  if (!cut && pmouseX > position.x - radius && pmouseX < position.x + radius && pmouseY > position.y - radius && pmouseY < position.y + radius){
    isSlashed = true; 
  }
 // if(isSlashed){
  //}
}
}
