#include <stdio.h>
#include <stdlib.h>

#define MAX 77

// Enfoque top down
unsigned long long fibonacciTD(int n, unsigned long long *tabla)
{
    // Caso base: Fibonacci(0) = 0, Fibonacci(1) = 1
    if (n < 2)
        return n;

    // Calculo de fibb de n-1 recursivamente
    if (tabla[n - 1] == -1)
        tabla[n - 1] = fibonacciTD(n - 1, tabla);

    // Calculo de fibb de n-2 recursivamente
    if (tabla[n - 2] == -1)
        tabla[n - 2] = fibonacciTD(n - 2, tabla);

    // Calcular fibonacci(n) sumando los valores ya calculados y almacenados por la estrategia DP
    tabla[n] = tabla[n - 1] + tabla[n - 2];

    return tabla[n];
}

// Enfoque bottom up
unsigned long long fibonacciTU(int n)
{
    // Inicializar la tabla para almacenar los valores intermedios
    unsigned long long tabla[n + 1];
    tabla[0] = 0;
    tabla[1] = 1;

    // Calcular los valores de Fibonacci desde el fondo hacia arriba
    for (int i = 2; i <= n; i++)
        tabla[i] = tabla[i - 1] + tabla[i - 2];

    return tabla[n];
}

int main()
{
    int n = MAX;

    // Se inicializa la tabla para el enfoque top-down
    unsigned long long tablaTD[MAX + 1];
    for (int i = 0; i <= MAX; i++)
        tablaTD[i] = -1;

    // Calcular el resultado para ambos enfoques
    unsigned long long resultadoTD = fibonacciTD(n, tablaTD);
    unsigned long long resultadoTU = fibonacciTU(n);

    // Imprimir los resultados
    printf("El resultado Top DOWN de %d es: %llu\n", n, resultadoTD);
    printf("El resultado Top UP de %d es: %llu\n", n, resultadoTU);

    return 0;
}
