package assignment3;



public class Platforms 
{
	  int speed=1;
	  
	 public void falldown() 
	  {  
	    Assignment3.applet.platY-= 1;
	    Assignment3.applet.stroke(0);
	    Assignment3.applet.rect(Assignment3.applet.platX, Assignment3.applet.platY, Assignment3.applet.platformSizeX, Assignment3.applet.platformSizeY);
	    Assignment3.applet.fill(0);

	    if (Assignment3.applet.platY<0)
	    {
	    	Assignment3.applet.platY = Assignment3.applet.height-Assignment3.applet.bSpeeds;
	    	Assignment3.applet.platX = Assignment3.applet.random(Assignment3.applet.width);
	    }
	  }// END OF FALL 
	

}