(module core racket/base
  (require racket/unit
           racket/draw
           texpict/mrpict
           texpict/utils
           "sig.rkt")
  (provide core@)

  (define-unit core@
    (import config^ (prefix viewer: viewer^))
    (export (rename core^
                    (local:condense? condense?)
                    (local:printing? printing?)))

    (define local:condense? condense?)
    (define local:printing? printing?)

    (define font-size base-font-size)
    (define gap-size (* 3/4 font-size))
    (define current-gap-size (make-parameter gap-size))
    (define line-sep 2)
    (define title-size (+ font-size 4))
    (define main-font (if (and (not printing?)
                               (string=? (get-family-builtin-face 'default) " Sans"))
                          'default
                          'swiss))

    (define current-main-font (make-parameter main-font))

    (define current-line-sep (make-parameter line-sep))

    (define current-font-size
      (make-parameter
       font-size
       (lambda (x)
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
    ))
