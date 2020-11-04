//Author: Amine Halimi 40112879
//Version 1.0 This is Q11
#include <stdio.h>
#include "selectionSortQ11.h"

static int* findmin(int* arr, int size) 
{
    int i;
    int minIndex = 0;
    //This loop finds at which index of the array is the smallest value stored
    for (i = 1; i < size; i = i + 1)
    {
        if (arr[i] < arr[minIndex])
        {
            minIndex = i;
        }
    }
    //This passes the address of the location of the smallest value in the array
    int* addr;
    addr = &arr[minIndex];
    return addr;
}
//This function swaps the two values of the two addresses
static void swap(int* x, int* y)
{
    int temp = *x;
    *x = *y;
    *y = temp;

}
//This is Q11
void selectionSort(int* arr, int size, int* (min) (int*, int))
{
    if (min == NULL)
    {
        min = &findmin;
    }
    int i;
    int j;

    //This sorts the array under the same principle
    for (i = 0; i < size; i = i + 1) 
    {
        int* workArr[size - i];
        //This copies the element
        for (j = 0; j < size - i; j = j + 1)
        {
            workArr[j] = &arr[j + i];
        }
        int* minimum = min(*workArr, size - i);
        swap(&arr[i], minimum);
    }

}