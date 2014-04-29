#lang racket/base

(require racket/unit
         racket/contract
         racket/cmdline
         "sig.rkt"
         (prefix-in start: "start-param.rkt"))

(provide cmdline@)

(define-unit cmdline@
  (import)
  (export (prefix final: cmdline^))

  (define screen-w 1024)
  (define screen-h 768)
  (define base-font-size 32)
  (define printing-mode #f)
  (define printing? (and printing-mode #f))

  (define file-to-load
    (command-line
     #:program "slideshow2"
     #:args ([slide-module-file #f])
     slide-module-file))

  (start:file-to-load file-to-load)

  (define-unit-from-context final@ cmdline^)
  (define-values/invoke-unit final@
    (import)
    (export (prefix final: cmdline^))))
