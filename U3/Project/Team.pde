class Team{
    String name;
    float overallRating;
    float flatRating;
    float hillyRating;
    float windyRating;
    float rainRating;
    float newOverallRating;

    //CONSTRUCTOR:
    Team(String n, float f, float h, float w, float r){
        this.name = n;
        this.flatRating = f;
        this.hillyRating = h;
        this.windyRating = w;
        this.rainRating = r;
        this.overallRating = (this.flatRating+this.hillyRating+this.windyRating+this.rainRating)/4;
        this.newOverallRating = this.overallRating;
    }

     //MEATHODS:
    void teamDescribe(){
        //Printing the team infow
        println("****************************************************");
        println("TEAM:",this.name);
        println("OVERALL RATING:", this.overallRating);
        println("FLAT RATING:", this.flatRating);
        println("HILLY RATING:", this.hillyRating);
        println("WINDY RATING:", this.windyRating);
        println("RAIN RATING:", this.rainRating);
        println("****************************************************");
    }

    void updateRatings(){

        //  Updating the all the ratings:
        if(courseConditions.get(0).elevation.equals("HILLY")){ //IF THE COURSE IS HILLY
            for(int i = 0; i < teams.size(); i++){
                if(this.hillyRating >= 5){ // Team rating will get better with hilly course if rating is above 5
                    this.hillyRating*= 1.5;
                    
                }
                else{
                    this.hillyRating*= 0.5; //Team will get worse with hilly course if rating is bellow 5 
                }
            }
        }

        else{
            for(int i = 0; i < teams.size(); i++){
                if(this.flatRating >= 5){ // Team rating will get better with flat course if rating is above 5
                    this.flatRating*= 1.5;
                }
                else{
                    this.flatRating*= 0.5; //Team will get worse with flat course if rating is bellow 5 
                }
            }
        }

        if(weatherConditions.get(0).windy){
            for(int i = 0; i < teams.size(); i++){
                if(this.windyRating >= 5){ // Team rating will get better with a windy day if rating is above 5
                    this.windyRating*= 1.5;
                    
                }
                else{
                    this.windyRating*= 0.5; //Team will get worse with a windy day if rating is bellow 5 
                }
            }
        }

        if(weatherConditions.get(0).raining){
             for(int i = 0; i < teams.size(); i++){
                if(this.rainRating >= 5){ // Team rating will get better with a rainy day if rating is above 5
                    this.rainRating*= 1.5;
                    // return(teams.get(i).rainRating);
                }
                else{
                    teams.get(i).rainRating *= 0.5; //Team will get worse with a rainy day if rating is bellow 5 
                    // return(teams.get(i).rainRating);
                }
            }
            
        }
        // Updating the overall rating based on the conditions of the day and the course:

        if(courseConditions.get(0).elevation.equals("HILLY")){ //IF THE COURSE IS HILLY
            if(weatherConditions.get(0).raining){
                if(weatherConditions.get(0).windy){
                    this.overallRating = (this.hillyRating+this.windyRating+this.rainRating)/3;
                }

                else{
                    this.overallRating = (this.hillyRating+this.rainRating)/2;
                }
            }
            else if(weatherConditions.get(0).dry){
                if(weatherConditions.get(0).windy){
                    this.overallRating = (this.hillyRating+this.windyRating)/2; //Teams dont get better when dry, just no more rainrating to factor into new rating
                }

                else{
                    this.overallRating = this.hillyRating;
                }
            }
        }

        if(courseConditions.get(0).elevation.equals("FLAT")){ //IF THE COURSE IS HILLY
            if(weatherConditions.get(0).raining){
                if(weatherConditions.get(0).windy){
                    this.overallRating = (this.flatRating+this.windyRating+this.rainRating)/3; 
                }

                else{
                    this.overallRating = (this.flatRating+this.rainRating)/2;
                }
            }
            else if(weatherConditions.get(0).dry){
                if(weatherConditions.get(0).windy){
                    this.overallRating = (this.flatRating+this.windyRating)/2; //Teams dont get better when dry, just no more rainrating to factor into new rating
                }

                else{
                    this.overallRating = this.flatRating;
                }
            }
        }

        println("UPDATED RATING FOR", this.name, "BASED OFF COURSE AND WEATHER CONDITIONS: ");
        println("NEW OVERALL RATING: "+ this.overallRating);
        println("****************************************************");
    }

}