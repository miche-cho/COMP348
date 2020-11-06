//Author: Amine Halimi 40112879
//Version 1.0

#include <stdio.h>

int* findmin (int* arr, int size);

int main() 
{
    int arr[] = {1, 4, 5 , 6, -1};
    int* m = findmin(arr,5);
    printf("The smallest value is %d\n", *m);

    return 0;
}
int* findmin(int* arr, int size) 
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