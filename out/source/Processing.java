/* autogenerated by Processing revision 1293 on 2024-12-02 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Processing extends PApplet {

int n = 20; //size of array

public void setup() {  
  if( n > 1){
    //making array full of random values
    int[] a = new int[ n ];  
    for ( int i = 0; i < a.length; i++ ){
      a[ i ] = PApplet.parseInt(random( n*5 ));  
    }
    
    int[] c = mergeSort(a, 0, a.length-1);
    
    printArray( c ); 
    exit();
  }  
  else{
    println("Stop the tomfoolery you hooligan");
    exit();
  }
  
}
    
public int[] mergeSort( int[] a, int start, int end){
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

public int[] merge( int[] a, int[] b ) {
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


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Processing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
