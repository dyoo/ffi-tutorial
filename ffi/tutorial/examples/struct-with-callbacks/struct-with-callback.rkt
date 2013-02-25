#lang racket/base
(require ffi/unsafe
         racket/runtime-path
         (for-syntax racket/base))

(provide (except-out (all-defined-out) the-lib the-library-path))

(define-runtime-path the-library-path
  (build-path "lib" "struct-with-callback"))

#|
struct foo {
  int a;
  void (*printFoo)(struct foo* f);
};
|#


(define-cstruct _foo ([a _int]
                      [printfoo (_fun _foo -> _void)]))

(define the-lib (ffi-lib the-library-path))

(define print-foo 
  (get-ffi-obj "printFooTwice" the-lib
               (_fun _foo -> _void)))
