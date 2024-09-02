#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MAX 10  

int main() {
    int arr[MAX];  
    srand(time(NULL));  

    // Llenar el arreglo 
    for (int i = 0; i < MAX; i++) {
        arr[i] = 1 + (rand() % MAX);  
    }

    // Inicializa el arreglo con max y minen el primer y segundo elemento si el primero es mayor que el segundo
    if (arr[0] > arr[1]) {
        int max = arr[0];  
        int min = arr[1]; 

        // Encontrar el máximo y mínimo en el arreglo
        for (int i = 0; i < MAX; i++) {
            if (arr[i] > max) {
                max = arr[i];  // Actualiza max si se encuentra un valor mayor
            }
            else if (arr[i] < min) {
                min = arr[i];  // Actualiza min si se encuentra un valor menor
            }
        }

        printf("Elemento mínimo: %d\n", min);
        printf("Elemento máximo: %d\n", max);
    }
     // Inicializa el arreglo con min y max el primer y segundo elemento si el primero es menor que el segundo
    else {
        int max = arr[1];  
        int min = arr[0];  

        // Bucle para encontrar el máximo y mínimo en el arreglo
        for (int i = 0; i < MAX; i++) {
            if (arr[i] > max) {
                max = arr[i];  // Actualiza max si se encuentra un valor mayor
            }
            else if (arr[i] < min) {
                min = arr[i];  // Actualiza min si se encuentra un valor menor
            }
        }

        printf("Elemento mínimo: %d\n", min);
        printf("Elemento máximo: %d\n", max);
    }

    return 0;  
}
