#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 100 
struct Pair {
    int min;
    int max;
};
// Función para comparar dos enteros para el quicksort.
int compare(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}



struct Pair getMinMax(int arr[], int n) {
    struct Pair minmax; 

    qsort(arr, n, sizeof(int), compare); // Ordena el arreglo arr en orden ascendente usando la funcion compare.

    minmax.min = arr[0]; // El primer elemento del arreglo ordenado es el mínimo.
    minmax.max = arr[n - 1]; // El último elemento del arreglo ordenado es el máximo.

    return minmax; 
}

int main() {
    int arr[MAX]; 
    srand(time(NULL)); // Inicializa el generador de números aleatorios con una semilla

    for (int i = 0; i < MAX; i++) {
        arr[i] = 1 + (rand() % MAX); // Llena el arreglo con números aleatorios entre 1 y MAX
    }

    struct Pair minmax = getMinMax(arr, MAX); // Llamada a la función
   

   
    printf("El elemento mínimo es %d\n", minmax.min);
    printf("El elemento máximo es %d\n", minmax.max);

    return 0;
}
