#include <stdio.h>

#define YES 1
#define NO 0

int main() {
    
    int c, nc, nw, nl, inword;

    inword = NO;
    while ((c=getchar()) != EOF) {
        ++nc;
        if (c == '\n') {
            ++nl;
        }
        if (c == ' ' || c == '\n' || c == '\t') {
            inword = NO;
        } else if (inword == NO){
            inword = YES;
            ++nw;
        }
    }

    printf("Chars: %d\nWords: %d\nNewlines: %d\n", nc, nw, nl);
}