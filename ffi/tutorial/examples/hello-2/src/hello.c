#include <string.h>

void sayHello(void (*scheme_printf_utf8)
              (char* format, int flen, int argc, void** argv),
              void *name) {
  char* msg = "~s says: hello!";
  scheme_printf_utf8(msg, strlen(msg), 1, name);
}
