#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define tam 10000
void insertionSort(int arr[]);

void bubbleSort(int arr[]);

void selectionSort(int arr[]);

int main (){
    srand(6);
    int arr[tam], opcion;
    for (int i = 0; i < tam ; i++)
    {
        arr[i] = rand()%9999;
        printf("%d) %d \n", i+1, arr[i]);
    }

  
    insertionSort(arr);
    //bubbleSort(arr);
       
    return 0;
}

void insertionSort(int arr[]){
    int i, j, key;
    for (int i = 1; i < tam; i++)
    {
        key = arr[i];
        j = i - 1;
        
        while (j >= 0 && arr[j] > key)
        {
            arr[j+1] = arr[j];
            j = j - 1; 
        }
        arr[j+1]= key;
        
    }
     for (int i = 0; i < tam; i++)
    {
        printf("%d) %d\n", i+1, arr[i]);
    }
    
}

void bubbleSort(int arr[]){
    int i, j, k, aux;
    for (i = 0; i < tam; i++)
    {
        for (j = 0; j < tam; j++)
        {
            if (arr[j] > arr[j+1])
            {
                aux = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = aux;
            }
            
        }
        
    }
    for (k = 0; k < tam; k++)
    {
        printf("%d) %d\n", k+1, arr[k]);
    }
    
    
}

void selectionSort(int arr[]){
    int i, j, k, aux;
    for (i = 0; i < tam; i++)
    {
        for (j = i+1; j < tam; j++)
        {
            if (arr[i] > arr[j])
            {
                aux = arr[i];
                arr[i] = arr[j];
                arr[j] = aux;
            }
            
        }
        
    }
    for (k = 0; k < tam; k++)
    {
        printf("%d) %d\n", k+1, arr[k]);
    }
    
    
}


