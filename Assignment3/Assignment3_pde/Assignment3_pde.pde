

BlueCir bc1;
Platforms p1;

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

int BPcircles;

int i;

int playerSize =50;

int blueCIR = 2;
BlueCir[] BlueCirArr= new BlueCir[blueCIR];

int platforms=6;
Platforms[] Platform = new Platforms[platforms];

int platforms1=6;
Platforms[] Platform1 = new Platforms[platforms1];

float platX1 =random(width, 2*width+60);
float platY1= random(height);

int bSpeeds =10;

void setup()
{
  size(500, 500);
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
  
  //BLUE CIRCLE FROM BOTTOM
  for (int j = 0; j < Platform1.length; j++) 
  {
    Platform1[j] = new Platforms(); // Create each object
    p1 = new Platforms();
  }
  
  
}

void draw()
{
  
  background(0);
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
    }
  }
  
  for (int j = 0; j < BlueCirArr.length; j++) 
  {
    BlueCirArr[j].falldown();
  }
  
  for (int j = 0; j < Platform.length; j++) 
  {
    Platform[j].falldown();
  }
  
   for (int j = 0; j < Platform1.length; j++) 
  {
    Platform[j].fallacross();
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
    p.pos.y = 460;
   players.add(p);         
  
}
