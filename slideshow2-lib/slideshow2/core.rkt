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

  (define main-theme #f)
  (define current-main-theme (make-parameter main-theme))

  (define main-slide-in-animation #f)
  (define current-main-slide-in-animation (make-parameter main-slide-in-animation))

  (define main-slide-out-animation #f)
  (define current-main-slide-out-animation (make-parameter main-slide-in-animation))

  (define main-element-in-animation #f)
  (define current-main-element-in-animation (make-parameter main-element-in-animation))

  (define main-element-out-animation #f)
  (define current-main-element-out-animation (make-parameter main-element-in-animation))

  (define main-title "")
  (define current-main-title (make-parameter main-title))

  (define main-clicks-to-live #f)
  (define current-main-clicks-to-live (make-parameter main-clicks-to-live))

  (define main-slide-timeout #f)
  (define current-main-slide-timeout (make-parameter main-slide-timeout))

  (define main-element-timeout #f)
  (define current-main-element-timeout (make-parameter main-slide-timeout))

  (define main-append-direction #f)
  (define current-main-append-direction (make-parameter current-main-append-direction))

  (struct slide (title            ; string?
                 comment          ; string?
                 page             ; number?
                 in               ; (or animation? #f)
                 out              ; (or animation? #f)
                 timeout          ; integer?
                 theme            ; theme?
                 content          ; (list-of slide-element?)
                 future-content)) ; (list-of slide-element?)

  (struct slide-element (content           ; pict?
                         append-direction  ; symbol?
                         in                ; (or animation? #f)
                         out               ; (or animation? #f)
                         timeout           ; (or integer? #f)
                         clicks-to-live))  ; (or integer? #f)

  (struct animation? ())

  (define (sl #:title   [title   current-main-title]
              #:in      [in      current-main-slide-in-animation]
              #:out     [out     current-main-slide-out-animation]
              #:timeout [timeout current-main-slide-timeout]
              #:theme   [theme   current-main-theme]
              . elements)
    (slide title "" 0 #f #f #f elements))

  (define (el #:clicks  [clicks  current-main-clicks-to-live]
              #:timeout [timeout current-main-element-timeout]
              #:in      [in      current-main-element-in-animation]
              #:out     [out     current-main-slide-out-animation]
              #:append  [append  current-main-append-direction]
              content)
    #f)

  ; render-slide : slide? -> void?
  (define (render-slide slide)
    #f)

  ; click : (Listof slide?) -> (Listof?)
  (define (click slide-deck)
    (define current-slide (car slide-deck))

    ; reduce-numbers : (Listof slide-element?) -> (Listof slide-element?)
    (define (reduce-number elements)
      (for/list ([element elements])
        (if (slide-element-clicks-to-live element)
            (slide-element (slide-element-content element)
                           (slide-element-append-direction element)
                           (slide-element-in element)
                           (slide-element-out element)
                           (slide-element-timeout element)
                           (- (slide-element-clicks-to-live element) 1))
            element)))

    ; remove-dead-elements : (Listof slide-element?) -> (Listof slide-element?)
    (define (remove-dead-elements elements)
      (filter (λ (element)
                 (not (equal? (slide-element-clicks-to-live element) 0)))
              elements))
    (cond
     [(null? (slide-future-content slide))
      (cdr slide-deck)]
     [else
      (define content
        (append (remove-dead-elements (reduce-number (slide-content current-slide)))
                (car (slide-future-content current-slide))))
      (define future-content
        (cdr (slide-future-content current-slide)))

      (cons (slide (slide-title current-slide)
                   (slide-comment current-slide)
                   (slide-page current-slide)
                   (slide-in current-slide)
                   (slide-out current-slide)
                   (slide-title current-slide)
                   (slide-theme current-slide)
                   content
                   future-content))]))

  ; el->pict : (Listof slideshow-element?) -> pict?
  (define (el->pict slide)
    #f)

  (define (t s) (text s (current-main-font) (current-font-size)))
  (define (it s) (text s `(italic . ,(current-main-font)) (current-font-size)))
  (define (bt s) (text s `(bold . ,(current-main-font)) (current-font-size)))
  (define (bit s) (text s `(bold italic . ,(current-main-font)) (current-font-size)))
  (define (tt s) (text s '(bold . modern) (current-font-size)))
  (define (rt s) (text s 'roman (current-font-size))))
