#include <stdio.h>
#include <ctype.h>
#include <string.h>
int main() {

    char str[] = "Olá amigo";

    printf("%ld\n",strlen(str));
    printf("%ld\n",strlen(str+2));
}