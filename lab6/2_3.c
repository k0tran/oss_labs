//! Child and parent do not exit instantly
//! 10 childs total

#include <unistd.h>

#define NUM_PROCS 10
#define SLEEP_AMOUNT 3

int main() {
    int pid = 0;
    for (int i = 0; i < NUM_PROCS; ++i) {
        int pid = fork();
        if (pid == 0)
            break;
    }

    if (pid == 0) {
        sleep(SLEEP_AMOUNT);
    } else if (pid > 0) {
        sleep(SLEEP_AMOUNT + 1);
    }

    return 0;
}