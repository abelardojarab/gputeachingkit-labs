#include "stdio.h"
#include "stdlib.h"
#include "assert.h"
#include "string.h"
#include "limits.h"
#include "sys/stat.h"

static char base_dir[] = "./ReductionThrust/Dataset";

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

static float compute(float *input, int num) {
  float ret = 0;
  for (int ii = 0; ii < num; ++ii) {
    ret += input[ii];
  }
  return ret;
}

static float *generate_data(int n) {
  float *data = (float *)malloc(sizeof(float) * n);
  for (int i = 0; i < n; i++) {
    data[i] = ((float)(rand() % 20) - 5) / 5.0f;
  }
  return data;
}

static char *strjoin(const char *s1, const char *s2) {
  char *result = (char *)malloc(strlen(s1) + strlen(s2) + 1);
  strcpy(result, s1);
  strcat(result, s2);
  return result;
}

static void write_data(char *file_name, float *data, int num) {
  FILE *handle = fopen(file_name, "w");
  fprintf(handle, "%d", num);
  for (int ii = 0; ii < num; ii++) {
    fprintf(handle, "\n%.2f", *data++);
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

  float *input_data = generate_data(dim);
  float output_data;

  output_data = compute(input_data, dim);

  write_data(input_file_name, input_data, dim);
  write_data(output_file_name, &output_data, 1);

  free(input_data);
}

int main() {
  create_dataset(0, 16);
  create_dataset(1, 64);
  create_dataset(2, 93);
  create_dataset(3, 112);
  create_dataset(4, 1120);
  create_dataset(5, 1233);
  create_dataset(6, 1033);
  create_dataset(7, 4098);
  create_dataset(8, 4018);
  create_dataset(9, 1);
  return 0;
}
