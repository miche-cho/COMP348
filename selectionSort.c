#include <stdio.h>
#include "selectionSort.h"
//This is q9
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
//This is Q10
int* selectionSort(int* arr, int size)
{
    int i;
    int j;
    int nArr[size];
    //This is creating an exact copy of the passed array
    for (i = 0; i < size; i = i + 1)
    {
        int value = arr[i];
        nArr[i] = arr[i];
    }

    //This finds the absolute smallest value in the array and then puts it at the front
    int *min = findmin(nArr, size);
    swap(min, &nArr[0]);

    //This sorts the array under the same principle
    for (i = 1; i < size; i = i + 1) 
    {
        for (j = i; j < size; j = j + 1)
        {
            if(nArr[j] < nArr[i])
            {
                swap(&nArr[j], &nArr[i]);
            }
        }
    }

    int* addr;
    addr = nArr;
    return addr;
    
}