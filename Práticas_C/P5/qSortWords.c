#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int compareCharsAscending(const void* a, const void* b) {
    return (*(char*)a - *(char*)b);
}

int compareCharsDescending(const void* a, const void* b) {
    return (*(char*)b - *(char*)a);
}

void AscendingOrder(char* str) {
    qsort(str, strlen(str), sizeof(char), strcmp);
}

void DescendigOrder(char* str) {
    qsort(str, strlen(str), sizeof(char), strcmp);
}

int main(int argc, char* argv[]) {
    int numChars=0;
    int sortOrder = getenv("SORTORDER");


    for(int i = 1 ; i < argc ; i++) {
        numChars = numChars + strlen(argv[i]);
    }
    char chars[numChars+1];

    if (isalpha(argv[1][0])) {
        strcpy(chars, argv[1]);
    }
    
    for(int i = 2 ; i < argc ; i++) {
        if (isalpha(argv[i][0])) {
            strcat(chars, argv[i]);
        }
    }

    if (sortOrder == 1) {
        AscendingOrder(chars);
    } else {
        DescendigOrder(chars);
    }

    
    printf("Concatenation of all arguments starting with a letter: %s\n", chars);

    return EXIT_SUCCESS;

}