#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {
    int numChars=0;

    for(int i = 1 ; i < argc ; i++) {
        numChars = numChars + strlen(argv[i]);
        printf("Sum of all characters up until argument %d: %d characters\n", i, numChars);
    }
    char* chars[numChars];

    strcpy(chars, argv[1]);
    for(int i = 2 ; i < argc ; i++) {
        strcat(chars, argv[i]);
    }

    printf("Concatenation of all arguments: %s\n", chars);

    return EXIT_SUCCESS;


}