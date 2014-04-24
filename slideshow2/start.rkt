(module start slideshow2/slideshow2
  (require slideshow2/start-param)
  
  (define (load-content content)
    (define current-path (path->complete-path content))
    (ormap (λ (sm)
             (define submod-path `(submod ,content-path ,sm))
             (and (module-declared? submod-path #t)
                  (begin (dynamic-require submod-path #f)
                         #t)))
           '(slideshow main)))
  
  (when (file-to-load)
    (load-content (string->path (file-to-load)))))