#lang racket

(provide pre-installer)

(require ffi/tutorial/utils)

(define pre-installer
  (make-pre-installer "struct-with-callback" 
                      #:sources (list "src/struct-with-callback.c")))

;; We can try building the library by hand by just calling the
;; pre-installer, but be sure to first cd into this source's directory
;; before doing so.
(module+ main
 (pre-installer))
