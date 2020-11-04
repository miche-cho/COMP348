#include <stdio.h>
//This is q9
int* findmin(int* arr, int size) 
{
    int i;
    int min = arr[0];
    for (i = 1; i < size; i = i + 1)
    {
        if (arr[i] <= min)
        {
            min = arr[i];
        }
    }
    int* addr;
    addr = &min;
    return addr;
}
//This function swaps the two values of the two addresses
void swap(int* x, int* y)
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
    for (i = 0; i < size; i = i + 1)
    {
        int value = arr[i];
        nArr[i] = arr[i];
    }

    int *min = findmin(nArr, size);
    printf("The smallest value of this array is %d\n", *min);
    
    for (i = 0; i < size; i = i + 1) 
    {
        int minIndex = 0;
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