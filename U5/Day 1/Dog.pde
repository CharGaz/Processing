class Dog extends Pet{
	String breed, emoState;

	Dog( String n, String g, String b ){
		super(n,g);
		this.breed = b;
		this.emoState = "normal";
	}

	void describe() {
		super.describe();
		println("I am a Dog and I am a", this.breed);
	}

}
