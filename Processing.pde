
int numPeople = 25; //getting the number of people


PImage skullImage; //setting a variable for skull image

Person[] person = new Person[numPeople]; //making an array for all the people


color sick = color(255,0,0); //Setting colour for each status 
color healthy = color(0,255,0);
color doctor = color(0,0,255);

color[] colours = {sick, healthy, doctor}; //Putting status into a list

void setup(){
  size(1000,1000);

  for(int i = 0; i < person.length; i++){ //runs for the amount of people in the list 
    float xPos = random(20,width-20);  //The length of the radius away from the borders, the full ball will be in the canvas
    float yPos = random(20,height-20); //random start
    float xVel = random(-5,5); //random speed in the x,y
    float yVel = random(-5,5);


    person[i] = new Person(xPos, yPos, xVel, yVel, 40, colours[int(random(colours.length))]); //making a class for each person 
    
  }

  skullImage = loadImage("Skull.jpg"); //loading in the skull image 
}

void draw(){
  background(0);
  

  for(int i = 0; i < person.length; i++){ //runs for all the people, to draw, update their position and check if they are dead
    person[i].drawMe();
    person[i].updatePos(); 
    person[i].maybeDie();



    for(int j = i+1; j < (person.length); j++){ //runs for each person, not itself, to check for collisions
      person[i].checkCollision(person[j]); 
    }
  }
  fill(255);
  textSize(25);
  text("TIME RUNNING: "+ millis()/1000 +"s", 25,50);
  
}