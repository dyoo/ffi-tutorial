#lang racket/base
(require "strdup.rkt")

(for ([i (in-naturals)])
  (displayln (strdup ""))
  (displayln (strdup "Hello World!")))
