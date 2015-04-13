class Platforms
{
  float  platX = -random(width);
  float  platY = -random(height, 2*height);

  int speed=3;
  
  // FALLING VERTICAL
  void falldown() 
  {  
    platY-= 1;
    stroke(0, 0, 255);
    
    rect(platX, platY, 60, 20);
    fill(255);

    if (platY<0)
    {
      platY = height-bSpeeds;
      platX = random(width);
    }
  }// END OF FALL
}
