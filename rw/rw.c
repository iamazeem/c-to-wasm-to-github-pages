#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  if (argc != 3) {
    fprintf(stderr, "Usage: %s [input-file] [output-file]\n", argv[0]);
    return EXIT_FAILURE;
  }

  const char *input_filename = argv[1];
  const char *output_filename = argv[2];

  if (!strcmp(input_filename, output_filename)) {
    fprintf(stderr, "Input and output files cannot be the same!\n");
    return EXIT_FAILURE;
  }

  FILE *input_file = fopen(input_filename, "r");
  if (!input_file) {
    fprintf(stderr, "Unable to open input file! [%s]\n", input_filename);
    return EXIT_FAILURE;
  }

  FILE *output_file = fopen(output_filename, "w");
  if (!output_file) {
    fprintf(stderr, "Unable to open output file! [%s]\n", output_filename);
    fclose(input_file);
    return EXIT_FAILURE;
  }

  char buffer[1024] = {0};
  while (fgets(buffer, sizeof buffer, input_file)) {
    fputs(buffer, output_file);
  }

  fclose(input_file);
  fclose(output_file);

  return EXIT_SUCCESS;
}
