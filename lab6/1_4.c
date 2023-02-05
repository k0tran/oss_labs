//! Print equal or less than arg[1] environment variables

#include <stdio.h>
#include <stdlib.h>

extern char **environ;

int main(int argc, char *argv[]) {
    // check argc
    if (argc != 2) {
        printf("Usage:\n%s NUMBER\n", argv[0]);
        return 1;
    }

    // try to cast
    int limit = atoi(argv[1]);
    if (!limit || limit < 0) {
        puts("Incorrect number value");
        return 1;
    }

    for (int i = 0; i < limit && environ[i] != NULL; ++i)
        printf("%s\n", environ[i]);
    
    return 0;
}