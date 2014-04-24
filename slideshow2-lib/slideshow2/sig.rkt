(module sig racket
  (require racket/unit)
  (provide config^ viewer^ core^)
  ;; Configuration inputs to the core unit:
  (define-signature config^
    (base-font-size             ; normally 32
     screen-w screen-h          ; logical size, normally 1024x768
     use-screen-w use-screen-h  ; "pixel" size
     pixel-scale                ; amount the "pixels" are scaled (e.g., for quad)
     condense? printing?        ; mode
     smoothing?
     commentary-on-slide?))

  ;; Viewer inputs to the core unit:
  (define-signature viewer^
    (;; Registering slides:
     add-talk-slide!
     retract-talk-slide!
     most-recent-talk-slide
     ;; Pass-through of slide-program requests:
     set-init-page!
     set-use-background-frame!
     enable-click-advance!
     set-page-numbers-visible!
     done-making-slides
     set-spotlight-style!
     ;; Called when a clickback-containing slide is rendered:
     add-click-region!
     ;; Called when a interactive-containing slide is rendered:
     add-interactive!
     ;; To potentially speed up display:
     pict->pre-render-pict))

  (define-signature core^
    (t sl render-slide
     condense?
     printing?)))
