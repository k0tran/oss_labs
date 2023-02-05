//! Print argc AND number of environment variables
//! Example output:
//! Number of command-line arguments: 3
//! Number of environment variables: 10
//!
//! Compile: gcc -Wall 1_2.c -o 1_2
//!
//! Test 1: env -i ./1_2
//! Should output:
//! Number of command-line arguments: 0
//! Number of environment variables: 0
//!
//! Test 2: env -i TEST=WORKS ./1_2 test_cmd_arg
//! Should output:
//! Number of command-line arguments: 1
//! Number of environment variables: 1

#include <stdio.h>

extern char **environ;

int main(int argc, char *argv[]) {
    int i = 0;
    
    for (char **p = environ; *p != NULL; ++p) ++i;
    
    printf("Number of command-line arguments: %d\nNumber of environment variables: %d\n", argc - 1, i);
    
    return 0;
}