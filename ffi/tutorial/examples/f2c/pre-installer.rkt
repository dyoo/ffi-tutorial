#lang racket/base
(provide pre-installer)

(require ffi/tutorial/utils)

(define pre-installer
  (make-pre-installer "f2c" #:sources '("src/f2c.c")))

(module+ main
  (pre-installer))
