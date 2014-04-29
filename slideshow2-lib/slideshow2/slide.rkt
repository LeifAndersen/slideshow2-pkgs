#lang racket/base
(require racket/unit
         texpict/utils
         "core.rkt"
         "sig.rkt"
         "param.rkt")

(provide
 t it bt bit tt rt
 sl el click
 render-slide
 el->pict
 (all-from-out texpict/utils))

(define-values/invoke-unit ((current-slideshow-linker) core@)
  (import)
  (export core^))
