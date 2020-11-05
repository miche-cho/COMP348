//Author: Amine Halimi 40112879
//Version 1.0 it is for Q11
#ifndef SELECTIONSORTQ11_H_
#define SELECTIONSORTQ11_H_

void selectionSort(int* arr, int size, int* (*min) (int*, int));

/* removed code to fix the redefinition errors
#include "selectionSortQ11.c"
static int* findmin(int* arr, int size);
static void swap(int* x, int* y);
*/

#endif
