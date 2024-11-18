#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  if (argc != 3) {
    fprintf(stderr, "Usage: %s [input-file] [output-file]\n", argv[0]);
    return EXIT_FAILURE;
  }

  const char *input_file = argv[1];
  const char *output_file = argv[2];

  FILE *input = fopen(input_file, "r");
  if (!input) {
    fprintf(stderr, "Unable to open input file! [%s]\n", input_file);
    return EXIT_FAILURE;
  }

  FILE *output = fopen(output_file, "w");
  if (!output) {
    fprintf(stderr, "Unable to open output file! [%s]\n", output_file);
    fclose(input);
    return EXIT_FAILURE;
  }

  char buffer[1024] = {0};
  while (fgets(buffer, sizeof buffer, input)) {
    fputs(buffer, output);
  }

  fclose(input);
  fclose(output);

  return EXIT_SUCCESS;
}
