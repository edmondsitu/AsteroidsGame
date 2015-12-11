//your variable declarations here
//make spaceship accelerate animation, game over screen
Stars [] starField;
ArrayList <Asteroid> theList;
SpaceShip bob;
ArrayList <Bullets> bullList;
boolean upKey = false;
boolean downKey = false;
boolean leftKey = false;
boolean rightKey = false;
boolean startGame = false;
boolean gameOverScreen = false;
int scoreB = 0;

public void setup() 
{
  //your code here
  size(600,600);
  starField = new Stars [200];
  theList = new ArrayList <Asteroid>();
  bullList = new ArrayList <Bullets>();
  for( int i = 0; i < 50; i++)
  {
    theList.add(i, new Asteroid());
  }
  for( int i = 0; i < starField.length; i++)
  {
    starField[i] = new Stars();
  }
  bob = new SpaceShip();
}

public void draw() 
{
  //your code here
  if( startGame == false){
    background(255,0,0);
    textAlign(CENTER,CENTER);
    textSize(100);
    fill(0,0,0);
    text("PLAY", width/2, height/2);
  }

  if( startGame == true){
  background(0);
  for( int i = 0; i < starField.length; i++) { starField[i].show(); } //show sky of stars
  for( int i = 0; i < theList.size(); i++) //when bullet hits asteroid, remove asteroid and bullet
  {
    theList.get(i).show();
    theList.get(i).move();
    if( dist( bob.getX(), bob.getY(), theList.get(i).getX(), theList.get(i).getY()) < 20){
      //startGame = false;
      gameOverScreen = true;
      bob.setX(width/2);
      bob.setY(height/2);
      bob.setDirectionX(0);
      bob.setDirectionY(0);
      for( int k = 0; k < theList.size(); k++){
        theList.get(k).setY(0);
      }
    }
    for( int j = 0; j < bullList.size(); j++)
    {
      if( dist( bullList.get(j).getX(), bullList.get(j).getY(), theList.get(i).getX(), theList.get(i).getY() ) < 15)
      {
        bullList.remove(j);
        theList.remove(i);
        scoreB++;
        break;
      }
    }
  }
  for( int j = 0; j < bullList.size(); j++) //move and show bullet in arraylist
  {
    bullList.get(j).show();
    bullList.get(j).move();
    if(bullList.get(j).getX() > width || bullList.get(j).getX() < 0 || bullList.get(j).getY() > height || bullList.get(j).getY() < 0)
    {
      bullList.remove(j);
    }
  }

  if( leftKey == true) { bob.rotate(-10); } //rotate left
  if( rightKey == true) { bob.rotate(10); } //rotate right
  if( upKey == true) { bob.accelerate(0.1); } //accelerate
  if( downKey == true) { bob.accelerate(-0.1); } //decelerate

  bob.show();
  bob.move();
  textSize(32);
  fill(255,0,0);
  text("Score: " + scoreB,100,50);
  }
  if( gameOverScreen == true){
    background(255,0,0);
    textAlign(CENTER,CENTER);
    textSize(100);
    fill(0,0,0);
    text("PLAY AGAIN?", width/2, height/2);
  }
  System.out.println(startGame);
}

public void mousePressed(){
  if( mouseX < width && mouseY < height){
  startGame = true;
  gameOverScreen = false;
 }
}
public void keyPressed(){
  if( keyCode == LEFT){ leftKey = true; } //rotate left
  if( keyCode == RIGHT){ rightKey = true; } //rotate right
  if( keyCode == UP){ upKey = true; } //accelerate
  if( keyCode == DOWN){ downKey = true; } //decelerate
  if( key == ' ') //hyperspace
  {
    bob.setX((int)(Math.random()*500));   
    bob.setY((int)(Math.random()*500));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setPointDirection((int)(Math.random()*360));
  }
  if( key == 'd'){ bullList.add(new Bullets(bob)); } //add bullet to list and shoots
  if( key == 's'){
    for( int i = 0; i < 360; i+= 10){
      bullList.add(new Bullets(bob));
      bullList.get(bullList.size() - 1).hackSaver(i+10);
    }
  }
}

public void keyReleased(){
  if( keyCode == LEFT){ leftKey = false; } //rotate left
  if( keyCode == RIGHT){ rightKey = false; } //rotate right
  if( keyCode == UP){ upKey = false; } //accelerate
  if( keyCode == DOWN){ downKey = false; } //decelerate
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
  private double mySecCenterX;
  private double mySecCenterY;
  Bullets(SpaceShip theShip)
  {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    mySecCenterX = theShip.getX()+Math.cos(dRadians)*30;
    mySecCenterY = theShip.getY()+Math.sin(dRadians)*30;
    myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
    myColor = color(0,0,255);
  }
  public void setX(int x){ myCenterX = x;}
  public int getX(){ return (int)mySecCenterX;}
  public void setY(int y){ myCenterY = y;}
  public int getY(){ return (int)mySecCenterY;}
  public void setDirectionX(double x){ myDirectionX = x;}
  public double getDirectionX(){ return myDirectionX;}
  public void setDirectionY(double y){ myDirectionY = y;}
  public double getDirectionY(){ return myDirectionY;}
  public void setPointDirection(int degrees){ myPointDirection = degrees;}
  public double getPointDirection(){ return myPointDirection;}  
  
  public void hackSaver(float newPoint){
    myPointDirection = 0;
    myPointDirection += newPoint;
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX += 5* Math.cos(dRadians);
    myDirectionY += 5* Math.sin(dRadians);
  }
  public void show()
  {
    fill(myColor);
    stroke(myColor);
    //ellipse((float)myCenterX,(float)myCenterY,6,6);
    strokeWeight(5);
    line((float)myCenterX, (float)myCenterY, (float)mySecCenterX, (float)mySecCenterY);
  }
  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    mySecCenterX += myDirectionX;
    mySecCenterY += myDirectionY;
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
    xCorners[0] = (int)(Math.random()*10-20);
    yCorners[0] = (int)(Math.random()*10-22);
    xCorners[1] = (int)(Math.random()*5+11);
    yCorners[1] = (int)(Math.random()*10-22);
    xCorners[2] = (int)(Math.random()*5+15);
    yCorners[2] = (int)(Math.random()*5);
    xCorners[3] = (int)(Math.random()*5+10);
    yCorners[3] = (int)(Math.random()*5+12);
    xCorners[4] = (int)(Math.random()*10-25);
    yCorners[4] = (int)(Math.random()*5+8);
    xCorners[5] = (int)(Math.random()*10-35);
    yCorners[5] = (int)(Math.random()*5);
    myColor = color(255,0,0);
    myCenterX = (int)(Math.random()*width);
    myCenterY = 0;
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
    strokeWeight(1);    
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

