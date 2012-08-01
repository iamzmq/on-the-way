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

(define (change-font-size-for-slide font-size slide) 
    (current-font-size 10)
    slide
    (current-font-size 32))

;
; WIP slide
;

;
; End of WIP slide
;

;
; Part I - First impression of Sydney
;
(slide #:name "slide intrduction"
       (vc-append (* gap-size 3)
                  (s-t "雪梨城的六个月" 48)
                  (t "ThoughtWorks, Han Kai")))

(slide #:name "self-intrduction"
       (t "name.equals('Han Kai')")
       (t "years_in_ThoughtWorks.equals(5)"))

(slide #:name "map of sydney" 
       (bitmap "imgs/australia.gif"))

(slide #:name "client intrduction"  
       (bitmap "imgs/suncorp.jpg"))

(slide #:name "The first impression of Sydney"
       (v (h (bitmap "imgs/sydney-opera.jpg")
             (bitmap "imgs/sydney-bridge.jpg"))
          (bitmap "imgs/sydney-beach.jpg")))

(slide #:name "insurance sales men"
       (bitmap "imgs/sydney-opera-insurancing-sales.jpg"))

(slide #:name "food"
       #:title "Wonderful food"
       (bitmap "imgs/see-food.jpg"))

(slide #:name "blue mountain"
       #:title "Blue Monutain"
       (t "TODO Img needed here."))

(slide #:name "population"
       #:title "Population"
       (h (bitmap "imgs/australia2.jpg")
          (t " =    ")
          (s-t "Beijing" 48)))


;
; Days as QA
;
(slide #:name "Join project"
       (h 
        (t "Join")  
        (text " LSP Home " '(bold . modern) 30) 
        (t "from 22nd Jan, 2012")))

(slide #:name "initiated meeting"
       #:title "Initiated Meeting"
       (t "... is the inception in term of ThoughtWorks.")
       'next
       (t "胜利的大会")
       (t "团结的大会")
       (t "气氛友好的大会"))

(slide #:name "Long Jun is coming"
       (t "Long Jun joined at the last day of initiated meeting.")
       (t "TODO a photo is needed here."))

(slide #:name "The days as a QA"
       (t ""))

;
; Days in Continous Delivery
;
(slide #:name "starting continous delivery"
       (t "As a QA, I want to deploy package to test env smoothly, so that ")
       (t "I can verify new feature ASAP."))

(slide #:name "enviroments"
       (t ""))

(slide #:name "phase 1"
       #:title "Phase 1 - Low level regions"
       (t "Met migration team")
       (t "Tableaux integration")
       (t "Jenkins vs. GO")
       (t "No script -> Powershell -> JRuby -> Groovy"))

(slide #:name "note 1"
       (t "Why Groovy?"))

(slide #:name "phase 2"
       (t "Phase 2 - High level regions"))

(slide #:name "step 1 - script or tableaux"
       'alts
       (list (list (t "Tableaux or Groovy Script?"))
             (list (h (text "Tableaux or " (current-main-font) 24 (/ 3.1415 2.5)) (t "   ") (s-t "Groovy Script" 48)))))

(slide #:name "step 2 - meeting with manager of migration team"
       #:title "Meeting with Sean"
       'next
       (t "HAPPY")
       (t "Treating dinner")
       'next
       (t "213$"))

(slide #:name "work together with migration team"
       #:title "Work together with migration team"
       (t "Knowledge transform")
       (t "Implement blue-green deployment")
       (t "Talked about sensitive topic at the last 20 mins"))

(slide #:name "friendly meeting"
       (t "Again, I saw a friendly meeting."))

(define (letter line)
  (para #:width (* 1.2 (current-para-width)) line))

(current-font-size 15)
(slide #:name "a bad letter from migration team"
       #:title "A Letter from migration team"
       (vl-append 15
                  (letter "Hi Guys,")
                  (letter "This is still a difficult approach to adopt.")
                  (letter "To be honest we are asking Jenkins to try and do what Tableaux does (see below) and I still don’t understand why.")
                  (letter "We would need to be able to identify who migrates specific artefacts by u number, not just the team they are part of. There also needs to be a method to marry up ITSM data with this action (like the CR number for changes).")
                  (letter "We can spend a lot of time trying to get Jenkins to become PPG234 compliant (or BT change management compliant) – but I think it would be very difficult and not in our best interests.")
                  (letter "All we really need to do is wait for our API changes to be implemented (which allow for us to do what we need). This keeps the mechanism exactly what you are after and gives us even more options down the track for very very easy enhancement. It also gives the approval workflow we need for audit and allows that entire process to be invisible and out of the way.")
                  (letter "You’d just be emailing a CR number and the fact that a deployment has been clicked for a particular time. We’d just approve it and it would go at whatever time you entered. What we should be looking at is how you want to get that info to the API. You could capture it when they click that button, use a config file, hard code it in the script etc etc.")
                  (letter "It looks like we are dependent on this API change no matter which way we go. I’m expecting this to be done within a month or less.")
                  (vl-append 5
                             (letter "There’s also the other side of this:-")
                             (letter "  -- Our team is currently implementing (and building continuously) the service and skills for Tableaux.")
                             (letter "  -- There’s also a chance we are doing this for another deployment application (which I might add has the same requirements and the same problems at the moment).")
                             (letter "  -- Asking us to also take on another application/gate/process/service/technology is not going to work for us.")
                             )
                  (letter "I thought there might be an easy solution for the meantime (until our API change) but it appears that is not the case.")
                  (letter "My recommendation is to plan for this feature implementation into Tableaux, and use the API enhancement to solve this problem.")
                  (letter "We need to start absorbing your script and actions into Tableaux and making this an enterprise grade process.")))
(current-font-size 32)


