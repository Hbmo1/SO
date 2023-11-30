#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int isDouble(char* str) {
    char *endptr;
    strtod(str, &endptr);

    if(*endptr != '\0') {
        printf("Error converting string to double. Invalid character: %c\n", *endptr);
        return 0;
    }

    return 1;
}

int main(int argc, char* argv[]) {

    if(argc != 4) {
        printf("Exactly 3 arguments must be given.\n");
        return EXIT_FAILURE;
    }

    if(!isDouble(argv[1]) || !isDouble(argv[3])) {
        printf("The first and third arguments must be numeric values.\n");
        return EXIT_FAILURE;
    }
    
    double num1 = atof(argv[1]);
    double num2 = atof(argv[3]); 

    char op = argv[2][0];

    switch (op) {

        case '+':
            printf("%f + %f = %f\n", num1, num2, num1+num2);
            break;
        case '-':
            printf("%f - %f = %f\n", num1, num2, num1-num2);
            break;
        case 'x':
            printf("%f x %f = %f\n", num1, num2, num1*num2);
            break;
        case '/':
            printf("%f / %f = %f\n", num1, num2, num1/num2);
            break;
        case 'p':
            printf("%f ^ %f = %f\n", num1, num2, pow(num1,num2));
            break;
        default:
            printf("Invalid operation\n");
            break;
    }

}