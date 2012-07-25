#lang slideshow

(require slideshow/balloon)

(define v vl-append)
(define h hc-append)
(define (s-t content size) (text content (current-main-font) size))
(define (code str size) (text str 'modern size))
(define (single-title content) (s-t content 48) )
(define (highlight str) (colorize (text str '(bold . modern) (current-font-size)) "red"))


(slide (vc-append (* gap-size 3)
                  (s-t "Prolog Introduction" 64)
                  (t "ThoughtWorks, Han Kai")))
(slide (h (colorize (text "PRO" (current-main-font) 48) "blue")
          (single-title "gramming in ")
          (colorize (text "LOG" (current-main-font) 48) "blue")
          (single-title "ic")
          ))

(slide (v (* gap-size 1)
          (s-t "Imperative" 40)
          (s-t "        Procedure Oriented" 35)
          (s-t "        Object Oriented" 35)
          (s-t "Declarative" 40)
          (s-t "        Functionnal" 35)
          (s-t "        Logic" 35)))

(slide (v (* gap-size 1)
          (s-t "Imperative" 40)
          (s-t "        Procedure Oriented" 35)
          (s-t "        Object Oriented" 35)
          (s-t "Declarative" 40)
          (s-t "        Functionnal" 35)
          (h (s-t "        Logic" 35) (colorize (s-t "   <-- Prolog" 35) "blue"))))













