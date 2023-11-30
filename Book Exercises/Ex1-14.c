#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

#define MAXLINE 1000

int getLine(char s[], int lim) {
    int c, i;

    for (i=0 ; i<lim-1 && (c=getchar()) != EOF && c != '\n' ; ++i) {
        s[i] = c;
    }
    if (c == '\n') {
        s[i] = c;
        ++i;
    }
    s[i] = '\0';
    return(i);
}

void copy(char s1[], char s2[]) {
    int i;
    
    i = 0;
    while ((s2[i] = s1[i]) != '\0') {
        ++i;
    } 
}

int main() {

    int len, max;                       // current line length and maximum length seen so far 
    char line[MAXLINE], save[MAXLINE];  // current input line and longest line, saved.

    max = 0;
    while ((len = getLine(line, MAXLINE)) > 0) {
        if (len > max) {
            max = len;
            copy(line, save);
        }
    }
    if (max > 0) {
        printf("%s", save);
    }
}