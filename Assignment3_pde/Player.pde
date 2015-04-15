
class Player
{

  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
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
  
   //CHECKING COLLISION OF PLAYER WITH HORIZONTAL CIRCLE
  boolean collisionCheck3(BlueCir bc)
  {
    if (BlueCirx1>pos.x && BlueCirx1 < pos.x+playerSize && BlueCiry1 > pos.y && BlueCiry1 < pos.y+playerSize)
    {
      return true;
    }
    return false;
  }
  
  
  void update()
  {
    
    if(check > 100)
    {
      playerSpeed = 5;
    }
    
    if(check > 100)
    {
      circleSize = 20;
    }
    
    if(check > 100)
    {
      platformSizeX = 50;
      platformSizeY = 30;
    }
      
    if (checkKey(up))
    {
      pos.y -= playerSpeed;
    }
    if (checkKey(down))
    {
      pos.y += playerSpeed;
    }
    if (checkKey(left))
    {
      pos.x -= playerSpeed;
    }    
    if (checkKey(right))
    {
      pos.x += playerSpeed;
    }
    if (checkKey(start))
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
    }    
  }
  
  void display()
  {    
    stroke(colour);
    fill(colour);    
    rect(pos.x, pos.y, 50, 50);
  }  
}
