void setup() {
  Pet[] myZoo = new Pet[] { new Dog("Max", "male", "Golden Retriever"), new Seagull("Steven", "male"), new Bird("Polly", "female", true) };
  // Loop through the array and call describe()
  for (Pet pet : myZoo) {
    pet.describe();
  }
  
  exit();
}