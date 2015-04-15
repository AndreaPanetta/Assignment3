class Platforms
{
  

  int speed=1;
  
 void falldown() 
  {  
    platY-= 1;
    stroke(0);
    rect(platX, platY, platformSizeX, platformSizeY);
    fill(0);

    if (platY<0)
    {
      platY = height-bSpeeds;
      platX = random(width);
    }
  }// END OF FALL 
}
