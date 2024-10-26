float xVal, yVal, radius, CirColour;
String colour;
void setup(){
    size(800,600);
    String request = "Draw a red circle at center (56.8, 225) with radius 135";

    //finding colour:
    int findcolour = request.indexOf("c");
    findcolour = findcolour-1;
    
    int space = request.indexOf(" ");
    space = space+3;

    String colour =  request.substring(space,findcolour);
    

    //Finding x and y and radius:
    
    int BracketOne =  request.indexOf("(");
    int comma = request.indexOf (",");
    int BracketTwo = request.indexOf(")");
    
    String xCord = request.substring(BracketOne+1, comma);
    xVal = float(xCord);
    
    String yCord = request.substring(comma+1, BracketTwo);
    yVal = float(yCord); 
    
    int s = request.indexOf("s");
    String findradius = request.substring(s+2); 
    radius = float(findradius);
}

void draw(){
  background(0,0,0);
  
  if(colour.equals("red"))
    fill(255,0,0);
    
  else if(colour.equals("green"))
     fill(0,255,0);
  else
    fill(0,0,255);
  
  circle(xVal,yVal, radius);
 

}