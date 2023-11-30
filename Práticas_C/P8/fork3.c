#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char *argv[])
{
    printf("Pai (antes do fork): PID = %u, PPID = %u\n", getpid(), getppid());
    switch (fork())
    {
      case -1: /* fork falhou */
               perror("Erro no fork\n");
               return EXIT_FAILURE;
      case 0:  /* processo filho */
               if (execl("./child", "./child", NULL) < 0) { // ./child is the path to the executable and the only argument.
                   perror("erro no lancamento da aplicacao");
                   return EXIT_FAILURE;
               }
               printf("Porque é que eu não apareço?\n");
               break;
      default: /* processo pai */
               sleep(1);
               wait(NULL); // wait for the child process to complete
               printf("Pai (depois do fork): PID = %u, PPID = %u\n", getpid(), getppid());
    }

    return EXIT_SUCCESS;
}
