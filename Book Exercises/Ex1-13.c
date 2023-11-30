#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

int lower(int c) {
    if (isalpha(c) && isupper(c)) {
        return tolower(c);
    }
    return c;
}

int main() {

    int c;

    while ((c = getchar()) != EOF) {
        putchar(lower(c));
    }
}