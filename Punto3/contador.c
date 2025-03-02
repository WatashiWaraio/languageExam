#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_WORD_LENGTH 100
#define MAX_WORDS 1000

typedef struct {
    char word[MAX_WORD_LENGTH];
    int count;
} WordCount;

int main() {
    FILE *archivo;
    char palabra[MAX_WORD_LENGTH];
    WordCount words[MAX_WORDS];
    int numWords = 0;

    archivo = fopen("test.txt", "r");

    if (archivo == NULL) {
        printf("Error al abrir el archivo\n");
        return 1;
    }

    while (fscanf(archivo, "%99s", palabra) == 1) {
        int found = 0;
        for (int i = 0; i < numWords; i++) {
            if (strcmp(words[i].word, palabra) == 0) {
                words[i].count++;
                found = 1;
                break;
            }
        }
        if (!found && numWords < MAX_WORDS) {
            strcpy(words[numWords].word, palabra);
            words[numWords].count = 1;
            numWords++;
        }
    }

    printf("Conteo de palabras:\n");
    for (int i = 0; i < numWords; i++) {
        printf("%s: %d\n", words[i].word, words[i].count);
    }

    fclose(archivo);
    return 0;
}
