#lang racket/base


(provide build-extension)

(require racket/file
         dynext/compile
         dynext/link)


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
                         #:dest-dir (dest-dir 
                                     (build-path (current-directory) "lib"))
                         ;;#:define-macros (define-macros '())
                         #:include-dirs (include-dirs '())
                         ;;#:libraries (libraries '())
                         ;;#:library-dirs (library-dirs '())
                         )
  (make-directory* dest-dir)
  (define tmpdir (make-temporary-file "tmp~a" 'directory dest-dir))

  (for ([file sources])
    (compile-extension #t
                       file 
                       (build-path tmpdir (path-replace-suffix file ".o"))
                       include-dirs))
  ;;(delete-directory/files tmpdir)
  )
