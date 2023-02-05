//! Child and parent do not exit instantly
//! NUM_PROCS childs total

#include <unistd.h>

#ifndef NUM_PROCS
#define NUM_PROCS 10
#endif
#define SLEEP_AMOUNT 3

int main() {
    int pid = 0;
    for (int i = 0; i < NUM_PROCS; ++i) {
        int pid = fork();
        if (pid < 0)
            return 1;
        if (pid == 0)
            break;
    }

    if (pid == 0) {
        sleep(SLEEP_AMOUNT);
    } else if (pid > 0) {
        sleep(SLEEP_AMOUNT);
    }

    return 0;
}