/* autogenerated by Processing revision 1293 on 2024-11-14 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import processing.sound.*;
import g4p_controls.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Processing extends PApplet {




boolean playSong = false;
boolean playStatus = false;
boolean displayPlay = true;

ArrayList<Song> playlist = new ArrayList<Song>();
int songIndex = 0;
public void setup(){
    /* size commented out by preprocessor */;
    background(197, 211, 232);

    playlist.add(new Song(this,"Benzi Box.mp3","hi", "Mouse and the Mask.jpeg"));
    playlist.add(new Song(this, "Darling I.mp3","hello","Chromakopia Album.jpeg" ));
    playlist.add(new Song(this,"St Chroma.mp3","greetings","Chromakopia Album.jpeg"));
    playlist.add(new Song(this, "Doomsday.mp3", "welcom","Operation Doomsday Album Cover.jpeg" ));
    
    createGUI();
}

public void draw(){
  background(197, 211, 232);
  drawUI();

  playlist.get(songIndex).playSong();

  if(!playlist.get(songIndex).song.isPlaying() && playStatus){
    playStatus = false;
    songIndex = (songIndex + 1) % playlist.size();
  }
}

public void drawUI(){
  // left frame
  fill(208, 232, 197);
  strokeWeight(0);
  rect(0, 0, 200, height);
  
  // bottom frame
  rect(200, height - 150, width, height - 150);
  
  // divisor lines
  stroke(166, 174, 191);
  fill(166, 174, 191);
  strokeWeight(2);
  rect(200, 0, 5, height);    // left line
  rect(205, height - 150, width, 5);    // bottom line
  
  if(displayPlay){
    play_button.setVisible(true);
    pause_button.setVisible(false);
  }
  else{
    play_button.setVisible(false);
    pause_button.setVisible(true);
  }
  
}

public void shufflePlaylist(ArrayList<Song> d){
    if(playlist.size() < 2){
        return;
    }

    for(int i = d.size() - 1; i > 0; i--){
        int j = PApplet.parseInt(random(i+1));
        Song temp = d.get(i);
        playlist.set(i,d.get(j));
        playlist.set(j,temp);
    }
}
class Song{
    String name;
    String album; //may be temperory
    String artWork; //may be temperory
    SoundFile song;
    PImage cover; //Only temp if art will not be displayed

    //CONSTRUCTOR
    Song(PApplet sketch, String n, String a, String aw){
        this.name = n;
        this.album = album;
        this.artWork = aw;
        this.song = new SoundFile(sketch, n, false);
        this.cover = sketch.loadImage(aw);
    }

    public void playSong(){
        if(playSong){
            if(!this.song.isPlaying() && !playStatus){
                this.song.play();
                playStatus = true;
            }
        }
        else if(!playSong && playStatus){
            this.song.pause();
            playStatus = false;
        }
    }
    public void stopSong(){
        if(this.song.isPlaying()){
            this.song.stop();
        }
    }

}
/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void playClicked(GImageButton source, GEvent event) { //_CODE_:play_button:242900:
  playSong = true;
  displayPlay = false;
} 

public void pauseClicked(GImageButton source, GEvent event) { //_CODE_:pause_button:527890:
  playSong = false;
  displayPlay = true;
} 

public void fastfowardClicked(GImageButton source, GEvent event) { //_CODE_:fast_foward_button:334872:
  playlist.get(songIndex).stopSong();
  songIndex = (songIndex + 1) % playlist.size();
  playStatus = false;
} //_CODE_:fast_foward_button:334872:

public void rewindClicked(GImageButton source, GEvent event) { //_CODE_:rewind_button:710650:
  playlist.get(songIndex).stopSong();
  songIndex = (songIndex-1 + playlist.size()) % playlist.size();
  playStatus = false;
} 

public void loopClicked(GImageButton source, GEvent event) { //_CODE_:loop_button:237365:
  println("loop_button - GImageButton >> GEvent." + event + " @ " + millis());
} 

public void shuffleClicked(GImageButton source, GEvent event) { //_CODE_:shuff_button:228625:
  if(playlist.get(songIndex).song.isPlaying()){
    playlist.get(songIndex).stopSong();
  }

  shufflePlaylist(playlist);
  songIndex = 0;

  playStatus = false;
  playSong = true;
  displayPlay = false;
  

} 

public void speedChanged(GSlider source, GEvent event) { //_CODE_:speed_slider:867952:
  println("speed_slider - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:speed_slider:867952:

public void volumeChanged(GSlider source, GEvent event) { //_CODE_:volume:779657:
  println("volume - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:volume:779657:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  play_button = new GImageButton(this, 400, 500, 100, 60, new String[] { "Black Play Button.png", "Black Play Button.png", "Black Play Button.png" } );
  play_button.addEventHandler(this, "playClicked");
  pause_button = new GImageButton(this, 375, 381, 100, 60, new String[] { "Black Pause Button.png", "Black Pause Button.png", "Black Pause Button.png" } );
  pause_button.addEventHandler(this, "pauseClicked");
  fast_foward_button = new GImageButton(this, 503, 293, 100, 60, new String[] { "Fast Forward Button.png", "Fast Forward Button.png", "Fast Forward Button.png" } );
  fast_foward_button.addEventHandler(this, "fastfowardClicked");
  rewind_button = new GImageButton(this, 361, 277, 100, 60, new String[] { "Rewind Button.png", "Rewind Button.png", "Rewind Button.png" } );
  rewind_button.addEventHandler(this, "rewindClicked");
  loop_button = new GImageButton(this, 227, 360, 100, 60, new String[] { "shuffle.png", "shuffle.png", "shuffle.png" } );
  loop_button.addEventHandler(this, "loopClicked");
  shuff_button = new GImageButton(this, 224, 458, 100, 60, new String[] { "shuffle.png", "shuffle.png", "shuffle.png" } );
  shuff_button.addEventHandler(this, "shuffleClicked");
  speed_slider = new GSlider(this, 515, 458, 100, 50, 10.0f);
  speed_slider.setShowValue(true);
  speed_slider.setShowLimits(true);
  speed_slider.setLimits(1.0f, 0.2f, 2.0f);
  speed_slider.setNbrTicks(7);
  speed_slider.setStickToTicks(true);
  speed_slider.setShowTicks(true);
  speed_slider.setNumberFormat(G4P.DECIMAL, 1);
  speed_slider.setOpaque(false);
  speed_slider.addEventHandler(this, "speedChanged");
  volume = new GSlider(this, 505, 383, 100, 50, 10.0f);
  volume.setShowValue(true);
  volume.setShowLimits(true);
  volume.setLimits(0.5f, 0.0f, 1.0f);
  volume.setNbrTicks(10);
  volume.setStickToTicks(true);
  volume.setShowTicks(true);
  volume.setNumberFormat(G4P.DECIMAL, 2);
  volume.setOpaque(false);
  volume.addEventHandler(this, "volumeChanged");
}


// Variable declarations 
// autogenerated do not edit
GImageButton play_button; 
GImageButton pause_button; 
GImageButton fast_foward_button; 
GImageButton rewind_button; 
GImageButton loop_button; 
GImageButton shuff_button; 
GSlider speed_slider; 
GSlider volume; 


  public void settings() { size(1200, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Processing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
