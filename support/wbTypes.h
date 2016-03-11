

#ifndef __WB_TYPES_H__
#define __WB_TYPES_H__

typedef bool wbBool;
typedef float wbReal_t;
typedef char wbChar_t;

typedef struct st_wbTimerNode_t *wbTimerNode_t;
typedef struct st_wbTimer_t *wbTimer_t;
typedef struct st_wbLogEntry_t *wbLogEntry_t;
typedef struct st_wbLogger_t *wbLogger_t;
typedef struct st_wbArg_t wbArg_t;
typedef struct st_wbImage_t *wbImage_t;
typedef struct st_wbFile_t *wbFile_t;

#define wbTrue true
#define wbFalse false

typedef enum en_wbType_t {
  wbType_ubit8 = 0,
  wbType_integer,
  wbType_float,
  wbType_double
} wbType_t;

#endif /* __WB_TYPES_H__ */
