#lang racket/base
(require ffi/tutorial/utils)

(define pre-installer
  (make-pre-installer "f2c" #:sources '("src/f2c.c")))

(module+ main
  (pre-installer))
