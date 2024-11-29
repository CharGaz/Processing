class Pet{
    String name, gender;

    Pet( String n, String g) {
		this.name = n;
		this.gender = g;
		
	}

	void describe(){
		println("My name is", this.name, ". I am", this.gender);
	}
    
}