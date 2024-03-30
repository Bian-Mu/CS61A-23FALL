(define (vir-fib n)
    'YOUR-CODE-HERE
)

(expect (vir-fib 10) 55)
(expect (vir-fib 1) 1)


(define with-list
    (list
        'YOUR-CODE-HERE
    )
)
(draw with-list)


(define with-quote
    '(
        'YOUR-CODE-HERE
    )

)
(draw with-quote)


(define helpful-list
   (cons 'a (cons 'b nil)))
(draw helpful-list)

(define another-helpful-list
    (cons 'c (cons 'd (cons (cons 'e nil) nil))))
(draw another-helpful-list)

(define with-cons
    (cons
        'YOUR-CODE-HERE
    )
)
(draw with-cons)


(define (list-concat a b)
    'YOUR-CODE-HERE
)

(expect (list-concat '(1 2 3) '(2 3 4)) (1 2 3 2 3 4))
(expect (list-concat '(3) '(2 1 0)) (3 2 1 0))


(define (map-fn fn lst)
    'YOUR-CODE-HERE
)

(map-fn (lambda (x) (* x x)) '(1 2 3))
; expect (1 4 9)


(define (remove item lst)
  'YOUR-CODE-HERE
)

(expect (remove 3 nil) ())
(expect (remove 2 '(1 3 2)) (1 3))
(expect (remove 1 '(1 3 2)) (3 2))
(expect (remove 42 '(1 3 2)) (1 3 2))
(expect (remove 3 '(1 3 3 7)) (1 7))


(define (duplicate lst)
    'YOUR-CODE-HERE
)

(expect (duplicate '(1 2 3)) (1 1 2 2 3 3))
(expect (duplicate '(1 1)) (1 1 1 1))
