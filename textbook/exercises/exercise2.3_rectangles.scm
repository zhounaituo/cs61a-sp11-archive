; Exercise 2.3. Implement a representation for rectangles in a 
; plane. (Hint: You may want to make use of exercise 2.2.) In 
; terms of your constructors and selectors, create procedures 
; that compute the perimeter and the area of a given rectangle. 
; Now implement a different representation for rectangles. Can 
; you design your system with suitable abstraction barriers, so 
; that the same perimeter and area procedures will work using 
; either representation?

(define (make-point x y)
    (cons x y))

(define (x-point p) (car p))
(define (y-point P) (cdr p))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define (avg a b)
    (/ (+ a b) 2))
(define (square a) (* a a))

(define (make-rectangles a b c d)
    (cons (cons a b)
          (cons c d)))

(define (a-point r) (car (car r)))
(define (b-point r) (cdr (car r)))
(define (c-point r) (car (cdr r)))
(define (d-point r) (cdr (cdr r)))

(define (distance a b)
    (sqrt (+ (square (- (x-point a) (x-point b)))
             (square (- (y-point a) (y-point b))) )))

(define (get-height r)
    (distance (a-point r) (b-point r)))

(define (get-width r)
    (distance (a-point r) (c-point r)))

; (perimeter (make-rectangles (make-point 0 0) (make-point 2 0) (make-point 2 2) (make-point 0 2)))
(define (perimeter r)
    (* (+ (get-height r) (get-width r)) 2))

; (area (make-rectangles (make-point 0 0) (make-point 2 0) (make-point 2 2) (make-point 0 2)))
(define (area r)
    (* (get-height r) (get-width)))