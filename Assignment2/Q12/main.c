#include <stdio.h>
#include <math.h>

#include "selectionSortQ12.h"



static void print_array(int* arr, int size);
static int* findmin(int* arr, int size);
static int* findmax(int* arr, int size);
static double average(int* arr, int size);
static double standardD(int* arr, int size,double average);

int main() 
{
    //given array is here
	int size=5;
	int given[] = {1, 4, 5 , 6, -1};

	//dynamically allocate array here
	int* arr=malloc(size*sizeof(int));
	if(arr==NULL)
	{
		printf("Error: out of memory\n");
		return 1;
	}

	for(int i=0;i<size;i++)
	{
		*(arr+i)=given[i];
	}

	printf("The original array: ");
    print_array(arr, size);

    selectionSort(arr,size, &findmin);
    printf("Ascending order: ");
    print_array(arr, size);

    selectionSort(arr,size, &findmax);
    printf("Descending order: ");
    print_array(arr, size);

    double averageNum=average(arr,size);
    printf("Average: %f\t", averageNum);

    double standardDNum=standardD(arr,size,averageNum);
    printf("Standard deviation: %f",standardDNum);


    free(arr);
    return 0;
}

//This just prints the contents of an array
static void print_array(int* arr, int size)
{
    printf("The array is now: ");
    int i;
    for (i = 0; i < size; i = i + 1)
    {
        printf("%d ", *(arr+i));
    }
    printf("\n");
}
//findmin and findmax that is only accessable in this file
static int* findmin(int* arr, int size)
{
    int i;
    int minIndex = 0;
    //This loop finds at which index of the array is the smallest value stored
    for (i = 1; i < size; i = i + 1)
    {
        if (*(arr+i) < *(arr+minIndex))
        {
            minIndex = i;
        }
    }
    //This passes the address of the location of the smallest value in the array
    int* addr;
    addr = &arr[minIndex];
    return addr;
}
static int* findmax(int* arr, int size)
{
    int i;
    int maxIndex = 0;
    //This loop finds at which index of the array is the smallest value stored
    for (i = 1; i < size; i = i + 1)
    {
        if (*(arr+i) > *(arr+maxIndex))
        {
            maxIndex = i;
        }
    }
    //This passes the address of the location of the smallest value in the array
    int* addr;
    addr = &arr[maxIndex];
    return addr;
}
//find the average of the given array
static double average(int* arr, int size)
{
	float sum=0;
	for(int i=0;i<size;i++ )
	{
		sum+=*(arr+i);
	}
	return (sum/size);
}
static double standardD(int* arr, int size,double average)
{
	double sum=0;
	for(int i=0;i<size;i++)
	{
		sum+=pow((*(arr+i)-average),2);
	}
	return(sqrt(sum/size));
}

