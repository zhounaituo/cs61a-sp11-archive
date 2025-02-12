Exercise 2.30: Define a procedure square-tree analogous to 
the square-list procedure of Exercise 2.21.That is, squaretree 
should behave as follows:

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
(1 (4 (9 16) 25) (36 49))


Define square-tree both directly (i.e., without using any
higher-order procedures) and also by using map and recursion.

; version 1: without using any higher-order procedures.
(define (square-tree ls)
  (cond ((null? ls) nil)
        ((not (pair? (car ls))) 
            (cons (* (car ls) (car ls)) (square-tree (cdr ls))))
        (else (cons (square-tree (car ls))
                    (square-tree (cdr ls))))))

; version 2: with map
(define (square-tree tr)
  (map (lambda (str)
        (if (pair? str)
            (square-tree str)
            (* str str))) 
       tr))