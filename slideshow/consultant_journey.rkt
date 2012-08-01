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
; WIP slide
;
(slide #:name "population"
       #:title "Population"
       (h (bitmap "consultant_journey/australia2.jpg")
          (t " =    ")
          (s-t "Beijing" 48)))
;
; End of WIP slide
;

(slide #:name "slide intrduction"
       (vc-append (* gap-size 3)
                  (s-t "雪梨城的六个月" 48)
                  (t "ThoughtWorks, Han Kai")))

(slide #:name "self-intrduction"
       (t "name.equals('Han Kai')")
       (t "years_in_ThoughtWorks.equals(5)"))

(slide #:name "map of sydney" 
       (bitmap "consultant_journey/australia.gif"))

(slide #:name "client intrduction"  
       (bitmap "consultant_journey/suncorp.jpg"))

(slide #:name "The first impression of Sydney"
       (v (h (bitmap "consultant_journey/sydney-opera.jpg")
             (bitmap "consultant_journey/sydney-bridge.jpg"))
          (bitmap "consultant_journey/sydney-beach.jpg")))

(slide #:name "insurance sales men"
       (bitmap "consultant_journey/sydney-opera-insurancing-sales.jpg"))



















