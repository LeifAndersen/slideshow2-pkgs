#lang racket/base

(require racket/unit
         "sig.rkt"
         "core.rkt")

(provide viewer@)

(define-unit viewer@
  (import core^
          (prefix config: config^))
  (export viewer^))
