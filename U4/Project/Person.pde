class Person{
    PVector pos;
    PVector vel;
    int diam;
    color status;

    //CONSTRUCTOR:
    Person(float x, float y, float xVel, float yVel, int d, color c){
        this.pos = new PVector(x,y);
        this.vel = new PVector(xVel,yVel);
        this.diam = d;
        this.status = color(c);
    }

    void drawMe(){
        fill(this.status);
        circle(this.pos.x, this.pos.y, 40);
    }

    void updatePos(){
        this.pos.add(this.vel);

        if(this.pos.x <= this.diam/2 || this.pos.x >= width-(this.diam/2)){
            this.vel.x *= (-1);
        }
        
        if(this.pos.y <= this.diam/2 || this.pos.y >= height-(this.diam/2)){
            this.vel.y *= (-1);
        }
    
    }

    void checkCollision(Person other){
        PVector collided = new PVector(other.pos.x - this.pos.x, other.pos.y - this.pos.y);

        if(collided.mag() <= this.diam){
            PVector collidedHat = collided.normalize(null);

            float k = this.vel.dot(collidedHat) - other.vel.dot(collidedHat);
            PVector deltaVel = PVector.mult(collidedHat,-k);
            PVector deltaOtherVel = PVector.mult(collidedHat,k);

            this.vel.add(deltaVel);
            other.vel.add(deltaOtherVel);


            if(this.status == colours[0] && other.status == colours[1]){ //making healthy people sick
                other.status = colours[0]; //Turning the colour red
                other.vel.mult(0.7); //Slowing the sick
            }
            else if(this.status == colours[1] && other.status == colours[0]){ //making healthy people sick
                this.status = colours[0]; //Turning the colour red
                this.vel.mult(0.7); //Slowing the 
            }

            else if(this.status == colours[0] && other.status == colours[2]){ //making sick people healthy
                this.status = colours[1]; //Turning the colour green
                this.vel.mult(1.3);
            }
            else if(this.status == colours[2] && other.status == colours[0]){ //making sick people healthy
                other.status = colours[1]; //Turning the colour green
                other.vel.mult(1.3);
            }
        }
    }
}