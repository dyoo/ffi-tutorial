#lang racket/base
(require "struct-with-array.rkt")

;; bytes->padded: bytes n -> bytes
;; Makes a copy of bstr with the appropriate length.
(define (bytes-padded bstr len)
  (define b (make-bytes len))
  (bytes-copy! b 0 bstr)
  b)

(define my-foo
  (make-foo 16 (bytes-padded #"This is a byte string" 42)))

(print-foo my-foo)
(newline)
