#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* node Stucture */
struct Node_t {
  char data[255];
  struct Node_t* next;
};

// delimiters and end of reading
const char del[2] = " ";
const char end[2] = ".";
const char eof[2] = ""; //   (control-Z )or  (control-D) (windows)
// on linux change to "\0" and send control-D from stdin

/* receives a word of type char* and inserts into the right position*/
void insert_dictionary_order(struct Node_t** reference, char* new_word) {
  // allocate node 
  struct Node_t* new_node = (struct Node_t*)malloc(sizeof(struct Node_t));
  struct Node_t* last = *reference;

  // put in the data
  strcpy(new_node->data, new_word);
  new_node->next = NULL;

  // If empty, then make the new node as head
  if (*reference == NULL) {
    *reference = new_node;
    return;
  }

  // find last node
  while (last->next != NULL) {
    last = last->next;
  }
  // change last node to our new node*/
  last->next = new_node;
  return;
}

/* function traverses and  prints contents in linked list*/
void print_list(struct Node_t* node) {
  printf("\nPrinting nodes...\n");
  struct Node_t* tmp;
  if (node == NULL) {
    printf("List is empty.");
  } else {
    tmp = node;
    while (tmp != NULL) {
      printf("%s%s", tmp->data, del);
      tmp = tmp->next;
    }
  }
  printf("\n");
  return;
}

/* driver function */
int main() {
  // keep asking input if not
  // 1. '.'
  // 2. EOF
  struct Node_t* root = NULL;
  int exit = 1;

  while (exit) {
    printf("Enter a line\n");
    char buffer[255];
    gets(buffer);

    // checks if only dot on for input
    if (0 == strcmp(buffer, end)) {
      printf("Ending on dot\n");
      exit = 0;
    }

    // sscanf doesn't work on my windows compiler but works online compiler, with seg fault issues though
    //sscanf(&buffer[0], "%s");   
    char* tok = strtok(buffer, del);

    while (NULL != tok) {
      insert_dictionary_order(&root, tok);
        
      // checks if end of file is called (control D in this case)
      if (0 == strcmp(tok, eof)) {
        printf("End of file\n");
        exit = 0;
      }
    // clear string for next input
      tok = strtok(NULL, del);
    }
    // add new line for the next node
    insert_dictionary_order(&root, "\n");
  }
   // prints all nodes if EOF or . 
  print_list(root);
  return 0;
}
