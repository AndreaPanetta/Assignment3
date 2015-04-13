PImage backdrop;
final int Width = 30;
final int Height = 39;
int[][] level = new int[Height][Width];

float z =1;
float speed=1;

Player p1;

//booleans for the keyPress/keyRelease functions
boolean upPress = false;
boolean leftPress = false;
boolean rightPress = false;

void setup()
{
  size(500,650);
  
  //allows the player to fall to the middle of the screen at beginning
  p1 = new Player(Width*8,Height*8);
  backdrop = loadImage("background.jpg");
}

void draw()
{ 
  background(255);
  
  p1.update();
  z += speed;
  z %= height;
  image(backdrop,0,int(z));
  image(backdrop.get(0, backdrop.height - int(z), backdrop.width, int(z)),0, 0);
  
  p1.show();
}


boolean place_free(int xx,int yy) 
{
//checks if a given point (xx,yy) is free (no block at that point) or not
  yy = int(floor(yy/16.0));
  xx = int(floor(xx/16.0));
  if ( xx > -1 && xx < level[0].length && yy > -1 && yy < level.length ) {
    if ( level[yy][xx] == 0 ) {
      return true;
    }
  }
  return false;
}

void keyPressed() 
{
  switch(keyCode) 
  {
    case RIGHT: rightPress = true; break;
    case LEFT: leftPress = true; break;
    case UP: upPress = true; break;
  }
}
void keyReleased() 
{
  switch(keyCode) 
  {
    case RIGHT: rightPress = false; break;
    case LEFT: leftPress = false; break;
    case UP: upPress = false; break;
  }
}
