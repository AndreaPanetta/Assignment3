class BlueCir
{
  float  BlueCirx= random(width);
  float  BlueCiry= random(height, 2*height);

  int speed=10;
  // FALLING VERTICAL
  void falldown() 
  {  
    BlueCiry-= 5;
    stroke(0);
    ellipse(BlueCirx, BlueCiry, circleSize, circleSize);
    fill(0);

    if (BlueCiry<0)
    {
      BlueCiry = height-bSpeeds;
      BlueCirx = random(width);
    }
  }// END OF FALL
  
    // FALLING ACROSS
  void fallacross()
  {     
    BlueCirx1 -= 5;
    stroke(0);
    ellipse(BlueCirx1, BlueCiry1, circleSize, circleSize);
    fill(0);

    if (BlueCirx1<0)
    {
      BlueCirx1 = width+bSpeeds;
      BlueCiry1 = random(height);
    }
  }
  
}
