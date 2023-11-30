#include <stdio.h>

int main() {
    printf("%d\n", fork());
    printf("%d\n", fork());
    
    return 0;
}