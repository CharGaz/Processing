import processing.sound.*;
import g4p_controls.*;
SoundFile benzi_box;
PImage img;

boolean playSong = false;


void setup(){
    size(800,800);
    background(0);
    


    benzi_box = new SoundFile(this, "Benzi Box.mp3");
    
    
    img = loadImage("Mouse and the Mask.jpeg");
   
    createGUI();
}

void draw(){
    image(img,0,0);

    if(playSong){
        if(!benzi_box.isPlaying()){ //Stops the song from playing 30 times per second
            benzi_box.play();
        }
    }  
    if(!playSong){
        benzi_box.pause();
    }
    
}
