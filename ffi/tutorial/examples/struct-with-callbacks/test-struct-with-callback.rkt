#lang racket/base
(require "struct-with-callback.rkt")

(define my-foo
  (make-foo 343 (lambda (self)
                  (printf "<foo ~a>\n" (foo-a self)))))

(print-foo-twice my-foo)
