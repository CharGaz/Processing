class Plants{
    float dim;
    PVector posPlant;

    Plants(float x, float y){
        this.posPlant = new PVector(x,y);
    }
    
    void drawMe(){
        fill(53, 136, 86);
        circle(this.posPlant.x, this.posPlant.y, 50);
    }


}
