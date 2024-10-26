class Race{
    float distance;

    //CONTRUCTOR:
    Race(float d){
        this.distance = d;
    }

    //MEATHODS:
    void simulateRace(){
        float winProb[] = new float[teams.size()];
        int index[] = new int[teams.size()];


        for(int i = 0; i < teams.size(); i++){
            winProb[i] = teams.get(i).overallRating * random(1,10); // makes the sim. somewhat random, better odds still have greater chance of winning, but there could be an upset
            index[i] = i;
        }

        // Sorting the array to find the top 3 teams and keeping the names of the teams in the correct place
        for(int i = 0; i < teams.size()-1; i++){
            for(int j = i + 1; j < teams.size(); j++){
                if(winProb[index[i]] < winProb[index[j]]){
                    int tempIndex = index[i];
                    index[i] = index[j];
                    index[j] = tempIndex;
                }
            }
        }

        //printing who won onto terminal
        println("****************************************************");
        println("THE WINNER OF THE " + this.distance + "KM RACE IS: ");
        println(teams.get(index[0]).name);
        println("");
        println("Second place is " + teams.get(index[1]).name);
        println("Third place is " + teams.get(index[2]).name);

        //printing who won onto the canvas
        textSize(100);
        text("The winner is:",100,200);
        

        textSize(100);
        text(teams.get(index[0]).name, 100,300);
        
    }
}