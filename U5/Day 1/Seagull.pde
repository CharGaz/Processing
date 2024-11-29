class Seagull extends Bird {
  Seagull(String name, String gender) {
    super(name, gender, true);
  }

  
  void describe() {
    super.describe();
    println("I am a seagull!");
  }
}