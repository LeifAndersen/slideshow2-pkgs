#lang racket
(require "base.rkt")
(provide (except-out (all-from-out racket
                                   "base.rkt")
                     printable<%>))

(module reader syntax/module-reader
  slideshow2)
