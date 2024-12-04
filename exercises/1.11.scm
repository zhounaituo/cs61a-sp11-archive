(define (f n)
  (if (< n 3) 
      n
      (+ (f (- n 1)) 
         (* 2 (f (- n 2))) 
         (* 3 (f (- n 3))) )))

;;;;;
(define (f n)
      (f-iter 2 1 0 0 n))
(define (f-iter a b c cou n)
  (if (= cou n)
      c
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (+ cou 1)
              n)))
