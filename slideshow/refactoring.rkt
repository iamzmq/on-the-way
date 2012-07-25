#lang slideshow

(define v vl-append)
(define h hc-append)
(define (s-t content size) (text content (current-main-font) size))
(define (java str size) (text str 'modern size))
(define (single-title content) (s-t content 48) )
(define (highlight str) (colorize (text str '(bold . modern) (current-font-size)) "red"))

;
;
;

;
;
;

(slide (vc-append (* gap-size 3)
                  (s-t "Refactoring" 64)
                  (t "ThoughtWorks, Han Kai")))

(slide (single-title "What's refactoring?"))

(slide (v (* gap-size 2)
          (t "Refactoring (noun):")
          (v (t "       a change made to the internal structure of software")
             (t "       to make it easier to understand and cheaper to modify")
             (t "       without changing its observable behavior."))))

(slide (v (* gap-size 2)
          (t "Refactoring (verb): ")
          (v (t "       to restructure software by applying a series of ")
             (t "       refactorings without changing its observable behavior."))))

(slide (single-title "Why refactoring?"))

(slide (h (t "Make code ") (highlight "easier") (t " to understand and ") (highlight "cheaper") (t " to modify.")))

(slide (single-title "Without..."))

(slide (h (t "changing its ") (highlight "obserable behavior")))

(slide (single-title "When refactoring?"))

(slide (h (t "It becoms ") (highlight "smell") (t ".")))

(slide (vc-append (* gap-size 3)
                  (h (t "\"Duplicated code\"")
                     (t "     ")
                     (t "\"Long method\"") 
                     (t "     ")
                     (t "\"Large class\""))
                  (h (t "\"Too many parameter\"") 
                     (t "     ")                     
                     (single-title "Smell") 
                     (t "     ")                     
                     (t "\"Too many private\""))
                  (h (t "Different names same meaning") 
                     (t "     ")                     
                     (t "Temporary field"))))






























