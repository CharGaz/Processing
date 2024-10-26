int numBalls;
float x = 0, y = 0;
int selectedRow = -1; //set as this so no row is selected at first
boolean drag = false;
int[][] d;
int nRows;
int[] distance;

PVector[] circleCoords;
PVector lastMousePosition;
void setup(){
 size(900,700);
 String[] lines = loadStrings("Project Data.txt"); //Reading the Data
 d = new int[lines.length][4];
 numBalls = int(lines[0]);
 
 for(int r = 1; r < lines.length; r++){
 
   String[] nLine = lines[r].split("\t");


   for(int i = 0; i < nLine.length; i++ ){
     d[r-1][i] = int(nLine[i]);
   }
 }
 
 nRows = lines.length-1;
 distance = new int[lines.length-1];
 circleCoords = new PVector[nRows];
 
 for(int i = 1; i<lines.length; i++) {
   distance[i-1] = d[i-1][3];
   println(d[i-1][3]);
 }
 
 int height = distance[0];
 for (int i = 0; i<nRows; i++) {
   circleCoords[i] = new PVector(90, height);
   if (i<distance.length-1) {
     height += distance[i+1];
   }
 }
 println(circleCoords);
 println(distance);
 
 lastMousePosition = new PVector(mouseX, mouseY);
}


void draw(){
 background(0);
 for(int i = 0; i < 4; i++){
   
  fill(d[i][0],d[i][1],d[i][2]);
   for(int c = 0; c < numBalls; c++){
     x = circleCoords[i].x + c * 120;
     y = circleCoords[i].y;
     circle(x,y,35);
   }
 }
 
 noFill();
 stroke(255);
 
 for (int i = 0; i<nRows-1; i++) {
   for (int j = 0; j<numBalls; j++) {
     float x1 = circleCoords[i].x + j * 120;
     float y1 = circleCoords[i].y;
     for (int k = 0; k<numBalls; k++) {
       float x2 = circleCoords[i+1].x + k * 120;
       float y2 = circleCoords[i+1].y;
       line(x1, y1, x2, y2);
   }
   }
  }
}

void mousePressed() {
  int depth = 0; 
  lastMousePosition.set(mouseX, mouseY);
  for(int i = 0; i < 4; i++){
    float rowY = circleCoords[i].y;  
    if(mouseY > rowY-30 && mouseY < rowY+30){//Checking if the mouse is within the height of a circle 
      selectedRow = i; //The row that was clicked is now selected and ready to move 
      drag = true;
      break;
    } 
  }
}




void mouseDragged(){
 if (drag && selectedRow != -1) {
   
   float x = mouseX - lastMousePosition.x;
   float y = mouseY - lastMousePosition.y;
   
   circleCoords[selectedRow].x += x;
   circleCoords[selectedRow].y += y;
   
   lastMousePosition.set(mouseX, mouseY);
   redraw();
 }
}

void mouseReleased() {
  drag = false;
  selectedRow = -1;
}
