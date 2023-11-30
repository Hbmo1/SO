#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#define LINEMAXSIZE 80

int main(int argc, char *argv[]) {
    int n;
    FILE *fp = NULL;
    char line[LINEMAXSIZE];

    n = 0;

    if (argc < 2) {
        printf("USAGE: %s fileNames\n", argv[0]);
        return EXIT_FAILURE;
    }

    errno = 0;
    for (int i = 1; i < argc; i++) {
        fp = fopen(argv[i], "r");
        if (fp == NULL) {
            perror("Error opening file!");
            return EXIT_FAILURE;
        }

        while (fgets(line, sizeof(line), fp) != NULL) {
            n++;
            printf("%d-> %s", n, line);

            // Check if the line doesn't end with '\n'
            if (line[strlen(line) - 1] != '\n') {
                char additionalLine[LINEMAXSIZE];
                while (fgets(additionalLine, sizeof(additionalLine), fp) != NULL && additionalLine[strlen(additionalLine) - 1] != '\n') {
                    printf("%s", additionalLine);
                }
            }
        }

        printf("\n");

        fclose(fp);
        fp = NULL;
    }

    return EXIT_SUCCESS;
}