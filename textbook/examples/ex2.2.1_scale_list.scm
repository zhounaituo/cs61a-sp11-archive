; (scale (list 1 2 3 4 5) 10)
; (10 20 30 40 50)

(define (scale-list items factor)
    (if (null? items)
        nil
        (cons (* (car items) factor)
              (scale-list (cdr items)
                          factor))))

(define (scale-list items factor)
    (map (lambda (x) (* x factor))
         items))