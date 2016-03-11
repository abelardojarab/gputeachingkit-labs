#include "wb.h"

#ifdef WB_USE_LINUX
static void mkdir_(const char *dir) { mkdir(dir, S_IRWXU); }
#else /* WB_USE_LINUX */
static void mkdir_(const char *dir) { _mkdir(dir); }
#endif /* WB_USE_LINUX */

EXTERN_C void CreateDirectory(const char *dir) {
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
      mkdir_(tmp);
      *p = '/';
    }
  mkdir_(tmp);
}
