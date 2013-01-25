#lang racket/base

(require compiler/build-extension)
(build-extension "hello"
                 #:sources (list "hello.c"))
