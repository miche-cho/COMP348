//Author: Amine Halimi 40112879
//Version 1.0 it is for Q11
#ifndef SELECTIONSORTQ11_H_
#define SELECTIONSORTQ11_H_
#include "selectionSortQ11.c"

static int* findmin(int* arr, int size);
void selectionSort(int* arr, int size, int* (*min) (int*, int));
static void swap(int* x, int* y);

#endif