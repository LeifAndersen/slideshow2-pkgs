#lang racket
(require racket/unit)
(provide config^ viewer^ core^ cmdline^)

(define-signature config^
  (printing?
   base-font-size))

(define-signature viewer^
  ())

(define-signature core^
  (t it bt bit tt rt
   sl el click
   render-slide
   el->pict))

(define-signature cmdline^ extends config^
  ())
