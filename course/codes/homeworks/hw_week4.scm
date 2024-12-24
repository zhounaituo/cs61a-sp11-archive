; Write a procedure **substitute** that takes three arguments: a 
; list, an old word, and a new word. It should return a copy of 
; the list, but with every occurrence of the old word replaced 
; by the new word, even in sublists. For example:

; > (substitute 
;       '((lead guitar) (bass guitar) (rhythm guitar) drums)
;       'guitar 'axe)

; ((lead axe) (bass axe) (rhythm axe) drums)

;;;;;
; substitute 1st version
(define (substitute ls old new)
    (rec (lambda (x) (if (equal? x old) new x)) ls))


(define (rec fx ls)
    (cond ((null? ls) nil)
          ((list? ls) (cons (rec fx (car ls)) (rec fx (cdr ls))))
          (else (fx ls))))

; Now write substitute2 that takes a list, a list of old words, 
; and a list of new words; the last two lists should be the same 
; length. It should return a copy of the first argument, but 
; with each word that occurs in the second argument replaced by 
; the corresponding word of the third argument:

; > (substitute2 
;       '((4 calling birds) (3 french hens) (2 turtle doves))
;       '(1 2 3 4) '(one two three four))

; ((four calling birds) (three french hens) (two turtle doves))

;;;;;
(define (substitute2 ls old new)
    (rec (lambda (x) (if (member? x old)
                         (find (index x old) new)
                         x)) ls))

; return the index of member
(define (index m ls)
    (if (equal? m (car ls))
        0
        (+ 1 (index m (cdr ls)))))

; find member by index
(define (find i ls)
    (cond ((null? ls) nil)
          ((= i 0) (car ls))
          (else (find (- i 1) (cdr ls)))))

; Write the procedure cxr-function that takes as its argument a 
; word starting with c, ending with r, and having a string of ;
; letters a and/or d in between, such as cdddadaadar. It should 
; return the corresponding function.

(define (cxr s) 
    (rec def s))

; Similar to accumulation, looping and applying fx to strings  
(define (rec fx s)
    (cond ((empty? s) "")
          (else (fx (first s) (rec fx (bf s))))))

; Function zero, which accepts a variable and returns it.
; (zf 'a) -> 'a 
(define zf (lambda (x) x))

; fx
(define def 
    (lambda (s fx) 
        (cond ((not (procedure? fx)) (def s zf))
              ((not (member? s '(a d))) (glue zf fx))
              ((equal? 'a s) (glue car fx))
              ((equal? 'd s) (glue cdr fx)))))

; (glue car cdr) -> (lambda (x) (cdr (car x)))
(define (glue fx gx)
    (define init (lambda (f) (lambda (x) (f x)))) ;wrapper function
    (define (helper hx) 
        (lambda (f) (lambda (x) (f (hx x)))))
    ((helper (init fx)) gx))

; This program mainly consists of three parts:
; 
; 1. Accept a variable and return it exactly as it is:
;     (define zero-function (lambda (x) x))
; 
; 2. Wrap a function into a lambda function for subsequent ;
； function composition:
;     (define wrapper (lambda (f) (lambda (x) (f x))))
;
; 3. Combine and nest two methods together:
; (define (glue fx) (lambda (f) (lambda (x) (f (fx x))))) 
;
; Example:
; (define a (wrapper car)) -> (lambda (x) (car x))
; (define b ((glue a) cdr)) -> (lambda (x) (cdr (car x)))
; (define c ((glue b) car)) -> (lambda (x) (car (cdr (car x))))