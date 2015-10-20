
#include "stdio.h"
#include "stdlib.h"
#include "assert.h"
#include "string.h"
#include "limits.h"
#include "sys/stat.h"

static char base_dir[] = "./ListReduction/Dataset";

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

static void compute(int *output, int *input, int num) {
  int accum = 0;
  for (int ii = 0; ii < num; ++ii) {
    accum += input[ii];
  }
  output[0] = accum;
}

static int *generate_data(int n) {
  int *data = (int *)malloc(sizeof(int) * n);
  for (int i = 0; i < n; i++) {
    data[i] = rand() % 4;
  }
  return data;
}

static char *strjoin(const char *s1, const char *s2) {
  char *result = (char *)malloc(strlen(s1) + strlen(s2) + 1);
  strcpy(result, s1);
  strcat(result, s2);
  return result;
}

static void write_data(char *file_name, int *data, int num) {
  FILE *handle = fopen(file_name, "w");
  fprintf(handle, "%d", num);
  for (int ii = 0; ii < num; ii++) {
    fprintf(handle, "\n%d", *data++);
  }
  fflush(handle);
  fclose(handle);
}

static void create_dataset(int datasetNum, int dim) {
  char dir_name[PATH_MAX];
  sprintf(dir_name, "%s/%d", base_dir, datasetNum);
  _mkdir(dir_name);

  char *input_file_name = strjoin(dir_name, "/input.raw");
  char *output_file_name = strjoin(dir_name, "/output.raw");

  int *input_data = generate_data(dim);
  int *output_data = (int *)calloc(sizeof(int), 1);

  compute(output_data, input_data, dim);

  write_data(input_file_name, input_data, dim);
  write_data(output_file_name, output_data, 1);

  free(input_data);
  free(output_data);
}

int main() {
  create_dataset(0, 16);
  create_dataset(1, 64);
  create_dataset(2, 93);
  create_dataset(3, 112);
  create_dataset(4, 1120);
  create_dataset(5, 9921);
  create_dataset(6, 1233);
  create_dataset(7, 1033);
  create_dataset(8, 4098);
  create_dataset(9, 4018);
  return 0;
}
