class Platforms
{
  float  platX = 0;
  float  platY = 0;

  int speed=1;
  
  // FALLING VERTICAL
  void falldown() 
  {  
    platY=platY+speed;
    rect(platX,platY,platformSizeX,platformSizeY);
    fill(0);
    if(platY>height)
   {
     platX = random(600);
     platY= random(-200);
   }// END OF IF
    
  }// END OF FALL
}
