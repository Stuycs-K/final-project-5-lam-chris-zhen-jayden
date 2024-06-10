public class Freeze extends Fruit{


  int FloorMass = 500000000;
   
  public Freeze(float x, float y, float xspeed, float yspeed, float radius_, float mass_){
    super( x,  y,  xspeed, yspeed,  radius_,  mass_, 12);
    super.cut = false;
  }
  public void slashed(){
  
    if (!super.cut && pmouseX > super.position.x - super.radius && pmouseX < super.position.x + super.radius && pmouseY > super.position.y - super.radius && pmouseY < super.position.y + super.radius){
    super.isSlashed = true; 
    
   freezerTime = true;
  
   
     }
  
  }
  
  
}
