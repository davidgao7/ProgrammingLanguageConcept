#include <stdio.h>
#include <stdlib.h>

int main(void){
    
	char first[] = "Somebody";

	{
	 char middle[] = "Else";
	
		{
		 char last[] = "Entirely";
		 printf("Hello, %s %s %s\r\n", first, middle, last);
		}

	}

	return EXIT_SUCCESS;

}
