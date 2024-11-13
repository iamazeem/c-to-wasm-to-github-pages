#include <stdio.h>
#include <stdlib.h>

#define MIN_VALUE 1
#define MAX_VALUE 10
#define VALID(n) (n >= MIN_VALUE && n <= MAX_VALUE)

int main(int argc, char *argv[]) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s [n]\n", argv[0]);
    return EXIT_FAILURE;
  }
  const int n = atoi(argv[1]);
  if (n == 0) {
    fprintf(stderr, "Invalid input for [n]! [%s]\n", argv[1]);
    return EXIT_FAILURE;
  } else if (!VALID(n)) {
    fprintf(stderr, "Invalid input! [%s]\n", argv[1]);
    fprintf(stderr, "Valid range: %d >= n <= %d\n", MIN_VALUE, MAX_VALUE);
    return EXIT_FAILURE;
  }
  fprintf(stdout, "n = %d\n", n);
  return EXIT_SUCCESS;
}
