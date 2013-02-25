#lang racket/base
(require "struct-with-callback.rkt")

(define my-foo
  (make-foo 343 (lambda (self)
                  (displayln "foo!"))))

(print-foo-twice my-foo)
