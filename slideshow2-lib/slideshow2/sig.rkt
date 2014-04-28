#lang racket
(require racket/unit)
(provide config^ viewer^ core^ cmdline^)

(define-signature config^
  (printing?
   base-font-size))

(define-signature viewer^
  ())

(define-signature core^
  (t sl render-slide))

(define-signature cmdline^ extends config^
  ())
