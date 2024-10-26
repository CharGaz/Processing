float LS, LS2;
float RS, RS2;

void setup(){
  for(float theta = 0; theta <= 30; theta+=1){
    float LS1 = cos(radians(theta));
    float RS1 = 1/(1/cos(radians(theta)));
    float LS2 = sin(radians(-1*theta));
    float RS2 = -1*sin(radians(theta));

    println(theta,LS1, "=", RS1, "-->", theta,LS2, "=", RS2);
   
  }
}