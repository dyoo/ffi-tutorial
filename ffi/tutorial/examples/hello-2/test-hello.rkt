#lang racket/base
(require "hello.rkt")

(struct person (name) #:transparent)

;; Now we can just call say-hello:
(printf "before\n")
(say-hello "Danny")
(newline)
(say-hello (person "Danny"))
(newline)
(printf "after\n")