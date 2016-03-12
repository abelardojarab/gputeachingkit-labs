
#include "wb.h"
#include "catch.hpp"

TEST_CASE("Can create Raw dataset", "[DataGenerator]") {
  wbGenerateParams_t params;
  params.raw.rows   = 2;
  params.raw.cols   = 300;
  params.raw.minVal = 0;
  params.raw.maxVal = 30;
  params.raw.type   = wbType_integer;
  GenerateDataset("test-dataset/test.raw", wbExportKind_raw, params);
}
