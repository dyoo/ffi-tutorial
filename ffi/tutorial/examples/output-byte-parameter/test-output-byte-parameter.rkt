#lang racket/base
(require "output-byte-parameter.rkt"
         ffi/unsafe)


(define-values (a-byte an-array) (iauA2tf 1 1.0))
a-byte
an-array
