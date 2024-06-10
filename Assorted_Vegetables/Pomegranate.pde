public class Pomegranate extends Fruit{
private int hits = 0;
  int FloorMass = 500000000;
  public Pomegranate(int x, int y, int xspeed, int yspeed, float radius_, int mass_){
    super(x,  y,  xspeed, yspeed,  radius_,  mass_);
    super.whatFruit = 13;
  }
  public void display(){
      PImage pome = loadImage("Pomegranate.png");
      pome.resize((int)super.radius, 0);
      image(pome, super.position.x, super.position.y);
      text(hits / 10, super.position.x, super.position.y);
  }
  
  public boolean isDead(){
    if(super.velocity.y > 0 && super.position.y > 1000){
          lives = 0;
    }
    return super.position.y > 1000;
    
  }
  
  public float getPositionY(){
    return super.position.y;
  }
  
  public float getVelocityY(){
    return super.velocity.y;
  }
  
  public int getScore(){
    return hits / 10;
  }
  
  public void slashed(){
  if (!super.cut && pmouseX > super.position.x - super.radius && pmouseX < super.position.x + super.radius && pmouseY > super.position.y - super.radius && pmouseY < super.position.y + super.radius){
     hits++;
     if (hits == 1){
       freezerTime = true;
     }
  }
  }
}
