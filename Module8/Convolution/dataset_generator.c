#include <wbDataGenerator.h>

int main(void) {

  // Export images
  wbExportKind_t kind = wbExportKind_ppm;

  wbPPM_GenerateParams_t ppm_params = {100, 100, 3, 0, 255};
  wbGenerateParams_t params = {.ppm = ppm_params};

  GenerateDataset()
  return 0;
}
