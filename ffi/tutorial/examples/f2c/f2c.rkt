#lang racket/base
(require racket/runtime-path
         ffi/unsafe
         (for-syntax racket/base))

(define-runtime-path lib-path (build-path "lib" "f2c"))
(define f2c-lib (ffi-lib lib-path))

(provide f2c)
(define f2c (get-ffi-obj "f2c" f2c-lib (_fun _double -> _double)))


;; Note that the function f2c requires doubles.
;;
;; If we try calling it with a fixnum, we'll get an error because
;; the ffi does not automatically coerse between exact and inexact
;; numbers.
