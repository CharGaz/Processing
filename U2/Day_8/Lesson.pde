
//PART 1 OF LESSON
// float getAverage(int[] values){
//   int n = values.length; // finding the length of the array: {2,8,9}, n = 3 due to 3 numbers in the array
//   int sum = 0;
//   for(int i = 0; i < n; i++ ){
//     sum+=values[i]; //adding all the numbers together; sum={2+8+9}
//   }
//   return (float) sum/n; // returning the average
// }

// void setup(){
//   int[] a = {2,3,9,19}; //any amount of numbers can go in this 
//   println(getAverage(a));
//   exit();
// }
// *****************************************************************//


// PART 2 OF LESSON
int[] getRandomEvenArray(int numValues, int maxValue){
  int[] a =new int[numValues];

  for(int i = 0; i < numValues; i++){
    int randomNumber = (int) random(0, maxValue/2);
    int anEvenNumber = randomNumber*2;
    a[i] = anEvenNumber;
  }
  return a;
} 

void setup(){
  int[] anEvenArray = getRandomEvenArray(6,100);
  println(anEvenArray);
  exit();
}