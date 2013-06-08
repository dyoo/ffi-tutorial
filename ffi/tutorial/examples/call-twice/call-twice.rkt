#lang racket/base
(require ffi/unsafe
         racket/runtime-path
         (for-syntax racket/base))

(provide call-twice)

(define-runtime-path call-twice-path
  (build-path "lib" "call-twice"))

(define the-lib (ffi-lib call-twice-path))

(define call-twice (get-ffi-obj "callTwice" the-lib
                               (_fun (_fun _int -> _int) -> _int)))
