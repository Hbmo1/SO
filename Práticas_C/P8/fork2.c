#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    int ret;


    printf("Antes do fork: PID = %d, PPID = %d\n", getpid(), getppid());
    if ((ret = fork()) < 0) { 
        perror("erro na duplicação do processo");
        return EXIT_FAILURE;
    }
    /*
    char my_role[6];
    if (ret > 0) {
        sleep(1);
        strcpy(my_role, "PAI");
    } else {
        strcpy(my_role, "FILHO");
    }
    printf("Quem sou eu?\nApós o fork: PID = %d, PPID = %d, hierarquia = %s\n",
           getpid(), getppid(), my_role);

        if ((ret = fork()) < 0) { 
        perror("erro na duplicação do processo");
        return EXIT_FAILURE;
    } 
    */
    
    if (ret > 0) sleep(1);
    printf("Quem sou eu?\nApós o fork: PID = %d, PPID = %d, hierarquia = %s\n",
           getpid(), getppid(), ret == 0 ? "FILHO" : "PAI");

    return EXIT_SUCCESS;
}
