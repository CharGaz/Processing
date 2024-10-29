
int numPeople = 20;

Person[] person = new Person[numPeople];


color sick = color(255,0,0);
color healthy = color(0,255,0);
color doctor = color(0,0,255);

color[] colours = {sick, healthy, doctor};

void setup(){
  size(1000,1000);
  
  // Person jameli = new Person(50.0,360.0,7.0,0.0,255);
  // jameli.drawMe();

  for(int i = 0; i < person.length; i++){
    float xPos = random(20,width-20);  //The length of the radius away from the borders, the full ball will be in the canvas
    float yPos = random(20,height-20);
    float xVel = random(-4,4);
    float yVel = random(-4,4);


    person[i] = new Person(xPos, yPos, xVel, yVel, 40, colours[int(random(colours.length))]);
    
  }
}

void draw(){
  background(0);

  for(int i = 0; i < person.length; i++){
    person[i].drawMe();
    person[i].updatePos(); 
    for(int j = i+1; j < (person.length); j++){
      person[i].checkCollision(person[j]);
    }
  }
}