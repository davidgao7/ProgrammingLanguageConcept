

#include <stdio.h>
#define MAX(a,b) ((a) > (b) ? (a) : (b) )
int main( int argc , char** argv ){
  int x = 5;
  int y = 3;
  printf( "MAX(%d++,%d++) is %d\n" , x , MAX( x++ , y++ ) , y );
  return 0;
}
