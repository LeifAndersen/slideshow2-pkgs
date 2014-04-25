#lang s-exp slideshow2/slideshow2

(require slideshow2/start-param)

(define (load-content content)
  (define content-path (path->complete-path content))
  (ormap (λ (sm)
           (define submod-path `(submod ,content-path))
           (and (module-declared? submod-path #t)
                (begin
                  (dynamic-require submod-path #f)
                  #t)))
         '(slideshow2 main)))

(when (file-to-load)
  (load-content (string->path (file-to-load))))
    