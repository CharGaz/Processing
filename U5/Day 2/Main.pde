import g4p_controls.*;

float radius=250;
int div = 100;
float angle = TWO_PI / div;
float control = 1;
float speed = 0.1;

// colours:
int red = 255; // needs to have at least one colour so the circle/lines are not black
int green, blue, t, last;

public void setup(){
    size(800,600);
    createGUI();
}

// function that "creates" y value, like f(x) = x^2 in math class
public float f(float x){
    return x+(x%3)*control+control;
}




public void draw(){
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
    control+= speed;
    
    //Timer that randomly changes the colour of the shape and lines every 6 seconds
    t = millis()-last;
    if(t >= 6000){
        last = millis();
        red = int(random(1,255));
        green = int(random(1,255));
        blue = int(random(1,255));
    }

}

//Function to get points of the circle
public PVector xyposition(float i){
    //finding and plotting points along the circles edge:
    float x = cos(angle * i) * radius;
    float y = sin(angle * i) * radius;

    return new PVector(x,y);
}