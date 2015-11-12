#include "stdio.h"
#include "stdlib.h"
#include "assert.h"
#include "string.h"
#include "limits.h"
#include "sys/stat.h"

#define CHANNELS 3

static char base_dir[] = "./ImageColorToGrayscale/Dataset";

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

static void compute(unsigned char *output, unsigned char *input, unsigned int y,
                    unsigned int x) {
  for (unsigned int ii = 0; ii < y; ii++) {
    for (unsigned int jj = 0; jj < x; jj++) {
      unsigned int idx = ii * x + jj;
      float r = input[3 * idx];     // red value for pixel
      float g = input[3 * idx + 1]; // green value for pixel
      float b = input[3 * idx + 2];
      output[idx] = (unsigned char)(0.21f * r + 0.71f * g + 0.07f * b);
    }
  }
}

static unsigned char *generate_data(const unsigned int y,
                                    const unsigned int x) {
  /* raster of y rows
     R, then G, then B pixel
     if maxVal < 256, each channel is 1 byte
     else, each channel is 2 bytes
  */
  unsigned int i;

  const int maxVal = 255;
  unsigned char *data = (unsigned char *)malloc(y * x * 3);

  unsigned char *p = data;
  for (i = 0; i < y * x; ++i) {
    unsigned short r = rand() % maxVal;
    unsigned short g = rand() % maxVal;
    unsigned short b = rand() % maxVal;
    *p++ = r;
    *p++ = g;
    *p++ = b;
  }
  return data;
}

static char *strjoin(const char *s1, const char *s2) {
  char *result = (char *)malloc(strlen(s1) + strlen(s2) + 1);
  strcpy(result, s1);
  strcat(result, s2);
  return result;
}

static void write_data(char *file_name, unsigned char *data, unsigned int width,
                       unsigned int height, unsigned int channels) {
  FILE *handle = fopen(file_name, "w");
  if (channels == 1) {
    fprintf(handle, "P5\n");
  } else {
    fprintf(handle, "P6\n");
  }
  fprintf(handle, "#Created by %s\n", __FILE__);
  fprintf(handle, "%d %d\n", width, height);
  fprintf(handle, "255\n");

  fwrite(data, width * channels * sizeof(unsigned char), height, handle);

  fflush(handle);
  fclose(handle);
}

static void create_dataset(const int datasetNum, const int y, const int x) {
  char dir_name[PATH_MAX];
  sprintf(dir_name, "%s/%d", base_dir, datasetNum);
  _mkdir(dir_name);

  char *input_file_name = strjoin(dir_name, "/input.ppm");
  char *output_file_name = strjoin(dir_name, "/output.ppm");

  unsigned char *input_data = generate_data(y, x);
  unsigned char *output_data =
      (unsigned char *)calloc(sizeof(unsigned char), y * x * 3);

  compute(output_data, input_data, y, x);

  write_data(input_file_name, input_data, x, y, 3);
  write_data(output_file_name, output_data, x, y, 1);

  free(input_data);
  free(output_data);
}

int main() {
  create_dataset(0, 256, 256);
  create_dataset(1, 512, 512);
  create_dataset(2, 512, 256);
  create_dataset(3, 89, 1024);
  create_dataset(4, 1023, 1024);
  create_dataset(5, 1023, 1124);
  create_dataset(6, 1923, 1124);
  create_dataset(7, 1920, 1124);
  create_dataset(8, 1020, 1024);
  create_dataset(9, 3020, 124);
  return 0;
}
