int valueOne, valueTwo; //num of rows and num of coloums 
int valueThree, valueFour; //x and y values 
int xBall, yBall;

void setup(){
  size(500,500);
  String[] lines = loadStrings("Grid.txt");
  String firstLine = lines[0];
  String secondLine = lines[1];

  String[] lineOne = firstLine.split("\t");
  String[] lineTwo = secondLine.split("\t");

  valueOne = int(lineOne[0]);
  valueTwo = int(lineOne[1]);

  valueThree = int(lineTwo[0]);
  valueFour = int(lineTwo[1]);

  println(valueOne, valueTwo);
  println(valueThree, valueFour);
}

void draw(){
  background(0);

  yBall = valueFour;

  for(int i = 0; i < valueOne; i++){
    xBall = valueThree;
      for(int c = 0; c < valueTwo; c++){
    circle(xBall, yBall,20 );
    fill(255,0,0);
    xBall+= 25;
  }
  yBall+= 25;
  }
}