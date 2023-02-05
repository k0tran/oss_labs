//! Child and parent do not exit instantly

#include <unistd.h>

#define SLEEP_AMOUNT 3

int main() {
    int pid = fork();

    if (pid == 0) {
        sleep(SLEEP_AMOUNT);
    } else if (pid > 0) {
        sleep(SLEEP_AMOUNT + 1);
    }

    return 0;
}