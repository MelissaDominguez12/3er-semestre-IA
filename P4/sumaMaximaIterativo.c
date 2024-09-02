#include <stdio.h>
#include <limits.h>
 
int maximum_sum(int nums[], int n)
{
    int max_sum = INT_MIN;
    int sum = 0;
 
    // hacer para cada subarray que comienza con `i`
    for (int i = 0; i < n; i++)
    {
        // calcular la suma del subarray `nums[i…j]`
 
        sum = 0;    // restablecer la suma
 
        // hacer para cada subarray que termina en `j`
        for (int j = i; j < n; j++)
        {
            sum += nums[j];
 
            // si la suma del subarray actual es mayor que el máximo
            // suma calculada hasta ahora, actualiza la suma máxima
            if (sum > max_sum) {
                max_sum = sum;
            }
        }
    }
 
    return max_sum;
}
 
int main(void)
{
    int arr[] = { 2, -4, 1, 9, -6, 7, -3 };
    int n = sizeof(arr) / sizeof(arr[0]);
 
    printf("La suma maxima es %d", maximum_sum(arr, n));
 
    return 0;
}