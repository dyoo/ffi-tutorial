#lang racket/base

(require compiler/build-extension)
(build-extension "hello"
                 #:dest-dir (current-directory)
                 #:sources (list "hello.c"))
