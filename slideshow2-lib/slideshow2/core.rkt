#lang racket/base
(require racket/unit
         racket/draw
         texpict/mrpict
         texpict/utils
         "sig.rkt")
(provide core@)

(define-unit core@
  (import config^ (prefix viewer: viewer^))
  (export (rename core^))

  (define main-font (if (and (not printing?)
                             (string=? (get-family-builtin-face 'default) " Sans"))
                        'default
                        'swiss))
  (define current-main-font (make-parameter main-font))

  (define font-size base-font-size)
  (define current-font-size
    (make-parameter
     font-size
     (λ (x)
        (unless (and (number? x)
                     (integer? x)
                     (exact? x)
                     (positive? x))
          (raise-argument-error 'current-font-size "nonnegative-exact-integer?" x))
       x)))

  (struct slide (title
                 comment
                 page
                 in
                 out
                 timeout
                 content))
  (struct slide-element (content
                         next))
  (define (sl #:title title
              #:in in
              #:out out
              . elements)
    (slide title "" 0 #f #f #f elements))
  (define (render-slide slide)
    #f)
  (define (t s) (text s (current-main-font) (current-font-size)))
  )
