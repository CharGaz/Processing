void setup() {
  int[] roundWinners = {};
  
  for (int i=0;i<200000;i++){
    roundWinners = append(roundWinners, int(random(0,10)));
  }
  
  long startTime = millis();
  
  println(numFrequency( roundWinners ));
  
  long elapsedTime = millis() - startTime;
  println("Completed in", elapsedTime, "ms");  
  exit();
}

int numFrequency( int[] a){
  int[] c = mergeSort(a,0,a.length-1); //c is the sorted array
  int maxCount = 1;
  int index = 1;
  int val = c[0];
  for(int i = 1; i < a.length; i++){
    if(c[i] == c[i-1]){
      index++;
    }
    else{
      index = 1;
    }
    if(index > maxCount){
      maxCount = index;
      val = c[i];
    }
    
  }
  return val;
}



int[] mergeSort( int[] a, int start, int end){
  if(start == end){
    int[] d = { a[start] };
    return d;
  }

  else{
    int mid = (start+end)/2;
    int[] sortedLeft = mergeSort(a,start,mid);
    int[] sortedRight = mergeSort(a, mid+1, end);
    
    return merge(sortedLeft, sortedRight);


  }
}

int[] merge( int[] a, int[] b ) {
  int[] c = new int[ a.length + b.length ]; //what size should c be?
  
  int i = 0;   //i is the current index for a
  int j = 0;   //j is the current index for b 
  
  for(int k = 0; k < c.length; k ++){  
    if(i > a.length-1){
      c[k] = b[j];
      j++;
      continue;
    }
    else if(j > b.length-1){
      c[k] = a[i];
      i++;
      continue;
    }

    if( a[i] < b[j]){
      c[k] = a[i];
      i++;
     
    }
    else{
      c[k] = b[j];
      j++;
    }
    
  }
  return c;
}