PVector xyPos;
PVector velocity;
PVector accel;

int yGround = 800;
float wind = -0.12; //change this to change the wind factor

void setup(){
  size(1000,1000);
  background(0);

  xyPos = new PVector(20, yGround-20);
  velocity =  new PVector(12,-10);
  accel = new PVector(wind,0.30);

  stroke(255,0,0);
  line(0,yGround, width,yGround);

}

void draw(){
  
  stroke(0);
  fill(100,0,200);
  circle(xyPos.x,xyPos.y, 40);


  if(xyPos.y <= yGround - 20){
    xyPos.add(velocity);
    velocity.add(accel);
  }

}