(define (cube-iter guess last-guess x)
  (if (enough? guess last-guess)
      guess 
      (cube-iter (improve guess x) guess x)))

(define (enough? guess last-guess)
  (< (abs (- guess last-guess)) 0.00001))
(define (improve y x)
  (/ (+ (/ x (quare y)) (* 2 y)) 3))
(define (quare x) (* x x))

(define (cube-root x)
  (cube-iter 1.0 x x))
