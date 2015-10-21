#include "stdio.h"
#include "stdlib.h"
#include "assert.h"
#include "string.h"
#include "limits.h"
#include "sys/stat.h"

static char base_dir[] = "./ImageBlur/Dataset";

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

static void compute(unsigned char *output, unsigned char *input0,
                    unsigned int y, unsigned int x, unsigned int maxVal) {
 // TO DO
}

static unsigned char *generate_data(const unsigned int y,
                                    const unsigned int x,
                                    const unsigned maxVal) {
  /* raster of y rows
     R, then G, then B pixel
     if maxVal < 256, each channel is 1 byte
     else, each channel is 2 bytes
  */
  unsigned int i;
  int j;
  const unsigned int pxSz = maxVal < 256 ? 1 : 2;

  unsigned char *data = (unsigned char *) malloc(y * x * 3 * pxSz);

  unsigned char *p = data;
  for (i = 0; i < y * x; ++i) {
    unsigned short r = rand() * maxVal;
    unsigned short g = rand() * maxVal;
    unsigned short b = rand() * maxVal;

    // Emit R channel, then G, then B
    for (j = pxSz - 1; j >= 0; --j) {
      *(p++) = (r >> (8 * j)) & 0xFF;
    }
    for (j = pxSz - 1; j >= 0; --j) {
      *(p++) = (g >> (8 * j)) & 0xFF;
    }
    for (j = pxSz - 1; j >= 0; --j) {
      *(p++) = (b >> (8 * j)) & 0xFF;
    }

  }
  return data;
}

static char *strjoin(const char *s1, const char *s2) {
  char *result = (char *)malloc(strlen(s1) + strlen(s2) + 1);
  strcpy(result, s1);
  strcat(result, s2);
  return result;
}

static void write_data(char *file_name, unsigned char *data, unsigned int num) {
  unsigned int ii;
  FILE *handle = fopen(file_name, "w");
  fprintf(handle, "%d", num);
  for (ii = 0; ii < num; ii++) {
    fwrite(data, sizeof(unsigned char), num, handle);
  }
  fflush(handle);
  fclose(handle);
}

static void create_dataset(const int datasetNum,  const int y, const int x, const int maxVal) {
  char dir_name[PATH_MAX];
  sprintf(dir_name, "%s/%d", base_dir, datasetNum);
  _mkdir(dir_name);

  char *input_file_name = strjoin(dir_name, "/input.raw");
  char *output_file_name = strjoin(dir_name, "/output.raw");

  unsigned int pxSz = maxVal < 256 ? 1 : 2;
  unsigned char *input_data = generate_data(y,x,maxVal);
  unsigned char *output_data = (unsigned char *)calloc(sizeof(unsigned char), y * x * 3 * pxSz);

  compute(output_data, input_data, y, x, maxVal);

  write_data(input_file_name, input_data, y * x * 3 * pxSz);
  write_data(output_file_name, output_data, y * x * 3 * pxSz);

  free(input_data);
  free(output_data);
}

int main() {
  // TO DO
  create_dataset(0, 16, 16, 255);
  return 0;
}
