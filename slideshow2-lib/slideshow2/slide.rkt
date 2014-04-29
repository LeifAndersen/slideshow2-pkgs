#lang racket/base
(require racket/unit
         texpict/utils
         "core.rkt"
         "sig.rkt"
         "param.rkt")

(provide
 sl render-slide t
 (all-from-out texpict/utils))

(define-values/invoke-unit ((current-slideshow-linker) core@)
  (import)
  (export core^))
