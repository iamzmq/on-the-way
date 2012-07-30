#lang slideshow

; public functions
(define (s-t content size) (text content (current-main-font) size))
(define (ident x) x)

(define v vl-append)
(define h hc-append)

(define (ps str) (s-ps str (current-font-size)))
(define (highlight str) (s-highlight str (current-font-size)))
(define (keyword str) (s-keyword str (current-font-size)))

(define (s-ps str size) (text str 'modern size))
(define (s-highlight str size) (colorize (text str '(bold . modern) size) "red"))
(define (s-keyword str size) (colorize (text str '(bold . modern) size) "blue"))

;
; Slide Intruduction
;
(slide (vc-append (* gap-size 3)
                  (s-t "Consultant Journey in #C#" 48)
                  (t "ThoughtWorks, Han Kai")))

;
; Map of Sydney
;
(slide (bitmap "consultant_journey/australia.gif"))

;
; Intruduction of client
;
(slide (bitmap "consultant_journey/suncorp.jpg"))

;
; Intruduction of myself
; TODO photo of my business card


;
; 
;
















