/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

BlueCir bc1;

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

int BPcircles;

int i;

int playerSize =50;

int blueCIR = 2;
BlueCir[] BlueCirArr= new BlueCir[blueCIR];

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
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
   players.add(p);         
  
}
