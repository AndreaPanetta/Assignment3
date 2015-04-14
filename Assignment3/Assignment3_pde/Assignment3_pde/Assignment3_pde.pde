
BlueCir bc1,bc2;
Platforms p1;

float playerSpeed= 8;
int check=0;

float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;


ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

int BPcircles;

int i;

int playerSize =50;

int circleSize =40;

int platformSizeX =30;
int platformSizeY =10;

int blueCIR = 2;
BlueCir[] BlueCirArr= new BlueCir[blueCIR];
BlueCir[] BlueCirArr2= new BlueCir[blueCIR];
//BLUE CIRCLE VARIABLES
float BlueCirx1 = random(width, 2*width+60);
float BlueCiry1= random(height);

int platforms=2;
Platforms[] Platform = new Platforms[platforms];

int bSpeeds =10;

boolean devMode = false;
boolean sketchFullScreen() 
{
  return ! devMode;
}

//MUSIC
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*; 
Minim minim;
AudioPlayer player;
AudioInput input; 

void setup()
{
  //SIZING OF SCREEN
  if (devMode)
  {
    size(800, 600);
  } else
  {
    size(displayWidth, displayHeight);
  }
  setUpPlayerControllers();
  
  //BLUE CIRCLE FROM BOTTOM
  for (int j = 0; j < BlueCirArr.length; j++) 
  {
    BlueCirArr[j] = new BlueCir(); // Create each object
    bc1 = new BlueCir();
  }
  
  //BLUE CIRCLE FROM BOTTOM
  for (int j = 0; j < Platform.length; j++) 
  {
    Platform[j] = new Platforms(); // Create each object
    p1 = new Platforms();
  }
  
  for (int j = 0; j < BlueCirArr2.length; j++) 
  {
    BlueCirArr2[j] = new BlueCir(); // Create each object
    bc2 = new BlueCir();
  }
  
  //MUSIC
  minim = new Minim(this);
  songSetup();
  int i = (int) random(0, songs.size());
  player= songs.get(i).songs;
  player.play();
}

void draw()
{
  
  background(pathR,pathG,pathB);
  pathR=centerR+R*sin(a);
  a=a+.03;
   
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
   
  pathB=centerB+B*sin(a2);
  a2=a2+.03;
  for(Player player:players)
  {
    player.update();
    player.display();
  }
  
  Player p4 = players.get(0); // DECTECTING COLLISION WITH THE BLUE SQUARE 

  for (int i = 0; i < players.size (); i++)
  {
    BlueCir b1 = BlueCirArr[i];

    if (p4.collisionCheck2(b1))
    {
      background(0, 0, 255);
      BPcircles=BPcircles+2;
       check++;
    }
  }
  
  Player p7 = players.get(0); // DETECTING IT AGAINST THE BLUE PLAYER 
   textSize(24);
  fill(0, 0, 255);
  text("PLAYER BLUE CIRCLES: ", 420, 50);
  text(check, 700, 50);

  for (int i = 0; i < players.size (); i++)
  {
    BlueCir bc = BlueCirArr2[i];

    if (p7.collisionCheck3(bc))
    {
      background(0, 0, 255);
      BPcircles=BPcircles+2;
    }
  }
  
  if (!player.isPlaying() )
  {
    int i = (int) random(0, songs.size());
    player= songs.get(i).songs;
    player.play();
  }
  
  for (int j = 0; j < BlueCirArr.length; j++) 
  {
    BlueCirArr[j].falldown();
  }
  
  for (int j = 0; j < BlueCirArr.length; j++) 
  {
    BlueCirArr[j].fallacross();
  }
  
  for (int j = 0; j < Platform.length; j++) 
  {
    Platform[j].falldown();
  }
  
  
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  

    XML playerXML = children[0];
    Player p = new Player(
            0
            , color(255)
            , playerXML);
    int x = (1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
   players.add(p);         
  
}
