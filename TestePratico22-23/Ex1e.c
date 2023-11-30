#include <stdio.h>

int main() {
    int m[3];
    int* a=m;
    int* b=m+1;
    int* c=m+2;

    m[0] = 3;
    m[1] = 6;
    m[2] = 9;

    printf("%p: %d, %d\n", (void*)a, m[0], *a);
    printf("%p: %d, %d\n", (void*)b, m[1], *b);
    printf("%p: %d, %d\n", (void*)c, m[2], *c);

    //This would work, but the given option uses indexes 1,2,3 instead of 0,1,2, so its wrong
    *b=*c;
    *c=*a;
    *a=*b;
    
    printf("%p: %d, %d\n", (void*)a, m[0], *a);
    printf("%p: %d, %d\n", (void*)b, m[1], *b);
    printf("%p: %d, %d\n", (void*)c, m[2], *c);
    
    /* STOP READING*/

}