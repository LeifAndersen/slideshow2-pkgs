#lang racket/base

(require racket/unit
         racket/contract
         "sig.rkt")
(provide cmdline@)

(define-unit cmdline@
  (import)
  (export (prefix final: cmdline^))

  (define base-font-size 32)
  (define printing-mode #f)
  (define printing? (and printing-mode #f))

  (define-unit-from-context final@ cmdline^)
  (define-values/invoke-unit final@
    (import)
    (export (prefix final: cmdline^))))
