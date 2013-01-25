#lang racket

(provide pre-installer)

(require compiler/build-extension)

(define pre-installer
  (make-pre-installer "hello" #:sources (list "src/hello.c")))

(module+ main
 (pre-installer))
