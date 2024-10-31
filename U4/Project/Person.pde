class Person{
    PVector pos;
    PVector vel;
    int diam;
    int timer;
    color status;
    boolean alive;
    boolean skull;

    //CONSTRUCTOR:
    Person(float x, float y, float xVel, float yVel, int d, color c){
        this.pos = new PVector(x,y);
        this.vel = new PVector(xVel,yVel);
        this.diam = d;
        this.timer = 0;
        this.status = color(c);
        this.alive = true;
        this.skull = false;
    }

    void drawMe(){
        if(this.alive == true){ //only runs when they are alive
            if(this.skull == false){ //setting the balls with their status
                fill(this.status);
                circle(this.pos.x, this.pos.y, diam);
            }

            else{ //After the infected die, they change into a skull for one second
                image(skullImage, this.pos.x,this.pos.y, 70, 70);
            }
        }


    }

    void updatePos(){
        if(this.alive == true){ //Only runs if they are alive
            this.pos.add(this.vel);

            if(this.pos.x <= this.diam/2 || this.pos.x >= width-(this.diam/2)){ //If they hit a wall, they bounce
                this.vel.x *= (-1);

                if(this.pos.x < diam/2){ //So they dont get stuck in the wall
                    float dist = diam/2- this.pos.x;
                    this.pos.x += dist;
                }
                if(this.pos.x > width - diam/2){ //So they dont get stuck in the wall
                    float dist  =this.pos.x - (width-diam/2);
                    this.pos.x -= dist;
                }
            }
            
            if(this.pos.y <= this.diam/2 || this.pos.y >= height-(this.diam/2)){ //If they hit a wall, they bounce
                this.vel.y *= (-1);

                if(this.pos.y < diam/2){ //So they dont get stuck in the wall
                    float dist = diam/2  - this.pos.y;
                    this.pos.y += dist;
                }
                if(this.pos.y > height - diam/2){ //So they dont get stuck in the wall
                    float dist = this.pos.y - (height-diam/2);
                    this.pos.y -= dist;
                }

            }


            
        }
    
    }

    void checkCollision(Person other){
        if((this.status == colours[0] && millis() - this.timer > 5000) || (other.status == colours[0] && millis() - other.timer > 5000)){
            return; //only runs when they have been infected for less then 5 seconds
        }
        if(this.alive == true){ //if they die, they no longer collide
            //checking the collisions between other balls
            PVector collided = new PVector(other.pos.x - this.pos.x, other.pos.y - this.pos.y);

            if(collided.mag() <= this.diam){
                PVector collidedHat = collided.normalize(null);

                float k = this.vel.dot(collidedHat) - other.vel.dot(collidedHat);
                PVector deltaVel = PVector.mult(collidedHat,-k);
                PVector deltaOtherVel = PVector.mult(collidedHat,k);

                if(collided.mag() <= diam){ //So they dont get stuck in eachother 
                    float dis = diam - collided.mag();

                    PVector delPos = PVector.mult(collidedHat, -dis/2);
                    PVector delOtherPos = PVector.mult(collidedHat, dis/2);
                    
                    this.pos.add(delPos);
                    other.pos.add(delOtherPos);
                }

                this.vel.add(deltaVel);
                other.vel.add(deltaOtherVel);

                if(this.skull == false){
                    if(this.status == colours[0] && other.status == colours[1]){ //making healthy people sick
                        other.status = colours[0]; //Turning the colour red
                        other.vel.mult(0.7); //Slowing the sick
                        other.timer = 0; //setting timer for infection
                    }
                    else if(this.status == colours[1] && other.status == colours[0]){ //making healthy people sick
                        this.status = colours[0]; //Turning the colour red
                        this.vel.mult(0.7); //Slowing the sick 
                        this.timer = millis(); //setting timer for infection
                    }

                    else if(this.status == colours[0] && other.status == colours[2]){ //making sick people healthy
                        this.status = colours[1]; //Turning the colour green
                        this.vel.mult(1.3); //Speeding the healthy up
                        this.timer = 0; //resetting timer
                    }
                    else if(this.status == colours[2] && other.status == colours[0]){ //making sick people healthy
                        other.status = colours[1]; //Turning the colour green
                        other.vel.mult(1.3); //Speeding the healthy up
                        other.timer = 0; //resetting timer
                    }
                }
            }
        }
    }

    void maybeDie(){
        if(millis()-this.timer > 5000){ //Checks if it has been 5 seconds since ball collided 
            if(this.status == colours[0]){ //Checks to see if they are red/infected
                this.skull = true; //Turns skull to true, so you can see the skull, but it does not infect 

                if(millis()-this.timer > 6000){ //Wait one second before skull disapears 
                    this.alive = false; //Making the skull disapear 
                    
                }

            } 
        }
    }
   
}