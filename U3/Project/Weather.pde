class Weather{
    Boolean raining;
    Boolean dry;
    Boolean windy;

    // CONSTRUCTOR:
    Weather(Boolean r, Boolean d, Boolean w){
        this.raining = r;
        this.dry = d;
        this.windy = w;
    }

     //MEATHODS:
    void weatherDescribe(){
        if(this.raining){
            if(this.windy){ //if it is rainy and windy
                println("IT IS CURRENTLY RAINING AND IS WINDY");
                println("****************************************************");
                
            }

            else{ //if it is just raining 
                println("IT IS CURRENTLY RAINING");
                println("****************************************************");
               
            }
        }

        else if(this.dry){
            if(this.windy){ //if it is dry and windy
                println("IT IS CURRENTLY DRY AND IS WINDY");
                println("****************************************************");
                
            }

            else{ //if it is just dry
                println("IT IS CURRENTLY DRY");
                println("****************************************************");
                
            }
        }

        else if(this.windy){ //if it is just windy
            println("IT IS CURRENTLY WINDY");
            println("****************************************************");
            
        }
    }
}