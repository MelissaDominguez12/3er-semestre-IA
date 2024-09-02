#include <math.h>
#include <stdio.h>
#include <stdlib.h>


int policeThief(char arr[], int n, int k)
{
    int pol = -1, thi = -1, res = 0; // Inicializa los índices más bajos de policía y ladrón como -1.

    // Encuentra el índice más bajo de un policía.
    for (int i = 0; i < n; i++) {
        if (arr[i] == 'P') {
            pol = i;
            break;
        }
    }

    // Encuentra el índice más bajo de un ladrón.
    for (int i = 0; i < n; i++) {
        if (arr[i] == 'T') {
            thi = i;
            break;
        }
    }

    // Si el índice más bajo de policía o ladrón sigue siendo -1, devuelve 0.
    if (thi == -1 || pol == -1)
        return 0;
    
    while (pol < n && thi < n) {
        // Si el ladrón puede ser atrapado (la distancia entre el policía y el ladrón es <= k), realiza lo siguiente:
        if (abs(pol - thi) <= k) {
            pol = pol + 1;
            //Revisa el arreglo para encontrar el siguiente policía.
            while (pol < n && arr[pol] != 'P')
                pol = pol + 1;
            //Revisa el arreglo para encontrar el siguiente policía.
            thi = thi + 1;
            while (thi < n && arr[thi] != 'T')
                thi = thi + 1;

            res++; // Incrementa el contador de ladrones atrapados.
        }

        // Incrementa el valor mínimo actual (pol o thi) para encontrar al siguiente policía o ladrón.
        else if (thi < pol) {
            thi = thi + 1;
            //Revisa el arreglo para encontrar el siguiente ladrón.
            while (thi < n && arr[thi] != 'T')
                thi = thi + 1;
        }
        else {
            pol = pol + 1;
            //Revisa el arreglo para encontrar el siguiente policía.
            while (pol < n && arr[pol] != 'P')
                pol = pol + 1;
        }
    }
    return res; // Devuelve el número máximo de ladrones atrapados.
}

int main()
{
    int k, n;

    char arr[] = {'P', 'T', 'T', 'P', 'T', 'T', 'T', 'P', 'P', 'T', 'P', 'P', 'T', 'T', 'T', 'T', 'T', 'T','P', 'T', 'T', 'T', 'T'};
    k = 2;
    n = sizeof(arr) / sizeof(arr[0]);
    printf("Máximo de ladrones atrapados con k=2 :  %d\n", policeThief(arr, n, k));

    k = 3;
    printf("Máximo de ladrones atrapados con k=3  : %d\n", policeThief(arr, n, k));

    k = 4;
    printf("Máximo de ladrones atrapados con k=4 : %d\n", policeThief(arr, n, k));

    k = 5;
    printf("Máximo de ladrones atrapados con k=5 : %d\n", policeThief(arr, n, k));


    return 0;
}