#ifndef __WB_DATASET_GENERATOR__
#define __WB_DATASET_GENERATOR__

#include "wbImport.h"
#include "wbTypes.h"

typedef struct {
  int rows;
  int cols;
  char seperator;
  wbType_t type;
  int min;
  int max;
} wbCSV_GenerateParams_t;

typedef struct {
  int rows;
  int cols;
  int min;
  int max;
  wbType_t type;
} wbRaw_GenerateParams_t;

typedef struct {
  int width;
  int height;
  int channels;
  wbReal_t min;
  wbReal_t max;
} wbPPM_GenerateParams_t;

typedef struct { int length; } wbText_GenerateParams_t;

typedef union {
  wbCSV_GenerateParams_t csv;
  wbRaw_GenerateParams_t raw;
  wbPPM_GenerateParams_t image;
  wbText_GenerateParams_t text;
} wbGenerateParams_t;

EXTERN_C void GenerateDataset(const char *path, wbExportKind_t kind,
                              wbGenerateParams_t params);

#endif /* __WB_DATASET_GENERATOR__ */
