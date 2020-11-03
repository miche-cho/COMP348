#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>



/* Node Stucture */
struct Node
{
    char *word;
    struct Node *next;
};


/* receives a word of type char* and inserts into the right position*/ 
void insert_dictionary_order(struct Node** reference, char* new_word){
    
    // make node
    struct Node* new_node = (struct Node*) malloc(sizeof(struct Node));
    
    // put data into node
    new_node->word = new_word;

    // next node is the new reference
    new_node->next = (*reference);

    // point to new node
    (*reference) = new_node;
}

// function prints contents of linked list
void print_list(struct Node *Node){
      while (Node != NULL) 
  { 
     printf(" %s ", Node->word); 
     Node = Node->next; 
  } 
}

// driver function
int main() { 
    // start with empty 
struct Node* start = NULL;
char str1[255];    
printf("Enter a String\n");
gets(str1);
printf(str1);
sscanf(str1, "%s");
printf("%s", str1);
const char n[2]="\t";
char *token = strtok(str1,n);
while (token != NULL){
//insert_dictionary_order(&start, part[count]);
    printf("%s\n", token);
    token = strtok(NULL, n);
}
print_list(start);

    return 0;
}