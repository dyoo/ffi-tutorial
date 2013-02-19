#lang racket/base
(require ffi/unsafe
         racket/runtime-path
         (for-syntax racket/base))

(provide say-hello)


(define-runtime-path hello-library-path
  (build-path "lib" "hello"))

(define the-lib (ffi-lib hello-library-path))
(define system-lib (ffi-lib #f))

(define scheme_printf_utf8
  (get-ffi-obj "scheme_printf_utf8" system-lib
               (_fun _bytes _int _int (_ptr i _racket) -> _void)))


(define _say-hello (get-ffi-obj "sayHello" the-lib
                                (_fun (_fun _bytes _int _int (_ptr i _racket) -> _void)
                                      _racket 
                                      -> 
                                      _void)))

(define (say-hello n)
  (_say-hello scheme_printf_utf8 n))
