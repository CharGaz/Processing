void setup() {     
    int[] a;   
    
    for ( int i = 0; i < a.length; i++ )  {
        a[ i ] = int(random( n*5 ));  
    }
    
   
   int[] c = mergeSort(a, 0, a.length-1);
   
   printArray( c ); 
   exit();
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