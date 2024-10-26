class Dog{
  //fields:
  String name;
  String gender;
  String breed;
  float weight;
  String emotion;
  float aggression;

  //constructor:
  Dog(String n, String g, String b, float w){
    this.name = n;
    this.gender = g;
    this.breed = b;
    this.weight = w;
    this.emotion = "normal";
    this.aggression = round(random(0,5) * 10) * 0.1; //rounding aggression level to 1 decimal
  }

  void describe(){
    println("Hi my name is", this.name + ". I'm a", this.gender, this.breed + ". I weigh", this.weight + " pounds." +
             " I am", this.emotion+". I am at a", this.aggression, "level of aggression" );
  }

  void getTreat(float treatWeight){
    weight += treatWeight;
    println(this.name, "got a treat!");
    this.emotion = "fat and happy";
  }

  void takeToVet(){
    println(this.name, "is at the vet");
    this.emotion = "nervous";
  }

  void bark(){
    println("Woof! says", this.name);
    this.aggression = round((this.aggression * 0.9)*10) * 0.1;
  }

  void barkDescribe(){
    println("I am now at a", this.aggression, "level of aggression");
  }
} 
void setup(){
  Dog myPet = new Dog("Mandy", "female", "rottweiler", 80);
  Dog yourPet = new Dog("Peanut", "male", "terrier", 35);
  
  myPet.describe();
  myPet.getTreat(10);
  myPet.describe();
  println();


  yourPet.describe();
  yourPet.takeToVet();
  yourPet.describe();
  println();

  for(int i = 0; i <= 4; i++){
    myPet.bark();
    myPet.barkDescribe();
    println();

    yourPet.bark();
    yourPet.barkDescribe();
    println();

  }
    
  exit();
}