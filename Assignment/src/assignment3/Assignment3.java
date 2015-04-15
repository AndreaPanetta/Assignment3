package assignment3;

import java.awt.Color;


import processing.core.PApplet;


  


public class Assignment3 extends PApplet {
	
	
public static Assignment3 applet;
BlueCir bc1,bc2;
Platforms p1;

float playerSpeed= 50;
float playerX,playerY;
int check=0;
int lives=500;
float playerPosX=500;
float playerPosY=500;





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



boolean[] keys = new boolean[526];

int BPcircles;

int i;

float  platX = 0;
  float  platY = 0;

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
float BlueCirx = random(width, 2*width+60);
float BlueCiry= random(height);



int platforms=4;
Platforms[] Platform = new Platforms[platforms];

int bSpeeds =10;

boolean devMode = false;
public boolean sketchFullScreen() 
{
  return ! devMode;
}


 

public Object pos;
private Color Colour;

public void setup()
{
	applet = this;
  //SIZING OF SCREEN
  if (devMode)
  {
    size(800, 600);
  } else
  {
    size(displayWidth, displayHeight);
  }
 
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
  
  
}


public void draw()
{
  
  background(pathR,pathG,pathB);
  pathR=centerR+R*sin(a);
  a=(float)(a+.03);
   
  pathG=centerG+G*sin(a1);
  a1=(float)(a1+.03);
   
  pathB=centerB+B*sin(a2);
  a2=(float)(a2+.03);
  
  Assignment3.applet.rect(Assignment3.applet.playerPosX, Assignment3.applet.playerPosY, 50 , 50);
  Assignment3.applet.fill(0);
  
  

  Assignment3.applet.textSize(50);
  Assignment3.applet.fill(0);
  Assignment3.applet.text("SCORE: ", 420, 50);
  Assignment3.applet.text(check, 700, 50);
  Assignment3.applet.textSize(50);
  Assignment3.applet.fill(0);
  Assignment3.applet.text("LIVES: ", 10, 50);
  Assignment3.applet.text(lives, 200, 50);
  
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
  
  if (playerPosX - playerSize < platX + 20 && playerPosX+ playerSize > platX && playerPosY - playerSize < platY + 20 && playerPosY + playerSize > platY)
  {
    lives--;
  }
  
  if (BlueCirx1>playerPosX && BlueCirx1 < playerPosX+playerSize && BlueCiry1 > playerPosY && BlueCiry1 < playerPosY+playerSize)
  {
    check++;
  }
  
  if (playerPosX - playerSize < BlueCirx + circleSize && playerPosX + playerSize > BlueCirx && playerPosY - playerSize < BlueCiry + circleSize && playerPosY + playerSize > BlueCiry)
  {
    check++;
  }
  
  if(check > 100)
  {
    playerSpeed = 100;
  }
  
  if(check > 100)
  {
    circleSize = 20;
  }
  
  if(check > 150)
  {
    platformSizeX = 50;
    platformSizeY = 30;
  }
  
  if(lives < 0)
  {
	  Assignment3.applet.textSize(50);
	  Assignment3.applet.fill(0);
	  Assignment3.applet.text("YOU DIED !PRESS Q TO RESTART ", Assignment3.applet.height/3, Assignment3.applet.width/3);
  }
  
  
}
 

public void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

public void keyPressed()
{
  //CONTROLING THE TARDIS
  if (key == 'd' && playerPosX < (width - 80))
  {
     playerPosX = playerPosX + playerSpeed;
  }
  if  (key == 'a' && playerPosX > -20)
  {
     playerPosX = playerPosX - playerSpeed;
  }
  if  (key == 'w' && playerPosX > -20)
  {
     playerPosY = playerPosY - playerSpeed;
  }
  if  (key == 's' && playerPosX > -20)
  {
     playerPosY = playerPosY+  playerSpeed;
  }
  if  (key == 'q' && lives<0)
  {
     lives=500;
     check=0;
  }
  
  
  
    
     
  
  
}

}

