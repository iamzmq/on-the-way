#lang slideshow

; public functions.

(define (s-t content size) (text content (current-main-font) size))
(define v vl-append)
(define h hc-append)
(define (ident x) x)
(define (s-ps str size) (text str 'modern size))
(define (pc str) (s-ps str (current-font-size)))

; Spike
(slide (lift-above-baseline (colorize (t "Test") "red") 250))

(define (your-first-prolog-code show-facts show-rules show-queries)
  (slide #:title "Your first Prolog code."
         (let* ([facts (v (pc "rainy(beijing).")
                          (pc "rainy(shanghai).")
                          (pc "cold(beijing).")
                          (pc "cold(tianjin)."))]
                [rules (pc "freeze(Area) :- rainy(Area), cold(Area).")]
                [queries (pc "?- freeze(Where). ")])
          (cc-superimpose 
              (show-facts   (v facts (ghost rules) (ghost queries)))
              (show-rules   (v (ghost facts) rules (ghost queries)))
              (show-queries (v (ghost facts) (ghost rules) queries))))))

(your-first-prolog-code ghost ghost ghost)
(your-first-prolog-code ident ghost ghost)
(your-first-prolog-code ident ident ghost)
(your-first-prolog-code ident ident ident)

;
; Slide intruduction.
;
(slide (vc-append (* gap-size 3)
                  (s-t "Prolog metaprogramming and DSL" 64)
                  (t "ThoughtWorks, Han Kai")))

;
; It's about an old language.
;
(slide (t "It's about an \"OLD\" language."))

;
; A short, simple history.
;
(slide (t "TODO: A short, simple history."))

;
; Your first Prolog code.
;
(slide
 #:title "Example"
 (item (v (* gap-size 0.5)
          (t "rainy(beijing).")
          (t "rainy(shanghai).")
          (t "cold(beijing).")
          (t "cold(tianjin).")))
 'next
 (item (t "freeze(Area) :- rainy(Area), cold(Area)."))
 'next
 (item (t ":- freeze(Where).")))




