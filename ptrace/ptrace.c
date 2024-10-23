#include <stdio.h>
#include <sys/ptrace.h>
#include <unistd.h>

int main() {
  printf("Run in pid %d\n", getpid());
  printf("Check if debugger is attached\n");
  if (ptrace(31, 0, 0, 0) < 0) {
    perror("ptrace");
    return 1;
  }
  printf("Debugger is not attached!\n");
  printf("Run... \n");
  sleep(1000);
  return 0;
}
