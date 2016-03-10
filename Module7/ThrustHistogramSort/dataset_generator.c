
#include "stdio.h"
#include "assert.h"
#include "limits.h"
#include "stdlib.h"
#include "string.h"
#include "sys/stat.h"

static char base_dir[] = "./ThrustHistogramSort/Dataset/";

static void _mkdir(const char *dir) {
  char tmp[PATH_MAX];
  char *p = NULL;
  size_t len;

  snprintf(tmp, sizeof(tmp), "%s", dir);
  len = strlen(tmp);
  if (tmp[len - 1] == '/')
    tmp[len - 1] = 0;
  for (p = tmp + 1; *p; p++)
    if (*p == '/') {
      *p = 0;
      mkdir(tmp, S_IRWXU);
      *p = '/';
    }
  mkdir(tmp, S_IRWXU);
}

static void generate_data(unsigned int **input, unsigned int **bins,
                          size_t *num_bins, // outputs
                          const size_t num_inputs,
                          const size_t max_num_bins) { // input
  // Allocate space for inputs
  *input = (unsigned int *)malloc(sizeof(unsigned int) * num_inputs);

  // Fill inuts, track the largest generated value
  int input_max = 0;
  for (unsigned int i = 0; i < num_inputs; i++) {
    int newval = rand() % max_num_bins;
    (*input)[i] = newval;
    if (newval > input_max) {
      input_max = newval;
    }
  }

  // Allocate 0s for the number of bins
  *num_bins = input_max + 1;
  (*bins) = (unsigned int *)calloc(*num_bins, sizeof(unsigned int));

  // Compute the histogram
  for (unsigned int i = 0; i < num_inputs; ++i) {
    (*bins)[(*input)[i]]++;
  }
}

static char *strjoin(const char *s1, const char *s2) {
  char *result = (char *)malloc(strlen(s1) + strlen(s2) + 1);
  strcpy(result, s1);
  strcat(result, s2);
  return result;
}

static void write_data(char *file_name, unsigned int *data, int num) {
  FILE *handle = fopen(file_name, "w");
  fprintf(handle, "%d", num);
  for (int ii = 0; ii < num; ii++) {
    fprintf(handle, "\n%d", *data++);
  }
  fflush(handle);
  fclose(handle);
}

static void create_dataset(int datasetNum, const size_t num_inputs,
                           size_t max_bins) {
  char dir_name[PATH_MAX];
  sprintf(dir_name, "%s/%d", base_dir, datasetNum);
  _mkdir(dir_name);

  char *input_file_name = strjoin(dir_name, "input.raw");
  char *output_file_name = strjoin(dir_name, "output.raw");

  unsigned int *input_data, *bin_data;
  size_t num_bins;

  generate_data(&input_data, &bin_data, &num_bins, num_inputs, max_bins);

  write_data(input_file_name, input_data, num_inputs);
  write_data(output_file_name, bin_data, num_bins);

  free(input_data);
  free(bin_data);
}

int main() {
  create_dataset(0, 16, 32);
  create_dataset(1, 1024, 32);
  create_dataset(2, 513, 32);
  create_dataset(3, 511, 32);
  create_dataset(4, 1, 32);
  create_dataset(5, 4096, 4096);
  return 0;
}
