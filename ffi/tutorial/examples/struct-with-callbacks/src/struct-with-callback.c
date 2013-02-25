struct foo {
  int a;
  void (*printFoo)(struct foo* f);
};


void printFooTwice(struct foo *f) {
  f->printFoo(f);
  f->printFoo(f);
}
