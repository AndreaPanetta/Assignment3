class Player
{
  PVector pos;
  char up;
  char left;
  char right;
  color colour;
  
  float xSpeed,ySpeed;
  float accel,deccel;
  float maxXspd,maxYspd;
  float xSave,ySave;
  int xRep,yRep;
  float gravity;
  
  Player()
  {
    pos = new PVector(width / 2, height / 2);
    xSpeed = 0;
    ySpeed = 0;
    accel = 0.5;
    deccel = 0.5;
    maxXspd = 2;
    maxYspd = 12;
    xSave = 0;
    ySave = 0;
    xRep = 0;
    yRep = 0;
    gravity = 0.25;
  }
  
  Player(int index, color colour, char up, char left, char right, char start, char button1, char button2)
  {
    this();
    //this.index = index;
    this.colour = colour;
    this.up = up;
    this.left = left;
    this.right = right;
   // this.start = start;
  //  this.button1 = button1;
   // this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  boolean collisionCheck2(BlueCir b1)
  {
    if (pos.x - playerSize < b1.BlueCirx + 20 && pos.x + playerSize > b1.BlueCirx && pos.y - playerSize < b1.BlueCiry + 20 && pos.y + playerSize > b1.BlueCiry)
    {
      return true;
    }
    return false;
  }
  
  void update()
  {
    if (checkKey(up))
    {
      pos.y -= 1;
      if ( !place_free(pos.x,pos.y+16) || !place_free(pos.x+15,pos.y+16) ) 
      {
        ySpeed = -5.3;
      }
    }
    
    if (checkKey(right))
    {
      pos.x += 1;
      xSpeed += accel;
      if ( xSpeed > maxXspd ) 
      {
        xSpeed = maxXspd;
      }
    }
    
    if (checkKey(left))
    {
      pos.x -= 1;
      xSpeed -= accel;
      if ( xSpeed < -maxXspd ) 
      {
        xSpeed = -maxXspd;
      }
    }
    else 
    { //neither right or left pressed, decelerate
      if ( xSpeed > 0 ) 
      {
        xSpeed -= deccel;
        if ( xSpeed < 0 ) 
        {
          xSpeed = 0;
        }
      }
      else if ( xSpeed < 0 ) 
      {
        xSpeed += deccel;
        if ( xSpeed > 0 ) 
        {
          xSpeed = 0;
        }
      }
    }
    ySpeed += gravity;
    
    /*if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }*/

    xRep = 0; //should be zero because the for loops count it down but just as a safety
    yRep = 0;
    xRep += floor(abs(xSpeed));
    yRep += floor(abs(ySpeed));
    xSave += abs(xSpeed)-floor(abs(xSpeed));
    ySave += abs(ySpeed)-floor(abs(ySpeed));
    int signX = (xSpeed<0) ? -1 : 1;
    int signY = (ySpeed<0) ? -1 : 1;
    //when the player is moving a direction collision is tested for only in that direction
    //the offset variables are used for this in the for loops below
    int offsetX = (xSpeed<0) ? 0 : 15;
    int offsetY = (ySpeed<0) ? 0 : 15;
     
    if ( xSave >= 1 ) {
      xSave -= 1;
      xRep++;
    }
    if ( ySave >= 1 ) {
      ySave -= 1;
      yRep++;
    }
     
    for ( ; yRep > 0; yRep-- ) {
      if ( place_free(pos.x,pos.y+offsetY+signY) && place_free(pos.x+15,pos.y+offsetY+signY) ) {
        pos.y += signY;
      }
      else {
        ySpeed = 0;
      }
    }
    for ( ; xRep > 0; xRep-- ) {
      if ( place_free(pos.x+offsetX+signX,pos.y) && place_free(pos.x+offsetX+signX,pos.y+15) ) {
        pos.x += signX;
      }
      else {
        xSpeed = 0;
      }
    }    
  }
  
  void display()
  {    
    stroke(colour);
    fill(colour);    
    rect(pos.x, pos.y, 20, 20);
  }  
}
