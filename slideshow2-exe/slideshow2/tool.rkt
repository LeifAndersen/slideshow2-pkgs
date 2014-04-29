#lang racket/base

(require drracket/tool
         racket/class
         racket/gui/base
         racket/unit
         mrlib/switchable-button
         "start.rkt")

(provide tool@)

(define-unit tool@
  (import drracket:tool^)
  (export drracket:tool-exports^)

  (define play-slideshow-button-mixin
    (mixin (drracket:unit:frame<%>) ()
      (super-new)
      (inherit get-button-panel
               get-definitions-text)
      (inherit register-toolbar-button)

      (let ((btn
             (new switchable-button%
                  (label "Play Slideshow (not implemented yet, use click and render-slide manually)")
                  (callback (λ (button)
                               (play-slideshow
                                (get-definitions-text))))
                  (parent (get-button-panel))
                  (bitmap play-slideshow-bitmap))))
        (register-toolbar-button btn #:number 11)
        (send (get-button-panel) change-children
              (λ (l)
                 (cons btn (remq btn l)))))))

  (define play-slideshow-bitmap
      (let* ((bmp (make-bitmap 16 16))
             (bdc (make-object bitmap-dc% bmp)))
        (send bdc erase)
        (send bdc set-smoothing 'smoothed)
        (send bdc set-pen "black" 1 'transparent)
        (send bdc set-brush "blue" 'solid)
        (send bdc draw-ellipse 2 2 8 8)
        (send bdc set-brush "red" 'solid)
        (send bdc draw-ellipse 6 6 8 8)
        (send bdc set-bitmap #f)
        bmp))

  (define (phase1) (void))
  (define (phase2) (void))

  (drracket:get/extend:extend-unit-frame play-slideshow-button-mixin))
