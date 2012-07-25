#lang slideshow

(require slideshow/balloon)

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

(define (goto-lt-then-show-topic title timeout size x-offset y-offset being-smaller final-display hooker)  
  (slide #:timeout timeout 
         #:title title
         #:layout 'top
     (pin-over hooker x-offset y-offset 
         (being-smaller size))
      ((if (and (equal? y-offset 0) 
                (equal? x-offset 0) 
                (equal? timeout #f)) 
                     ident ghost) final-display)))

;
; Slide Intruduction
;
(slide (vc-append (* gap-size 3)
                  (s-t "PowerShell" 64)
                  (t "ThoughtWorks, Han Kai")))

;
; Slide for shelles
;
(define shell_examples
   (vc-append (* gap-size 2)
           (text "bash" (current-main-font) (current-font-size) (- (/ 3.1415926 6)))
           (t "csh")
           (t "ksh")
           (text "cmd" (current-main-font) (current-font-size) (/ 3.1415926 6))))

(define highlight-power
  (text "Power" `(bold . ,(current-main-font)) 48))

(slide (hc-append 
         (ghost shell_examples)
         (ht-append (ghost highlight-power) (s-t "Shell" 48))))

(slide (hc-append 
         shell_examples
         (ht-append (ghost highlight-power) (s-t "Shell" 48))))

(slide (hc-append 
         (ghost shell_examples)
         (ht-append highlight-power (s-t "Shell" 48))))

;
; Slide for what PowerShell can do
;
(slide #:title "What can PowerShell do?"
   (table 2 
          (list (t "first thing") (t "2") (t "second thing") (t "3"))
          (list* lc-superimpose cc-superimpose)
          cc-superimpose
          gap-size
          gap-size))

;
; Slide for simplest PowerShell
;
(define font-size-in-powershell-101 25)
(slide #:title "PowerShell 101"
   (item #:bullet (blank) (s-t "> dir" font-size-in-powershell-101))
   'next
   (item #:bullet (blank) (s-t "> ls" font-size-in-powershell-101))
   'next
   (item #:bullet (blank) (h (s-t "> " font-size-in-powershell-101) 
                             (text "Get-ChildItem" '(bold . modern) font-size-in-powershell-101)))
   'next
   (item #:bullet (blank) (h (s-t "> " font-size-in-powershell-101) 
                             (text "Stop-Serivce " '(bold . modern) font-size-in-powershell-101)
                             (s-t "IntegrationWorkerDaemon" font-size-in-powershell-101)))
   'next
   (item #:bullet (blank) (h (s-t "> " font-size-in-powershell-101) 
                             (text "New-WebApplication " '(bold . modern) font-size-in-powershell-101)
                             (s-t "-name \"Default Web Site\"" font-size-in-powershell-101)))
   
   'next
   (blank)
   (colorize (h (text "All" '(bold . modern) (current-font-size)) (t " commands are in ") (text "\"COMMAND + ARGS\"" '(italic bold . modern) (current-font-size)) (t " style.")) "blue")
)     

;
; Slide for extensions of PowerShell
;
(slide (s-t "Need more functionalites?" 50))

(slide (s-t "Write your own Functions" 50))

; 
; Slide for PowerShell Function
;
(define func-keyword (keyword "Function "))
(define func-name (ps "Hello"))
(define arg-list (ps "($name) "))
(define func-body (ps "    Write-Host Hello $name"))

(define source-snap 
   (inset (vl-append (* gap-size 1.5) (para func-keyword func-name arg-list (t " {"))
                  (para func-body)
                  (para (t "}"))) 200 0 0 0))

(define (highlight-function-example show-func-keyword show-func-name show-arg-list show-func-body)
  (slide #:title "PowerShell Function"
   (let* ([sence source-snap]
          [w/func-keyword (pin-balloon (wrap-balloon (t "Keyword") 'e 30 0)
                                  (ghost source-snap)
                                  func-keyword
                                  lc-find)]
          [w/func-name (pin-balloon (wrap-balloon (t "Function Name") 's 10 10)
                               (ghost w/func-keyword)
                               func-name
                               ct-find)]
          [w/arg-list (pin-balloon (wrap-balloon (t "Arg List") 'sw -30 10)
                               (ghost w/func-name)
                               arg-list
                               ct-find)]
          [w/func-body (pin-balloon (wrap-balloon (t "Function Body") 'n 10 -10)
                               (ghost w/arg-list)
                               func-body
                               cb-find)])
   
   (cc-superimpose sence 
                   (show-func-keyword w/func-keyword)
                   (show-func-name w/func-name)
                   (show-arg-list w/arg-list)
                   (show-func-body w/func-body)))))
  
(highlight-function-example ghost ghost ghost ghost)
(highlight-function-example ident ghost ghost ghost)
(highlight-function-example ident ident ghost ghost)
(highlight-function-example ident ident ident ident)

;
; Slide for PowerShell invocation
;
(define (function-invocations show-group-1 show-group-2 show-group-3) 
  (slide #:title "Function Invocation"
    (v (* gap-size 1.5)
       (show-group-1 (ps "> Hello (\"World\")"))
       (show-group-1 (ps "> Hello \"World\""))
       (show-group-2 (ps "> Hello World"))
       (show-group-3 (ps "> Hello -name World"))
       (show-group-3 (ps "> Hello -name \"World\"")))
    (blank)
    ((if (and (equal? show-group-1 ident) 
              (equal? show-group-2 ident) 
              (equal? show-group-3 ident)) ident ghost)
         (colorize (h (text "All" '(bold . modern) (current-font-size)) 
                      (t " commands are in ") 
                      (text "\"COMMAND + ARGS\"" '(italic bold . modern) (current-font-size)) (t " style.")) 
                   "blue"))))

(function-invocations ident ghost ghost)
(function-invocations ident ident ghost)
(function-invocations ident ident ident)

;
; Slide for script block supporting
;


(define smallest-code-block (ghost (blank client-w (/ client-h 5))))

(define (func-if-fielexist size)
  (v (* gap-size (/ size (current-font-size))) 
            (h (s-ps "Function If-FileExist($filePath, " size) (s-highlight "$action" size) (s-ps ") {" size))
            (s-ps "    if (Test-Path $filePath) {" size)
            (h (s-ps "        " size) (s-highlight "& $action($filePath)" size))
            (s-ps "    }" size)
            (s-ps "}" size)
          ))

(define script-block-invocation 
  (v gap-size
    (ps "$output=\"bin\\Debug\"")
    (h (ps "If-FileExist -filePath $output -action") (highlight " {"))
    (highlight "    Copy-Item $output\\*.dll --destination \\bin")
    (highlight "}")))


(let* ([init-x-offset 80]
       [init-y-offset 200]
       [steps 18]
       [title "Scrpit Block (aka. Closure)"])
  (goto-lt-then-show-topic title #f (current-font-size) init-x-offset init-y-offset func-if-fielexist script-block-invocation smallest-code-block)
  (for ([i (in-range steps)])
    (goto-lt-then-show-topic 
                        title
                        0.05 
                        (- (current-font-size) i ) 
                        (- init-x-offset (* i (/ init-x-offset steps)))
                        (- init-y-offset (* i (/ init-y-offset steps)))
                        func-if-fielexist
                        script-block-invocation
                        smallest-code-block))
  (goto-lt-then-show-topic 
                        title
                        #f 
                        (- (current-font-size) steps) 
                        0
                        0
                        func-if-fielexist
                        script-block-invocation
                        smallest-code-block)) 

;
; Slides for implements "Task"
;
(slide #:title "Define a Task"
   (v (* gap-size 2)
       (frame 
        (inset
        (v
        (ps "<Target Name=\"Compile\" -depends Clean>")
        (ps "    <Exec Cmd=\"$Yam build mytaxes\">")
        (ps "</Target>")
        ) 20)) 
      (frame  
       (inset (v 
        (ps "task :compile do ")
        (ps "    sh \"gcc *.c -o proj.o\"")
        (ps "end")
        ) 20))))

(slide (t "How to implement Task in PowerShell? "))

(slide (t "It's a Function"))

(define (task-invocation show-func-name show-first-arg show-second-arg show-third-arg)
  (slide #:title "Task Invocation"
      (let* ([task-invocation-font-size 28]
             [func-name (s-ps "Task " task-invocation-font-size)]
             [first-arg (h (s-ps "-name " task-invocation-font-size) (s-highlight "Package" task-invocation-font-size))]
             [second-arg (h (s-ps " -depends " task-invocation-font-size) (s-highlight "UnitTest, FunctionTest " task-invocation-font-size))]
             [third-arg (s-ps "    # Package ..." task-invocation-font-size)]
             [sence (v (* gap-size 1.2)
                       (h func-name first-arg second-arg (ps " {"))
                       third-arg
                       (ps "}"))]
             [w/func-name (pin-balloon (wrap-balloon (text "Function Name" (current-main-font) 18) 's 10 30)
                                    (ghost sence)
                                    func-name
                                    ct-find)]
             [w/first-arg (pin-balloon (wrap-balloon (text "First Arg" (current-main-font) 18) 's 30 30)
                                    (ghost w/func-name)
                                    first-arg
                                    ct-find)]
             [w/second-arg (pin-balloon (wrap-balloon (text "Second Arg" (current-main-font) 18) 's 30 30)
                                    (ghost w/first-arg)
                                    second-arg
                                    ct-find)]
             [w/third-arg (pin-balloon (wrap-balloon (text "Third Arg" (current-main-font) 18) 'nw -30 -30)
                                    (ghost w/second-arg)
                                    third-arg
                                    cb-find)]
             
             ) 
        (cc-superimpose sence
                        (show-func-name w/func-name)
                        (show-first-arg w/first-arg)
                        (show-second-arg w/second-arg)
                        (show-third-arg w/third-arg)
         ))))

(task-invocation ghost ghost ghost ghost)
(task-invocation ident ghost ghost ghost)
(task-invocation ghost ident ident ident)

(slide (para "There is a function named \"Task\", takes three argements, a \"name\", ")
       (para "a \"depend\" list, and a script block, which is task action."))


(slide #:title "What's different between If-FileExist"
       (item "Some args are optional")
       (subitem "depends")       
       (subitem "script block")
       (item "Sequence is not fixed"))

(slide (t "More sophisticated parameter mechanism"))

(slide #:title "More sophisticated parameter mechanism"
  (v
   (ps "Function Task {")
   (highlight "  param(")
   (highlight "    $name=$null,")
   (highlight "    $action=$null,")
   (highlight "    $depends=@()")
   (highlight "  )")
   (ps "  # Invoke task ...")
   (ps "}")))

(slide #:title "More sophisticated parameter mechanism"
  (let ([font-size 27])
  (v
   (s-ps "Function Task {" font-size)
   (s-ps "  param(" font-size)
   (h (s-highlight "    [Parameter(Mandatory=1)]" font-size) (s-ps " $name=$null," font-size))
   (h (s-highlight "    [Parameter(Mandatory=0)]" font-size)(s-ps " $action=$null," font-size))
   (h (s-highlight "    [Parameter(Mandatory=0)]" font-size) (s-ps " $depends=@()" font-size))
   (s-ps "  )" font-size)
   (s-ps "  # Invoke task ..." font-size)
   (s-ps "}" font-size))))

(slide #:title "More sophisticated parameter mechanism"
  (let ([font-size 27])
  (v
   (s-ps "Function Task {" font-size)
   (s-ps "  param(" font-size)
   (h (s-ps "    [Parameter(Mandatory=1)]" font-size) (s-highlight "[string]" font-size) (s-ps " $name=$null," font-size))
   (h (s-ps "    [Parameter(Mandatory=0)]" font-size) (s-highlight "[scriptblock]" font-size) (s-ps " $action=$null," font-size))
   (h (s-ps "    [Parameter(Mandatory=0)]" font-size) (s-highlight "[string[]]" font-size) (s-ps " $depends=@()" font-size))
   (s-ps "  )" font-size)
   (s-ps "  # Invoke task ..." font-size)
   (s-ps "}" font-size))))

(slide (s-t "PowerShell, a programming language" 50))

;
; Slides for language features
;
(define hooker-for-language-features (ghost (blank client-w (/ client-h 10))))

(define (show-powershell-language-feature feature feature-example) 
  (let* ([init-x-offset 350]
       [init-y-offset 300]
       [steps 10]
       [title-font-size 50])
  (goto-lt-then-show-topic #f #f title-font-size init-x-offset init-y-offset feature feature-example hooker-for-language-features)
  (for ([i (in-range steps)])
    (goto-lt-then-show-topic #f 0.05 
                        (- title-font-size i ) 
                        (- init-x-offset (* i (/ init-x-offset steps)))
                        (- init-y-offset (* i (/ init-y-offset steps)))
                        feature
                        feature-example
                        hooker-for-language-features))
  (goto-lt-then-show-topic #f #f
                        (- title-font-size steps) 
                        0
                        0
                        feature
                        feature-example
                        hooker-for-language-features)))


(slide (s-t "Simple Expression" 50))

(define (dynamical-type size) (s-t "Dynamical Typed" size))

(define dynamical-type-example 
  (v (* gap-size 1.4)
    (h (ps "> ") (highlight "$tmp ") (ps "= 1"))
    (h (ps "> ") (keyword "Write-Host ") (highlight "$tmp"))
    (h (ps "> ") (highlight "$tmp") (ps " = \"A string\""))
    (h (ps "> ") (keyword "Write-Host ") (highlight "$tmp"))))

(show-powershell-language-feature dynamical-type dynamical-type-example)

(define (dynamical-scoped size) (s-t "Dynamical Scoped" size))

(define dynamical-scoped-example
  (v (* gap-size 0.5)
   (h (highlight "$name") (ps " = \"Outer\""))
   (blank)
   (h (ps "Function ") (keyword "Print-Name {"))
   (h (ps "  Write-Host ") (highlight "$name"))
   (ps "}")
   (blank)
   (h (ps "Function ") (keyword "Inner-Print-Name {"))
   (h (highlight "  $name ") (ps " = \"Inner\""))
   (h (keyword "  Print-Name"))
   (ps "}")
   (blank)
   (hline client-w 1)
   (h (keyword "Print-Name         ") (ps "# Result: Outer"))
   (h (keyword "Inner-Print-Name   ") (ps "# Result: Inner"))
   )
  )

(show-powershell-language-feature dynamical-scoped dynamical-scoped-example)

(slide (s-t "Interoperate with Others" 50))

(slide (s-t "High-level Data Struct" 50))

(slide (s-t "Thanks" 50))
