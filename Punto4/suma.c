#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 100

void sumarPosicionesSiguientes(int arr[], int resultado[], int n) {
    for (int i = 0; i < n - 1; i++) {
        resultado[i] = arr[i] + arr[i + 1];
    }
}

int main() {
    int arr[SIZE];
    int resultado[SIZE - 1];

    srand(time(NULL));

    for (int i = 0; i < SIZE; i++) {
        arr[i] = rand() % 100;  
    }

    clock_t start = clock();
    sumarPosicionesSiguientes(arr, resultado, SIZE);
    clock_t end = clock();

    double time_taken = ((double)(end - start)) / CLOCKS_PER_SEC;

/*
    printf("Arreglo original:\n");
    for (int i = 0; i < SIZE; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    printf("Resultado de la suma de cada elemento con el siguiente:\n");
    for (int i = 0; i < SIZE - 1; i++) {
        printf("%d ", resultado[i]);
    }
    printf("\n");
*/
    printf("La suma tomó %f segundos en ejecutarse\n", time_taken);

    return 0;
}
