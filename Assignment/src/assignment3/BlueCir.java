package assignment3;



public class BlueCir
{
	//float  BlueCirx= Assignment3.applet.random(Assignment3.applet.width);
	//float  BlueCiry= Assignment3.applet.random(Assignment3.applet.height, 2*Assignment3.applet.height);

	  int speed=10;
	  // FALLING VERTICAL
	  public void falldown() 
	  {  
		  Assignment3.applet.BlueCiry-= 5;
		  Assignment3.applet.stroke(0);
		  Assignment3.applet.ellipse(Assignment3.applet.BlueCirx, Assignment3.applet.BlueCiry, Assignment3.applet.circleSize, Assignment3.applet.circleSize);
		  Assignment3.applet.fill(0);

	    if (Assignment3.applet.BlueCiry<0)
	    {
	    	Assignment3.applet.BlueCiry = Assignment3.applet.height-Assignment3.applet.bSpeeds;
	    	Assignment3.applet.BlueCirx = Assignment3.applet.random(Assignment3.applet.width);
	    }
	  }// END OF FALL
	  
	    // FALLING ACROSS
	 public void fallacross()
	  {     
		 Assignment3.applet.BlueCirx1 -= 5;
		 Assignment3.applet.stroke(0);
		 Assignment3.applet.ellipse(Assignment3.applet.BlueCirx1, Assignment3.applet.BlueCiry1, Assignment3.applet.circleSize, Assignment3.applet.circleSize);
		 Assignment3.applet.fill(0);

	    if (Assignment3.applet.BlueCirx1<0)
	    {
	    	Assignment3.applet.BlueCirx1 = Assignment3.applet.width+Assignment3.applet.bSpeeds;
	    	Assignment3.applet.BlueCiry1 = Assignment3.applet.random(Assignment3.applet.height);
	    }
	  }
	
}