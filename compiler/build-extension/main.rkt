#lang racket/base

(provide build-extension
         make-pre-installer)

(require racket/file
         racket/path
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
;;
;;
;; Paths should be all relative to the (sub)collection.
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
    (build-path tmpdir 
                (path-replace-suffix (file-name-from-path file) ".o")))

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



;; A little helper to do the necessary work of making the pre-installer
;; function that raco setup uses.
(define (make-pre-installer basename
                            #:sources (sources '())
                            ;;#:define-macros (define-macros '())
                            #:include-dirs (include-dirs '())
                            ;;#:libraries (libraries '())
                            ;;#:library-dirs (library-dirs '())
                            #:quiet? (quiet? #t))

  ;; The pre-installer doesn't care about the parent of the collects
  ;; subdirectory, but does want to make sure current-directory
  ;; is set to self-dir.
  (define (pre-installer [racket-collects-parent-dir #f] 
                         [self-dir (current-directory)])
    (parameterize ([current-directory self-dir])
      (build-extension basename
                       #:sources sources
                       #:dest-dir (build-path self-dir "lib")
                       #:include-dirs include-dirs
                       #:quiet? quiet?)))

  pre-installer)
