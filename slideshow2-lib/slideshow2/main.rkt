#lang racket
(require "base.rkt"
         "slide.rkt")
(provide (except-out (all-from-out racket
                                   "base.rkt"
                                   "slide.rkt")
                     printable<%>))

(module reader syntax/module-reader
  slideshow2)
