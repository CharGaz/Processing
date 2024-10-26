//global variables
int divider, rad, squaredfactor, n, factsqrt, smallrad;
String radSimplified;

IntList factors;
int[] cases = {2435,75,16,1,0,-1,-64,-74,-1200};
int listLength = cases.length;
String returnRad;

void setup(){
size(800,600);
for(int i = 0; i < listLength; i++){
  radSimplified = simplifyRad((cases[i]));
  println(radSimplified);
}
}

String simplifyRad(int n){
  boolean neg = false, mixedRad = false;//Setting exeptions to flase

  //Checking to see if n is a negitive number, setting n to a positive
  if (n < 0){
    n = n *-1;
    neg = true; // when neg is true, an i will be printed with the radical to make it imaginary
  }
  //Finding if the number is a perfect square 
  for( int i = int(sqrt(n)); i > 1; i--){
    
   if(n % (pow(i,2)) == 0){
     divider = i;
     rad = n / divider;
     break;
   }
    
    else{
      //Finding factors of n:
      factors = new IntList();
      for(i = 1; i <= sqrt(n); i++){
        if (n % i == 0){
          factors.append(i);
          if(i != n / i){
            factors.append(n/i);
          }
        }
      }
      // sorting factors from least to greatest 
      factors.sort();

      //Finding size of the list:
      int size = factors.size();
      
      // If n only has 2 factors(1,n):
      if(size == 2){
        rad = n;
      }  
      
      //Finding the factors of 'n' that are perfect squares
      else{
        mixedRad = true; // will have to be a mixed radical if this code has to run
        for(int f = 0; size >= 1; f++){
          size = size - 1;
          int factor = factors.get(size);
          
          //Testing to see if a factor of n is a perfect square
          //This is done by rooting the factor of n, 
          //then squaring that answer and seeing if the orginal factor is the same as the newly squared number
          factsqrt = int(sqrt(factor));
          int testfactor = int(sq(factsqrt));
          if(factor == testfactor){

            //finding the perfect square factors partner/ the small radical
            //(e.g., factor = 4, its pair to make 12 is 3, also what the sqrt is)
            smallrad = factors.get(f);
            break;
          }
        }
      }
    break;
   }
  }

  //Print statments for any case:
  if(n == 1){
    returnRad = "1";
  }
  else if(n==0){
    returnRad = "0";
  }
  else if(neg == false && mixedRad == false){
     returnRad = rad+"";
  } 
  else if(rad == n && neg == false){
    returnRad = "\u221a"+rad;
  }
  
  else if(mixedRad == true && neg == false){
    returnRad = factsqrt+"\u221a"+smallrad;
  }

  else if(rad == n){
    returnRad = "\u221a"+rad+"i";
  }

  else if(mixedRad == true && neg == true){
    returnRad = factsqrt+"\u221a"+smallrad+"i";
  }
  
  else if(neg == true && n == 1){
    returnRad = "i";
  }
  
  else {
     returnRad = rad+"i";
  }
  return(returnRad);
}

//Drawing answers on screen
void draw(){
  Drawtext(listLength, radSimplified);
}

//function to be able to put all the answers on the screen:
void Drawtext(int listLength, String radSimplified){
  int xpos = 40;
  int ypos = 40;
  String radsymbol = "\u221a";
  for(int i = 0; i < listLength; i++){
    textSize(40);
    text(radsymbol+cases[i]+"="+simplifyRad((cases[i])), xpos,ypos);
    fill(0);
    ypos = ypos + 40;
    fill(0);
  }
}