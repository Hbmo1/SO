#include <stdio.h>

int main() {

    int c;

    while ((c=getchar()) != EOF) {
        if (c == '\t') {
            printf(">\b-");
        } else if (c == ' '){
            printf("<\b-");
        } else {
            putchar(c);
        }
    }

    return 0;
}