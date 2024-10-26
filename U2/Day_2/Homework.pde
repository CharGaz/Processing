//Creating function
int f( String x){
  
  //finding how many letters are in the word
  int numChar = x.length();
  
  //returning answer
  return(numChar);
}

void setup(){
  
  int num = f("hello");
  println("This word has " + num + " amount of Characters");
  
}
