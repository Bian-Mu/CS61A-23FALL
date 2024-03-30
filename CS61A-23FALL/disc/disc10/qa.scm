(define (vir-fib n)
    (if (= n 0) 0
            (if (= n 1) 1
                    (+ (vir-fib (- n 1)) (vir-fib (- n 2)))))
)
(define (vir-fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (if (= n 0) 0 (fib-iter 1 0 n)))

(expect (vir-fib 10) 55)
(expect (vir-fib 1) 1)


(define with-list (list (list 'a 'b) (list 'c (list 'd (list 'e nil)))))
(draw with-list)


(define with-quote quot((a b) (c (d (e)))))
(draw with-quote)


(define helpful-list
   (cons 'a (cons 'b nil)))
(draw helpful-list)

(define another-helpful-list
    (cons 'c (cons 'd (cons (cons 'e nil) nil))))
(draw another-helpful-list)

(define with-cons
    (cons helpful-list (cons another-helpful-list nil)))
(draw with-cons)


(define (list-concat a b)
    (if (null? a)
        b
        (cons (car a) (list-concat (cdr a) b)))
)

(expect (list-concat '(1 2 3) '(2 3 4)) (1 2 3 2 3 4))
(expect (list-concat '(3) '(2 1 0)) (3 2 1 0))


(define (map-fn fn lst)
  (if (null? lst)
      '()         
      (cons (fn (car lst)) 
            (map-fn fn (cdr lst)))))


(map-fn (lambda (x) (* x x)) '(1 2 3))
; expect (1 4 9)


(define (remove item lst)
  (if (null? lst)
      '()
      (if (= (car lst) item)
          (remove item (cdr lst))
          (cons (car lst) (remove item (cdr lst))))))

(expect (remove 3 nil) ())
(expect (remove 2 '(1 3 2)) (1 3))
(expect (remove 1 '(1 3 2)) (3 2))
(expect (remove 42 '(1 3 2)) (1 3 2))
(expect (remove 3 '(1 3 3 7)) (1 7))


(define (duplicate lst)
    (if (null? lst)
        '()
        (cons (car lst) (cons (car lst) (duplicate (cdr lst)))))
)

(expect (duplicate '(1 2 3)) (1 1 2 2 3 3))
(expect (duplicate '(1 1)) (1 1 1 1))
