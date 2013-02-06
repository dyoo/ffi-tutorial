#lang racket/base
(require ffi/unsafe
         racket/runtime-path
         (for-syntax racket/base))

(provide say-hello)

(define-runtime-path the-library-path
  (build-path "lib" "struct-with-array"))

(define-cstruct _foo ([a _int]
                      [b _array _byte 42]))

(define the-lib (ffi-lib the-library-path))

(define say-hello (get-ffi-obj "printFoo" the-lib
                               (_fun _foo -> _void)))
