;Exercise 2.28: Write a procedure fringe that takes as argument a 
;tree (represented as a list) and returns a list whose elements are 
;all the leaves of the tree arranged in le-toright order. For example,
;(define x (list (list 1 2) (list 3 4)))
;(fringe x)
;(1 2 3 4)
;(fringe (list x x))
;(1 2 3 4 1 2 3 4)

(define (pd ls1 i)
  (if (null? ls1)
      (list i)
      (cons (car ls1) (pd (cdr ls1) i))))

(define (fringe ls)
  (define (hp lst tl)
    (cond ((null? lst) tl)
          ((not (pair? (car lst))) 
            (hp (cdr lst) (cons (car lst) tl)))
          (else (hp (cdr lst) (hp (car lst) tl)))))
  (hp ls nil))