#include <stdio.h>

int callTwice(int (*f)(int)) {
  return f(f(42))
}
