#include <stdio.h>

struct foo {
  int a;
  char b[42];
};


void printFoo(struct foo f) {
  printf("<struct:foo %d %s>", f.a f.b);
}
