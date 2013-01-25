#lang racket/base
(require "f2c.rkt")

;; should be zero.
(f2c 32.0)

;; should be .555555.
(f2c 33.0)

;; Current weather in SLC Utah as of 2013-01-25:
(f2c 36.0)
