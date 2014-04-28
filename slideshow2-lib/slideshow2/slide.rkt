#lang racket/base
(require racket/unit
         "core.rkt"
         "sig.rkt"
         "param.rkt")

(provide
 sl render-slide t)

(define-values/invoke-unit ((current-slideshow-linker) core@)
  (import)
  (export core^))
