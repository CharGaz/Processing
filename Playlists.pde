
void initializePlaylists(){
  //Adding all the songs to defult playlist --> has every song 
  defaultPlaylist.add(new Song(this,"Benzi Box.mp3","Mouse and the Mask", "Mouse and the Mask.jpeg"));
  defaultPlaylist.add(new Song(this,"Doomsday.mp3", "Operation: DOOMSDAY","Operation Doomsday Album Cover.jpeg" ));
  defaultPlaylist.add(new Song(this,"Rhymes Like Dimes.mp3", "Operation: DOOMSDAY","Operation Doomsday Album Cover.jpeg" ));
  defaultPlaylist.add(new Song(this,"Potholderz.mp3", "MM Food","MM Food.jpeg" ));
  defaultPlaylist.add(new Song(this,"Deep Fried Frenz.mp3", "MM Food","MM Food.jpeg" ));
  defaultPlaylist.add(new Song(this,"Crosshairs.mp3", "Mouse and the Mask","Mouse and the Mask.jpeg" ));
  defaultPlaylist.add(new Song(this,"Darling I.mp3","Chromakopia","Chromakopia Album.jpeg" ));
  defaultPlaylist.add(new Song(this,"St Chroma.mp3","Chromakopia","Chromakopia Album.jpeg"));
  defaultPlaylist.add(new Song(this,"See You Again.mp3","Flower Boy","Flower Boy.jpeg"));
  defaultPlaylist.add(new Song(this,"911 Mr lonely.mp3","Flower Boy","Flower Boy.jpeg"));
  defaultPlaylist.add(new Song(this,"Pink White.mp3","Blonde","Blonde.jpeg"));
  defaultPlaylist.add(new Song(this,"Goodbye Angels.mp3","The Getaway","The Getaway.jpeg"));
  defaultPlaylist.add(new Song(this,"Sick Love.mp3","The Getaway","The Getaway.jpeg"));
  defaultPlaylist.add(new Song(this,"White Braids & Pillow Chair.mp3","Unlimited Love","Unlimited Love.jpeg"));
  defaultPlaylist.add(new Song(this,"Black Summer.mp3","Unlimited Love","Unlimited Love.jpeg"));
  defaultPlaylist.add(new Song(this,"Billie Jean.mp3","Thriller","Thriller.jpeg"));


  

  //Setting up  playlist1
  playlist1.add(new Song(this,"Potholderz.mp3", "MM Food","MM Food.jpeg" ));
  playlist1.add(new Song(this,"Black Summer.mp3","Unlimited Love","Unlimited Love.jpeg"));
  playlist1.add(new Song(this,"St Chroma.mp3","Chromakopia","Chromakopia Album.jpeg"));
  playlist1.add(new Song(this,"911 Mr lonely.mp3","Flower Boy","Flower Boy.jpeg"));
  playlist1.add(new Song(this,"Crosshairs.mp3", "Mouse and the Mask","Mouse and the Mask.jpeg" ));
  playlist1.add(new Song(this,"Pink White.mp3","Blonde","Blonde.jpeg"));


  //Setting up playlist2
  playlist2.add(new Song(this,"Rhymes Like Dimes.mp3", "Operation: DOOMSDAY","Operation Doomsday Album Cover.jpeg" ));
  playlist2.add(new Song(this,"Doomsday.mp3", "Operation: DOOMSDAY","Operation Doomsday Album Cover.jpeg" ));
  playlist2.add(new Song(this,"Benzi Box.mp3","Mouse and the Mask", "Mouse and the Mask.jpeg"));
  playlist2.add(new Song(this,"Billie Jean.mp3","Thriller","Thriller.jpeg"));
  playlist2.add(new Song(this,"See You Again.mp3","Flower Boy","Flower Boy.jpeg"));
  playlist2.add(new Song(this, "Crosshairs.mp3", "Mouse and the Mask","Mouse and the Mask.jpeg" ));
  playlist2.add(new Song(this,"Goodbye Angels.mp3","The Getaway","The Getaway.jpeg"));
  playlist2.add(new Song(this,"St Chroma.mp3","Chromakopia","Chromakopia Album.jpeg"));
  playlist2.add(new Song(this, "Darling I.mp3","Chromakopia","Chromakopia Album.jpeg" ));



  
  //Adding all the playlists to 2d array
  allPlaylists.add(defaultPlaylist);
  allPlaylists.add(playlist1);
  allPlaylists.add(playlist2);  
 

  //Adding the playlist names to an arraylist 
  displayNames.add("All Songs");
  displayNames.add("Playlist 1");
  displayNames.add("Playlist 2");

}
void shufflePlaylist(ArrayList<Song> p){ //Takes in a playlist
    if(p.size() < 2){ //If the playlist is 2 songs than it cannot be shuffled
        return;
    }

    //Resets each song in playlist to make sure it starts from beginning of song 
    for(Song song : p){
      song.reset();
    }

    for(int i = p.size() - 1; i > 0; i--){ //Goes through the size of the playlist
      //Mixes all the songs up by assing random values to then setting the songs at that value
      int j = int(random(i+1));
      Song temp = p.get(i);
      p.set(i,p.get(j));
      p.set(j,temp);
    }
   
}

void deletePlaylist(){ //draws the boxes that surround playlist names and deletes playlists
    int x = 275;
    int y = 50;
    
    boolean playlistDeleted = false;
    
    
    for(int i = allPlaylists.size() - 1; i >= 1; i--){
        drawPlaylist(i, x, y); //Drawing the names of playlist
        
        

        //drawing the boxes 
        noFill();
        strokeWeight(5);
        rect(x-40,y-25, 125,50);
        

        if(mousePressed && mouseX > x-40 && mouseX < x+85 && mouseY > y-25 && mouseY < y+50){ //Checking if the user presses inside the boxes
            //deleting the selected playlist from the list that holds all playlists and from the display names
            allPlaylists.remove(i);
            displayNames.remove(i);
            playlistDeleted = true;
            show_playlist.setItems(displayNames,0); //Updating the drop down menu
            break;
        }

        x += 180; //Updating x value to move boxes over

        if(x > 900){ //Checking to see if x moves past the panal
            x = 275; //Reseting x value
            y += 75; //moving y value down to create a new row
        }
    }

    if (playlistDeleted) {
        mousePressed = false; //If a playlist gets deleted mousePressed goes to false to make user have to click again to delete another playlist
    }  
}

void drawPlaylist(int i, int x, int y){ //Draws the playlist names when deleting a playlist
    String displayName = displayNames.get(i); //Gets the playlist name to be drawn in correct box
    float fontSize = 16; //set font size
    textSize(fontSize);

    while(textWidth(displayName) > 105){ //Cheking if playlist name is to big to fit in box
        fontSize -= 0.5; //adjusting font size to fit in the box
        textSize(fontSize); //Setting text size to new font size
    }

    //drawing the playlist names
    fill(0);
    textAlign(CENTER,CENTER);
    text(displayName, x+20, y);

    
}

void createNewPlaylist(){ //Creating new playlist
    if(selectedSongs.isEmpty()){ //Chekcing if any songs are selected when user presses confirm 
        println("No songs selected!");
        return;
    }

    
    String newPlaylistName = "Playlist " + displayNames.size(); //Creating the playlist name 

    displayNames.add(newPlaylistName); //Adding new playlist name to display name list

    ArrayList<Song> newPlaylist = new ArrayList<Song>(); //Creating new playlist(Arraylist of songs)

    for(Song song : selectedSongs){ //Going through all the selected songs by the user 
        newPlaylist.add(song); //Adding the selected songs to new playlist
    }

    allPlaylists.add(newPlaylist); //Adding new playlist to list of all playlist

    selectedSongs.clear(); //Clearing selected songs

    show_playlist.setItems(displayNames,0); //Updating dropdown menu to have new playlist in it
}

void playlistCreateDisplay(){ //displaying the screen to create a new playlist
    drawSongs(); //Drawing all the songs so user can select them
    //Setting up x and y values
    int x = 275; 
    int y = 50;  

    for(int i = 0; i < defaultPlaylist.size(); i++){ // going througn all the songs
        Song song = defaultPlaylist.get(i); //Creating a value/song for each song in the defaultPlaylist(All the songs in the program)

        // Check if mouse is over the current song
        if (mousePressed && mouseX > x - 40 && mouseX < x + 85 && mouseY > y - 25 && mouseY < y + 50) {
            if(!selectedSongs.contains(song)){ //Cheking if the song was already clicked by the user
                selectedSongs.add(song); //Adding the selected song into selected song list as to be added to the new playlist
                song.clicked = true; // Mark the song as clicked
                
            }
        }
        // Update position for the next song
        x += 180; 
        if (x > 900) { // Check if the row is full
            x = 275; //reseting x value
            y += 75; //changing y value to make a new row 
        }
    }
}
