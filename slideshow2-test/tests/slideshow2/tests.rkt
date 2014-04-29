#lang slideshow2

(require rackunit)

(define slide
  (sl (el (circle 10))
      (el (circle 30))
      'left
      (el (circle 40))
      'right
      (el (t "Hello World"))))

(define deck `(,slide))

(check-equal? null (click (click (click (click deck)))))

(define empty-slide
  (sl))

(check-equal? null (click `(,empty-slide)))

(define larger-deck
  `(,empty-slide ,slide))

(check-equal? slide (car (click larger-deck)))
