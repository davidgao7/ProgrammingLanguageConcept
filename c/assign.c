#include <stdio.h>
#define MAX(a,b) ((a) > (b) ? (a) : (b))


void main(){

   int x = 5;
   int y = 3;
   printf("MAX(%d++,%d++) is %d\r\n", x, y, MAX(x++,y++));
}
