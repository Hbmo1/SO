#include <stdio.h>

int main() {
    
    int lower, step, upper;
    float fahr, celsius;

    lower = 0;
    upper =300;
    step = 10;

    printf("Fahrenheit | Celsius\n");

    for (fahr = upper ; fahr >= lower ; fahr-=step) {
        celsius = (5.0/9.0) * (fahr-32.0);
        printf("%10.0f | %3.0f\n", fahr, celsius);
    }
}