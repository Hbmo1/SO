#include <stdio.h>

int main() {
    
    // test pointers
    /*
    int m[3];
    int* p = m;
    printf("%p\n", p);
    printf("%d\n", *p);
    
    *p = (int)m;
    printf("%p\n", p);
    printf("%d\n", *p);
    */

    char a[] = "ABCDEFGHIJKLIQWERTYHGJFODISKWNE";
    char b[] = "oyjgifkdleqrwetyurieodolsofgjbkvjcngjfo";

    printf("%d", sizeof(a));
    printf("%d", sizeof(b));

}
