; Exercise 2.31: Abstract your answer to Exercise 2.30 to 
; produce a procedure tree-map with the property that squaretree 
; could be defined as
; 
; (define (square-tree tree) (tree-map square tree))

(define (tree-map fx tree)
  (map (lambda (sub)
        (if (pair? sub)
            (tree-map fx sub)
            (fx sub))) tree))