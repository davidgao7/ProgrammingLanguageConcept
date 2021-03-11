#include <stdio.h>
#include <stdlib.h>

struct Node{
	int key;
	struct Node* next;
};

int main(){

	struct Node* head = NULL;
	struct Node* second = NULL;
	struct Node* third = NULL;

	head = (struct Node*)malloc(sizeof(struct Node));
	second = (struct Node*)malloc(sizeof(struct Node));
	third = (struct Node*)malloc(sizeof(struct Node));

	head->key = 1;
	head->next = second;
	
	second->key = 2;
	second->next = third;

	third->key = 3;
	third->next = NULL;
	
	struct Node *p = head;
	int val = 3;
	while(p && p->key != val){
	    printf("not the value to find\n");
	    *p = *p->next;
	}
	
	return 0;
}
