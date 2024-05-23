public class Fruit{
private PVector position, velocity, acceleration;
private float mass, radius;
private boolean explode;

public Fruit(float x, float y, float xspeed, float yspeed, float radius_, float mass_){
  position = new PVector(x, y);
  velocity = new PVector(xspeed, yspeed);
  acceleration = new PVector(0, 0);
  mass = mass_;
  radius = radius_;
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
  
}

public void slashed(){
}
}
