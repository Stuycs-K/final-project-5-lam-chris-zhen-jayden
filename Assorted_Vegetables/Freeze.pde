public class Freeze extends Fruit{
  public Freeze(float x, float y, float xspeed, float yspeed, float radius_, float mass_){
    super( x,  y,  xspeed, yspeed,  radius_,  mass_, 8);
  }
  public void slashed(){
    if (!cut && pmouseX > position.x - radius && pmouseX < position.x + radius && pmouseY > position.y - radius && pmouseY < position.y + radius){
    isSlashed = true; 
          
        if(countdown == 0){
          countdown = 20;
          time++; 
        }
         if(countdown > 0){
          countdown --;
        }
  }
}
