#lang racket/base
(require "call-twice.rkt")


(call-twice (lambda (x)
              (* x x)))

(call-twice add1)
