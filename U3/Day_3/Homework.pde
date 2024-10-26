
Rabbit jameli = new Rabbit("Jimmy", 400, 315, "male", 2, 75, color(160, 100, 100 ), 2);  //update this
Rabbit vidul = new Rabbit("vidul", 100, 420, "female", 5, 35, color(255, 255, 0), 7);
Plants hi = new Plants(random(width),random(height));

void setup() {
  size(600, 600);
  rectMode(CENTER);
  textAlign(CENTER);

  

}

void draw() {
  background(0, 255, 50);
  
  jameli.drawMe();
  vidul.drawMe();

  hi.drawMe();
  
  jameli.move();
  vidul.move();
}
