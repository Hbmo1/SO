#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main(int argc, char* argv[]) {
    int numChars=0;

    for(int i = 1 ; i < argc ; i++) {
        numChars = numChars + strlen(argv[i]);
        printf("Sum of all characters up until argument %d: %d characters\n", i, numChars);
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

    printf("Concatenation of all arguments starting with a letter: %s\n", chars);

    return EXIT_SUCCESS;


}