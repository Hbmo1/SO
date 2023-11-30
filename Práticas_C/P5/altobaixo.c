#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    int answer;
    int guess;
    int count = 0;
    srand(time(NULL)); //seed the random number generator, else the same number will be generated every time (same seed)

    answer = rand() % (100 + 1); //generate a random number between 0 and 100

    while (1) {
        printf("Guess a number between 0 and 100: ");
        scanf("%d", &guess);
        count++;
        if (guess == answer) {
            printf("Congrats, you guessed the number after %d guesses!\n", count);
            break;
        } else {
            if (guess > answer) {
                printf("Desce para baixo!\n");
            } else {
                printf("Sobe para cima!\n");
            }
        }
    }

    return EXIT_SUCCESS;

}