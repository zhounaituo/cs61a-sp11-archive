; Exercise 2.18. Define a procedure reverse that takes a list 
; as argument and returns a list of the same elements in 
; reverse order:

(define a (list 1 4 9 16 25))

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(define (reverse ls)
    (if (null? ls)
        nil
        (append (reverse (cdr ls)) (list (car ls)))))

;;;;; 

; version 2nd

(define (reverse ls)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons (car things) answer))))
    (iter ls nil))