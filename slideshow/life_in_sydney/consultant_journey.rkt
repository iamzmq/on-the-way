#lang slideshow

(require graphics/graphics)
(require slideshow/balloon)

; public functions
(define (s-t content size) (text content (current-main-font) size))
(define v vl-append)
(define h hc-append)

(define (change-font-size-for-slide font-size show-slide) 
    (let* ([orig-font-size (current-font-size)])
      (current-font-size font-size)
      (show-slide)
      (current-font-size orig-font-size)))

(define (variable v) (colorize (text v '(bold . modern) (current-font-size)) "brown"))
(define (method m) (text m 'modern (current-font-size)))
(define (string s) (colorize (text s '(bold . modern) (current-font-size)) "blue"))
(define (number n) (colorize (text n '(bold . modern) (current-font-size)) "blue"))

(define australia_map (bitmap "imgs/australia.gif"))


;
; WIP slide
;

; End of WIP slide
;
;
; Part I - First impression of Sydney
;
(slide #:name "slide intrduction"
       (vc-append (* gap-size 3)
                  (s-t "Day in Sydney" 48)
                  (t "ThoughtWorks, Han Kai")))

(slide #:name "self-intrduction"
       (h (variable "name") 
          (t ".") 
          (method "equals") 
          (string " 'Han Kai'"))
       (h (variable "years_in_ThoughtWorks") 
          (t ".") 
          (method "equals") 
          (number " 5")))

(define positioin-of-sydney (blank))

(slide #:name "map of sydney" 
       (pin-over australia_map 540 210 positioin-of-sydney))

(slide #:name "map of sydney" 
       (pin-balloon (wrap-balloon (text "I'm here" (current-main-font) 18) 's 10 30)
                    (pin-over australia_map 540 210 positioin-of-sydney)
                    positioin-of-sydney
                    rt-find))

(slide #:name "client intrduction"  
       (bitmap "imgs/suncorp.jpg"))

(slide #:name "The first impression of Sydney"
       (v (h (bitmap "imgs/sydney-opera.jpg")
             (bitmap "imgs/sydney-bridge.jpg"))
          (bitmap "imgs/sydney-beach.jpg")))

(slide #:name "insurance salesman"
       #:title "Insurance salesman"
       (bitmap "imgs/sydney-opera-insurancing-sales.jpg"))

(slide #:name "food"
       #:title "Food is nice!"
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
        (t "From")  
        (text " LSP Home " '(bold . modern) 30) 
        (t "at 22nd Jan, 2012")))

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
       (t "TODO days of a QA"))

;
; Days in Continous Delivery
;
(slide #:name "starting continuous delivery"
       #:title "Starting Continuous Delivery"
       (t "As a QA, I want to deploy package to test env smoothly, so that ")
       (t "I can verify new feature ASAP."))

(slide #:name "enviroments"
       (h (bitmap "imgs/env.gif")
          (v (para "DEV SYS and UAT are lower level regions")
             (para "DRYRUN and PROD are more complex"))))


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

(define slide-of-migration-team-letter (lambda () 
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
                  (letter "We need to start absorbing your script and actions into Tableaux and making this an enterprise grade process.")))))

(change-font-size-for-slide 12 slide-of-migration-team-letter)

(slide #:name "lost faith"
       (h (t "I think I lost ") (tt "FAITH") (t ".")))

(slide #:name "the darkest days"
       (t "The darkest days"))

(slide #:name "Collaboration with infra team"
       (item "Co-locate when possible")
       (item "Bridge gaps between Online and Infra teams")
       (item "Work closely with infra teams to solve problems")
       (item "Treat other teams with respect")
       (item "Learn from them and show them what automation can do"))

(slide #:name "Collaboration with migration team"
       (item "Engage early and often")
       (item "Include them in the journey")
       (item "Listen to their concerns and be ready to negotiate")
       (item "Show the power of automation and impress them")
       (item "Gain their trust"))

(slide #:name "prod deployment"
       #:title "Prod deployment"
       (item "No big deal!")
       (item "Click a button from Jenkins")
       (item "During business hours (blue-green strategy)"))

