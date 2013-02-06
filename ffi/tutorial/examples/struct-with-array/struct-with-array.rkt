#lang racket/base
(require ffi/unsafe
         racket/runtime-path
         (for-syntax racket/base))

(provide (except-out (all-defined-out) the-lib the-library-path))

(define-runtime-path the-library-path
  (build-path "lib" "struct-with-array"))

#|
struct foo {
  int a;
  char b[42];
};
|#

(define _bytes/len
  (case-lambda
   [(n)
    (make-ctype (make-array-type _byte n)
                ;; ->c
                (lambda (v)
                  (unless (and (bytes? v) (= (bytes-length v) n))
                    (raise-argument-error '_chars/bytes 
                                          (format "bytes of length ~a" n)
                                          v))
                  v)
                ;; ->racket
                (lambda (v)
                  (make-sized-byte-string v n)))]))


(define-cstruct _foo ([a _int]
                      [b (_bytes/len 42)]))

(define the-lib (ffi-lib the-library-path))

(define print-foo (get-ffi-obj "printFoo" the-lib
                               (_fun _foo -> _void)))
