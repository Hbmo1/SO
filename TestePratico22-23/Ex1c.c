#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {

    FILE* fp = NULL;
    fp = fopen(argv[1], "r");

    char linha[5];
    int count = 0;
    while (fgets(linha, sizeof(linha), fp) != NULL) {
        printf("%s", linha);
        count++;
        printf("%d",count);
    }

}