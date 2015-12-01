//your variable declarations here
//working on Bullets class, make loop to move bullets
Stars [] starField;
ArrayList <Asteroid> theList;
SpaceShip bob;
ArrayList <Bullets> bullList;
Bullets bull;

public void setup() 
{
  //your code here
  size(600,600);
  starField = new Stars [200];
  theList = new ArrayList <Asteroid>();
  bullList = new ArrayList <Bullets>();
  for( int i = 0; i < 20; i++)
  {
    theList.add(i, new Asteroid());
  }
  for( int i = 0; i < starField.length; i++)
  {
    starField[i] = new Stars();
  }
  bob = new SpaceShip();
  bull = new Bullets(bob); 
}

public void draw() 
{
  //your code here
  background(0);
  for( int i = 0; i < starField.length; i++)
  {
    starField[i].show();
  }
  for( int i = 0; i < theList.size(); i++) //when spaceship hit asteroid, remove asteroid
  {
    if( dist( bob.getX(), bob.getY(), theList.get(i).getX(), theList.get(i).getY() ) < 20)
    {
      theList.remove(i);
    }
    else
    {
      theList.get(i).show();
      theList.get(i).move();    
    }
  }
  bob.show();
  bob.move();
  bull.show();
  bull.move();
  textSize(32);
  fill(255,0,0);
  text("score" + bull.getPointDirection(),50,50);
  System.out.println(bullList.toString());
}

public void keyPressed(){
  if( keyCode == LEFT) //rotate left
  {
    bob.rotate(-10);
  }
  if( keyCode == RIGHT) //rotate right
  {
    bob.rotate(10);
  }
  if( keyCode == UP) //accelerate
  {
    bob.accelerate(0.1);
  }
  if( keyCode == DOWN) //decelerate
  {
    bob.accelerate(-0.1);
  }
  if( key == ' ') //hyperspace
  {
    bob.setX((int)(Math.random()*500));   
    bob.setY((int)(Math.random()*500));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setPointDirection((int)(Math.random()*360));
  }
  if( key == 'd')
  {
    bullList.add(new Bullets(bob));
  }
}
class Stars
{
  int myColor;
  int myPositionX;
  int myPositionY;
  Stars()
  {
    myColor = color(255);
    myPositionX = (int)(Math.random()*width);
    myPositionY = (int)(Math.random()*height);
  }
  void show()
  {
    noStroke();
    fill(myColor);
    ellipse(myPositionX, myPositionY, 4, 4);
  }
}
class SpaceShip extends Floater  
{   
    //your code here
    SpaceShip()
    {
      corners = 35;
      xCorners = new int [corners];
      yCorners = new int [corners];
      xCorners[0] =16;
      yCorners[0] =0;
      xCorners[1] =1;
      yCorners[1] =5;
      xCorners[2] =0;
      yCorners[2] =8;
      xCorners[3] =1;
      yCorners[3] =8;
      xCorners[4] =6;
      yCorners[4] =9;
      xCorners[5] =1;
      yCorners[5] =10;
      xCorners[6] =-1;
      yCorners[6] =10;
      xCorners[7] =-2;
      yCorners[7] =9;
      xCorners[8] =-2;
      yCorners[8] =6;
      xCorners[9] =-5;
      yCorners[9] =7;
      xCorners[10] =-5;
      yCorners[10] =8;
      xCorners[11] =-10;
      yCorners[11] =8;
      xCorners[12] =-10;
      yCorners[12] =7;
      xCorners[13] =-12;
      yCorners[13] =5;
      xCorners[14] =-12;
      yCorners[14] =3;
      xCorners[15] =-14;
      yCorners[15] =3;
      xCorners[16] =-14;
      yCorners[16] =1;
      xCorners[17] =-13;
      yCorners[17] =1;
      xCorners[18] =-13;
      yCorners[18] =-1;
      xCorners[19] =-14;
      yCorners[19] =-1;
      xCorners[20] =-14;
      yCorners[20] =-3;
      xCorners[21] =-12;
      yCorners[21] =-3;
      xCorners[22] =-12;
      yCorners[22] =-5;
      xCorners[23] =-10;
      yCorners[23] =-7;
      xCorners[24] =-10;
      yCorners[24] =-8;
      xCorners[25] =-5;
      yCorners[25] =-8;    
      xCorners[26] =-5;
      yCorners[26] =-7;
      xCorners[27] =-2;
      yCorners[27] =-6; 
      xCorners[28] =-2;
      yCorners[28] =-9;
      xCorners[29] =-1;
      yCorners[29] =-10; 
      xCorners[30] =1;
      yCorners[30] =-10;
      xCorners[31] =6;
      yCorners[31] =-9; 
      xCorners[32] =1;
      yCorners[32] =-8;
      xCorners[33] =0;
      yCorners[33] =-8;  
      xCorners[34] =1;
      yCorners[34] =-5;                                                                                     
      myColor = color(255,255,0);
      myCenterX = width/2;
      myCenterY = height/2;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }

    public void setX(int x){ myCenterX = x;}
    public int getX(){ return (int)myCenterX;}
    public void setY(int y){ myCenterY = y;}
    public int getY(){ return (int)myCenterY;}
    public void setDirectionX(double x){ myDirectionX = x;}
    public double getDirectionX(){ return myDirectionX;}
    public void setDirectionY(double y){ myDirectionY = y;}
    public double getDirectionY(){ return myDirectionY;}
    public void setPointDirection(int degrees){ myPointDirection = degrees;}
    public double getPointDirection(){ return myPointDirection;}
}

class Bullets extends Floater
{
  Bullets(SpaceShip theShip)
  {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
    myColor = color(0,0,255);
  }
  public void setX(int x){ myCenterX = x;}
  public int getX(){ return (int)myCenterX;}
  public void setY(int y){ myCenterY = y;}
  public int getY(){ return (int)myCenterY;}
  public void setDirectionX(double x){ myDirectionX = x;}
  public double getDirectionX(){ return myDirectionX;}
  public void setDirectionY(double y){ myDirectionY = y;}
  public double getDirectionY(){ return myDirectionY;}
  public void setPointDirection(int degrees){ myPointDirection = degrees;}
  public double getPointDirection(){ return myPointDirection;}  
  
  public void show()
  {
    fill(myColor);
    stroke(myColor);
    ellipse((float)myCenterX,(float)myCenterY,6,6);
  }
  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }
}

class Asteroid extends Floater
{
  private int myRotSpeed;
  Asteroid()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    myColor = color(255,0,0);
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*height);
    myDirectionX = (Math.random()*2)-1;
    myDirectionY = (Math.random()*2)-1;
    myPointDirection = 0;
    myRotSpeed = (int)((Math.random()*10) - 5);                 
  }
    public void move()
    {
      myCenterX += myDirectionX;    
      myCenterY += myDirectionY;
      myPointDirection += myRotSpeed;    

      //wrap around screen    
      if(myCenterX >width)
      {     
        myCenterX = 0;    
      }    
      else if (myCenterX<0)
      {     
        myCenterX = width;    
      }    
      if(myCenterY >height)
      {    
        myCenterY = 0;    
      }   
      else if (myCenterY < 0)
      {     
        myCenterY = height;    
      }         
    }
    public void setX(int x){ myCenterX = x;}
    public int getX(){ return (int)myCenterX;}
    public void setY(int y){ myCenterY = y;}
    public int getY(){ return (int)myCenterY;}
    public void setDirectionX(double x){ myDirectionX = x;}
    public double getDirectionX(){ return myDirectionX;}
    public void setDirectionY(double y){ myDirectionY = y;}
    public double getDirectionY(){ return myDirectionY;}
    public void setPointDirection(int degrees){ myPointDirection = degrees;}
    public double getPointDirection(){ return myPointDirection;}
    public void setRotation(int degrees){ myRotSpeed = degrees;}
    public double getRotation(){ return myRotSpeed;}  

}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

