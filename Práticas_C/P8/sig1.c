#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    unsigned int i;

    printf("PID = %u\n", getpid());
    i = 0;
    while (i <= 100000) { 
        printf("\r%08u", i++);
        fflush(stdout);
        usleep(10000);
    }
    printf("\n");

    return EXIT_SUCCESS;
}
