#lang racket/base
(require "hello.rkt")


;; Now we can just call say-hello:
(printf "before\n")(say-hello "Danny")(printf "\nafter\n")