#lang racket/base
(require ffi/unsafe
         racket/runtime-path
         (for-syntax racket/base))

(provide say-hello)

(define-runtime-path hello-library-path
  (format "~a~a"
          (build-path "lib" "hello")
          (system-type 'so-suffix)))

(define the-lib (ffi-lib hello-library-path))

(define say-hello (get-ffi-obj "sayHello" the-lib
                               (_fun _string -> _void)))
