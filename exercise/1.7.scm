(define (square-root x)
  (sqrt-iter 1.0 x x))

(define (sqrt-iter guess last-guess x)
  (if (enough? guess last-guess)
      guess
      (sqrt-iter (improve guess x) guess x)) )

(define (enough? guess last-guess)
  (< (abs (- guess last-guess)) 0.00001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

