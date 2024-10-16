#include <dlfcn.h>
#include <stdio.h>
#include <unistd.h>

typedef int (*fork_func_t)(void);

int main() {
  printf("start process pid: %d\n", getpid());

  fork_func_t fork = dlsym(RTLD_DEFAULT, "fork");
  if (NULL == fork) {
    printf("fork symbol not found!\n");
    return 1;
  }

  int pid = fork();
  if (pid != 0) {
    if (pid > 0) {
      printf("exit parent process\n");
    }
    if (pid == -1) {
      printf("fork failed\n");
    }
    return 0;
  }

  printf("continue execution for pid`: %d\n", getpid());

  // wait for 10 seconds before exit
  sleep(10);

  printf("exit child process from pid: %d\n", getpid());

  return 0;
}
