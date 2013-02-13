#lang racket/base
(require ffi/unsafe
         racket/runtime-path
         (for-syntax racket/base))

(provide (except-out (all-defined-out) the-lib the-library-path))

(define-runtime-path the-library-path
  (build-path "lib" "output-byte-parameter"))




(define the-lib (ffi-lib the-library-path))

(define iauA2tf 
  (get-ffi-obj "iauA2tf" the-lib
               (_fun  (ndp : _int)
                      (angle : _double)
                      (sign : (_ptr o _byte))  ; <====
                      (idmsf : (_ptr o (_array/vector _int 4)))
                      -> _void
                      -> (values sign idmsf))))
