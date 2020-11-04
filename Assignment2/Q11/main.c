#include <stdio.h>
#include "selectionSortQ11.h"
#include "selectionSortQ11.h"


void print_array(int* arr, int size);

int main() 
{
    int arr[] = {1, 4, 5 , 6, -1};
    print_array(arr, 5);
    int* m = findmin(arr, 5);

    printf("The smallest value in this array is %d\n", *m);
    selectionSort(arr,5, NULL);
    print_array(arr, 5);
    int c = 9;
    int j = 23;
    swap(&c, &j);
    return 0;
}

//This just prints the contents of an array
void print_array(int* arr, int size)
{
    printf("The array is now: ");
    int i;
    for (i = 0; i < size; i = i + 1)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}



