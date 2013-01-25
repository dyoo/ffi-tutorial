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

;; build-extension: [basename string]
;;                  [#:sources (listof string)]
;;
;;                 -> void
;; Write out the dynamic library.
(define (build-extension basename
                         #:sources (sources '())
                         #:dest-dir (dest-dir 
                                     (build-path (current-directory) "lib"))
                         ;;#:define-macros (define-macros '())
                         #:include-dirs (include-dirs '())
                         ;;#:libraries (libraries '())
                         ;;#:library-dirs (library-dirs '())
                         #:quiet? (quiet? #t)
                         )
  (make-directory* dest-dir)
  (define tmpdir (make-temporary-file "tmp~a" 'directory dest-dir))


  ;; Translate the .c name to the object path.
  (define (c->o file)
    (build-path tmpdir (path-replace-suffix file ".o")))

  ;; First, build all the C source files.
  (for ([file sources])
    (compile-extension quiet? file (c->o file) include-dirs))

  ;; Next, link them all together to a dynamic library.
  (define dynamic-library 
    (build-path dest-dir (format "~a~a" basename (system-type 'so-suffix))))
  (link-extension quiet?
                  (for/list ([file sources]) (c->o file))
                  dynamic-library)

  ;; Finally, clean up.
  (delete-directory/files tmpdir))
