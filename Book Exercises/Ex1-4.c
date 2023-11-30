#include <stdio.h>

int main() {

    int lower, step, upper;
    float celsius, fahr;

    lower = -50;
    step = 10;
    upper = 200;

    printf("Celsius | Fahrenheit\n");

    for (celsius=lower ; celsius <= upper ; celsius+=step) {
        fahr = (celsius * 9.0 / 5.0) - 32;
        printf("%7.0f | %4.0f\n", celsius, fahr);
    }


    return 0;
}