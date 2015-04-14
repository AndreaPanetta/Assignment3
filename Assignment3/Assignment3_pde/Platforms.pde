class Platforms
{
  float  platX = 0;
  float  platY = 0;

  float speed=1.5;
  
  // FALLING VERTICAL
  void falldown() 
  {  
    platY=platY+speed;
    rect(platX,platY,70,20);
    fill(255,0,0);
    if(platY>height)
   {
     platX = random(600);
     platY= random(-200);
   }// END OF IF
    
  }// END OF FALL
  
  // FALLING ACROSS
  void fallacross()
  {     
    platX1 -= 1;
    stroke(0, 0, 255);
    rect(platX1, platY1, 70, 20);
    fill(0);

    if (platX1<0)
    {
      platX1 = width+bSpeeds;
      platY1 = random(height);
    }
  }
  
}
