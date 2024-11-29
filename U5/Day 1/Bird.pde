class Bird extends Pet{
    boolean canFly;

    Bird(String name, String gender, boolean canFly) {
        super(name, gender);
        this.canFly = canFly;
    }


  void describe() {
        super.describe();
        String flyAbility = canFly ? "I can fly!" : "I can't fly.";
        println("I am a bird and", flyAbility);
    }
}