#lang racket

(provide pre-installer)

(require compiler/build-extension
         racket/runtime-path)

(define pre-installer
  (make-pre-installer "hello" #:sources (list "hello.c")))

(module+ main
  (pre-installer #f))
