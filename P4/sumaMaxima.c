#include <stdio.h>

int max(int a, int b, int c) {
    int max_value = a;

    if (b > max_value) {
        max_value = b;
    }

    if (c > max_value) {
        max_value = c;
    }

    return max_value;
}

int CalcMaxMitad(int arr[], int mitad, int size) {
    int max_izq = 0;
    int max_der = 0;
    int suma = 0;

    // Calcular la suma máxima a la izquierda de la mitad
    for (int i = mitad - 1; i >= 0; i--) {
        suma = suma + arr[i];
        if (suma > max_izq) {
            max_izq = suma;
        }
    }

    suma = 0;

    // Calcular la suma máxima a la derecha de la mitad
    for (int i = mitad; i < size; i++) {
        suma = suma + arr[i];
        if (suma > max_der) {
            max_der = suma;
        }
    }

    return max_izq + max_der;
}

int MaxArray(int arr[], int left, int right) {
    if (left == right) {
        return arr[left];
    }

    int mid = (left + right) / 2;

    int maxIzq = MaxArray(arr, left, mid);
    int maxDer = MaxArray(arr, mid + 1, right);
    int maxMitad = CalcMaxMitad(arr, mid, right);

    return max(maxIzq, maxDer, maxMitad);
}

int main() {
    int arr[10] = {2, -4, 1, 9, -6, 7, -3,9};
    int maxSum = MaxArray(arr, 0, 9);
    printf("%d\n", maxSum);

    return 0;
}
