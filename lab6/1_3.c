//! Print equal or less than 10 environment variables

#include <stdio.h>

extern char **environ;

int main(int argc, char *argv[]) {
    for (int i = 0; i < 10 && environ[i] != NULL; ++i)
        printf("%s\n", environ[i]);
    
    return 0;
}