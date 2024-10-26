float radius=250;
int div = 100;
float angle = TWO_PI / div;
float control = 1;

// colours:
int red = 255; // needs to have at least one colour so the circle/lines are not black
int green, blue, t, last;

void setup(){
    size(800,600);
}

// function that "creates" y value, like f(x) = x^2 in math class
float f(float x){
    return x+(x%3)*control+control;
}




void draw(){
    background(0);
    translate(width/2, height/2); // moves circle to middle of the screen

    //Drawing the circle:
    circle(0,0, radius*2);
    noFill();
    stroke(red,blue,green);
    strokeWeight(1);

    //getting values to draw the lines, and drawing lines
    for(int i = 0; i < div; i++){
        float x = i;
        float y = f(x);

        PVector start = xyposition(x);
        PVector end = xyposition(y);

        line(start.x,start.y, end.x,end.y);
    }
    //adjusts how fast the lines move
    control+= 0.1;
    
    //Timer that randomly changes the colour of the shape and lines every 10 seconds
    t = second()-last;
    if(t >= 10){
        last = second();
        red = int(random(1,255));
        green = int(random(1,255));
        blue = int(random(1,255));
    }

}

//Function to get points of the circle
PVector xyposition(float i){
    //finding and plotting points along the circles edge:
    float x = cos(angle * i) * radius;
    float y = sin(angle * i) * radius;

    return new PVector(x,y);
}