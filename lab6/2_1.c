//! Print child and parent PID in child proc

#include <stdio.h>
#include <unistd.h>

int main() {
    int pid = fork();

    if (pid == 0) {
        printf("Привет из дочернего процесса\nЕго pid = 0\nРодительский pid = %d\n", getppid());
    } else if (pid > 0) {
        puts("Привет из родительского процесса");
    }

    return 0;
}