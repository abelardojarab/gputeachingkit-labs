#include "wb.h"

int main(void) {

  // Image generation parameters
  wbPPM_GenerateParams_t ppm_params;
  ppm_params.height = 100;
  ppm_params.width = 100;
  ppm_params.channels = 3;
  ppm_params.minVal = 0;
  ppm_params.maxVal = 255;

  // Generation parameters are just the image generation parameters
  wbGenerateParams_t params;
  params.ppm = ppm_params;
 
  GenerateDataset(NULL, wbExportKind_ppm, params);
  return 0;
}
