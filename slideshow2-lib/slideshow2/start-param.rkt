#lang racket

(provide file-to-load trusting?)

(define file-to-load (make-parameter #f))
(define trusting?    (make-parameter #f))
