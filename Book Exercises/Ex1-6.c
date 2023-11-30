#include <stdio.h>

int main() {

    int c, nl, nt, nb;

    nl = 0;
    nt = 0;
    nb = 0;
    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            ++nl;
        } else if (c == '\t'){
            ++nt;
        } else if (c == ' '){
            ++nb;
        }
    }
    printf("New lines: %d\n", nl);
    printf("Tabs: %d\n", nt);
    printf("Blankspaces: %d\n", nb);
    
}