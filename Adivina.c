//Una persona piensa en un numero entero positivo W. Escribe un algoritmo para que otra persona
//lo adivine realizandole preguntas con la relaciones de orden <, >, =. El numero de preguntas debe de ser o(W).
#include <stdio.h>
#include <limits.h>

int adivinarNumero(int minimo, int maximo) {
    int adivinanza = (maximo + minimo) / 2;
    char respuesta;

    do {
        printf("El numero es mayor (>), menor (<) o igual (=) a %d? ", adivinanza);
        scanf(" %c", &respuesta);
    } while (respuesta != '>' && respuesta != '<' && respuesta != '=');

    if (maximo == minimo || respuesta == '=') {
        return adivinanza;
    } else if (respuesta == '>') {
        return adivinarNumero(adivinanza + 1, maximo);
    } else if (respuesta == '<') {
        return adivinarNumero(minimo, adivinanza - 1);
    }
}

int main() {
    int minimo = 1;
    int maximo = INT_MAX-1;

    printf("Piensa en un número entre %d y %d.\n", minimo, maximo);

    int numeroPensado = adivinarNumero(minimo, maximo);

    printf("El número pensado es %d.\n", numeroPensado);

    return 0;
}