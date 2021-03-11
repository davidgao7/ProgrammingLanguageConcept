#include <stdio.h>

int main(){

    FILE *file = fopen("fileToprint", "w");// open for writing, start write at beginning of file; r:read; a:wrinting from the end, not rewrite
    if(file == NULL){
        printf("Could not open file");
	return 0; 
    }
   
    fprintf(file,"Hello world!\n"); 
    fclose(file);
    return 0;
}
