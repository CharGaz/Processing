//global variables

float xPoint;
float yPoint;
float Rad = 200;

void setup(){
  size(800,600);
  stroke(255);
  xPoint = width/2;
  yPoint = (height/2)-100;
}

void draw(){
  
  background(0,0,0);
  
  
  xPoint = xPoint + 1;
  
  
  //Changing the colour of the line and shape:
  if ( xPoint<= 100){
    stroke(255,0,0);
    line(xPoint,0, xPoint,width);
  }
  
  else if( xPoint <= 200){
    stroke(255,127,0);
    line(xPoint,0, xPoint,width);
  }
  
  else if( xPoint <= 300){
    square(xPoint-100, yPoint, Rad);
    fill(255,255,0);
    stroke(255,255,0);
    
  }
  
  else if( xPoint-100 <= 400){
    square(xPoint-100, yPoint, Rad);
    fill(127,255,0);
    stroke(127,255,0);
  }
  
  else if( xPoint-100 <= 600){
    circle(xPoint+50, yPoint+85, Rad);
    fill(0,255,255);
    stroke(0,255,255);
  }
  
  else if( xPoint <= 700){
    circle(xPoint-100, yPoint, Rad);
    fill(0,0,255);
    stroke(0,0,255);
  }
  
  else if( xPoint <= 800){
    line(xPoint,0, xPoint,width);
    stroke(127,0,255);
  }
  
  else{
    stroke(255,0,255);
  }
  
  //resetting line to start
  if(xPoint > width){
    
    xPoint = 0;
  }
}
