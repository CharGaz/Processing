void setup(){
  size(500,300);
  background(0);
  }

void draw(){
  int y = 50;
  
  for(int row = 0; row <6; row++){
    int x = 100;

    for(int col = 0; col < 10; col++){
    square(x,y,25);

    x+=25;
    }
    y+=25;
  }


}