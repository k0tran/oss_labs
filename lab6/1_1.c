//! Print number of environment variables
//! Example output:
//! Number of environment variables: 10
//!
//! Compile: gcc -Wall 1_1.c -o 1_1
//!
//! Test 1: env -i ./1_1
//! Should output: 
//! Number of environment variables: 0
//!
//! Test 2: env -i TEST=WORKS ./1_1
//! Should output: 
//! Number of environment variables: 1

#include <stdio.h>

extern char **environ;

int main(int argc, char *argv[]) {
    int i = 0;
    
    for (char **p = environ; *p != NULL; ++p) ++i;
    
    printf("Number of environment variables: %d\n", i);
    
    return 0;
}