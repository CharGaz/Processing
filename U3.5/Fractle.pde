float aMin = -1.1 + (0.2); //set to -2 and 1 to see the whole picture, more negitve aMin = more right, change second val.
float aMax = 7.2*pow(10,-5.3) ;   //Lower aMax and bMax are the more zoomed in the picture is 

float bMin = -1.1 + (0.2); //More negitive bMin moves the fractle down
float bMax = 7.2*pow(10,-5.3); //set to -1.5 and 1.5 to see the whole picture

void setup() {
  size(1000,1000);
  background(0);
  noLoop();

}

void draw(){
  for(int x = 0; x <= width; x++){
    float a = get_a(x);

    for(int y = 0; y <= height; y++){
      float b = get_b(y);

      ComplexNum c = new ComplexNum(a,b);
      ComplexNum z = c;
      int row = 1;

      while(z.absoluteValue() < 2 && row < 200){
        z  = c.add(z.times(z));
        row++;
      }

        if (row == 200) {
          float absRatio = x * z.absoluteValue()/c.absoluteValue();
          stroke( absRatio*0, absRatio*0, absRatio/2 );
       }
            
        else {
          float shade = 30*(float(row)/200)*255;
          stroke( shade*0, shade/15, shade/4 );
        }

        point(x,y);

    }
  }
}


float get_a(float xPixel){
  return((((aMax-aMin)/width)*xPixel)+aMin);

}

float get_b(float yPixel){
  return((((bMin-bMax)/height)*yPixel)+bMax);
}