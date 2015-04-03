final int Width = 85;
final int Height = 46;
int[][] level = new int[Height][Width];
 
Player player;
 
//booleans for key presses 
boolean rightPress = false;
boolean leftPress = false;
boolean upPress = false;

boolean devMode = false;
boolean sketchFullScreen()
{
  return ! devMode;
}
 
void setup() {
  //size(480,368);
  if (devMode)
  {
    size(950, 533);
  }
  else
  {
    size(displayWidth, displayHeight);
  }
  player = new Player(Width*8,Height*8); //put the player in the middle of the window
}
void draw() {
  player.update();
   
  background(200);
  drawLevel();
  player.show();
}
 
void drawLevel() {
  fill(0);
  noStroke();
  for ( int ix = 0; ix < Width; ix++ ) {
    for ( int iy = 0; iy < Height; iy++ ) {
      switch(level[iy][ix]) {
        case 1: rect(ix*16,iy*16,16,16);
      }
    }
  }
}
 
boolean place_free(int xx,int yy) {
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
 
void keyPressed() {
  switch(keyCode) {
    case RIGHT: rightPress = true; break;
    case LEFT: leftPress = true; break;
    case UP: upPress = true; break;
  }
}
void keyReleased() {
  switch(keyCode) {
    case RIGHT: rightPress = false; break;
    case LEFT: leftPress = false; break;
    case UP: upPress = false; break;
  }
}

/*
void mousePressed() {
//Left click creates/destroys a block
  if ( mouseButton == LEFT ) {
    level[int(floor(mouseY/16.0))][int(floor(mouseX/16.0))] ^= 1;
  }
}*/

