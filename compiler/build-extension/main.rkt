#lang racket/base


(provide build-extension)


;; A small helper to make it easier to build extension libraries.  The
;; design is meant to mimic the extension-building part of Python's
;; distutils system, by doing the building and linking for us.
;;
;; We should automate the work that raco ctool is doing, and make it
;; easy to drive from info.rkt.

;; build-extension: [base-name string]
;;                  [#:sources (listof string)]
;;
;;                 -> void
;; Write out the dynamic library.
(define (build-extension base-name
                         #:sources (sources '())
                         ;;#:define-macros (define-macros '())
                         ;;#:include-dirs (include-dirs '())
                         ;;#:libraries (libraries '())
                         ;;#:library-dirs (library-dirs '())
                         )
  (void))

