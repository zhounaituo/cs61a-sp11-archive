; 1. Try these in Scheme:
(define x (cons 4 5))
(car x)
(cdr x)
(define y (cons 'hello 'goodbye))
(define z (cons x y))
(car (cdr z))
(cdr (cdr z))

; 2. Predict the result of each of these before you try it:
(cdr (cdr z)) ; 'goodbye
(car (cons 8 3)) ; 8
(car z) ; (4 . 5)
; (car 3) ; Error

; 3. Enter these definitions into Scheme:
(define (make-rational num den)
    (cons num den))
(define (numerator rat)
    (car rat))
(define (denominator rat)
    (cdr rat))
(define (*rat a b)
    (make-rational (* (numerator a) (numerator b))
                   (* (denominator a) (denominator b))))
(define (print-rat rat)
    (word (numerator rat) '/ (denominator rat)))

; Try this:
(print-rat (make-rational 2 3))
(print-rat (*rat (make-rational 2 3) (make-rational 1 4)))

; Define a procedure +rat to add two rational numbers, in the 
; same style as *rat above.

(define (+rat a b)
    (make-rational (+ (* (numerator a) (denominator b))
                      (* (numerator b) (denominator a)))
                   (* (denominator a) (denominator b))))

(print-rat (+rat (make-rational 2 3) (make-rational 1 4)))

; 7. This week you’ll learn that sentences are a special case of 
; lists, which are built out of pairs. Explore how that’s done ; 
; with experiments such as these:
; (define x ’(a (b c) d))
; (car x)
; (cdr x)
; (car (cdr x))

; 8. SICP ex. 2.18; this should take some thought, and you 
; should make sure you get it right, but don’t get stuck on it 
; for the whole hour. Note: Your solution should reverse lists, 
; not sentences! That is, you should be using cons, car, and 
; cdr, not first, sentence, etc.