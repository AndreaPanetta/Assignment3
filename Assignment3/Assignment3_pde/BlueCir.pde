class BlueCir
{
  float  BlueCirx= random(width);
  float  BlueCiry= random(height, 2*height);

  int speed=10;
  // FALLING VERTICAL
  void falldown() 
  {  
    BlueCiry-= 3;
    stroke(0, 0, 255);
    ellipse(BlueCirx, BlueCiry, 20, 20);
    fill(0);

    if (BlueCiry<0)
    {
      BlueCiry = height-bSpeeds;
      BlueCirx = random(width);
    }
  }// END OF FALL
}
