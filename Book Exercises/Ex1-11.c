#include <stdio.h>
#include <ctype.h>

#define YES 1
#define NO 0

int main() {

    int c, inword;

    while ((c=getchar()) != EOF) {
        if (c == ' ' || c == '\n' || c == '\t') {
            inword = NO;
            putchar('\n');
        } else if(inword == NO && isalpha(c)){
            inword = YES;
            putchar(c);
        } else if (isalnum(c) || ispunct(c)){
            putchar(c);
        }
    }
}