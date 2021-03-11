#include <stdio.h>
#include <stdlib.h>

int main(void){

  char name[] = "David Gao";

  {
    char name[] = "Somebody else";
    printf("Hello, %s\r\n", name);
  }

  printf("Good bye, %s \r\n", name);

  return EXIT_SUCCESS;
}
