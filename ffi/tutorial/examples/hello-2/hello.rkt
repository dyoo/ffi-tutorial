#lang racket/base
(require ffi/unsafe
         ffi/unsafe/cvector
         racket/runtime-path
         (for-syntax racket/base))

(provide say-hello)


(define-runtime-path hello-library-path
  (build-path "lib" "hello"))

(define the-lib (ffi-lib hello-library-path))
(define system-lib (ffi-lib #f))

;; Expose the Scheme level printf function for the C code to use.
;; The type of the printf function is:
(define scheme_printf_utf8_t
  (_fun (format-str : _bytes)
        (format-str-len : _int)
        (argc : _int)
        (argv : (_ptr i _racket))
        -> _void))

(define scheme_printf_utf8
  (get-ffi-obj "scheme_printf_utf8" system-lib scheme_printf_utf8_t))


(define _say-hello (get-ffi-obj "sayHello" the-lib
                                (_fun scheme_printf_utf8_t
                                      _racket 
                                      -> 
                                      _void)))

(define (say-hello n)
  (_say-hello scheme_printf_utf8 n))
