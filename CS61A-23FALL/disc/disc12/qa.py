(define-macro (mystery expr)
    `(let ((/ (lambda (a b) (if (= b 0) 1 (/ a b))))) ,expr))

(define (letter-grade earned possible)
    'YOUR-CODE-HERE
    )

; Tests
(expect (letter-grade 100 0) A)
(expect (letter-grade 95 100) A)
(expect (letter-grade 85 100) B)
(expect (letter-grade 75 100) C)
(expect (letter-grade 65 100) D)
(expect (letter-grade 55 100) F)


(define-macro (max expr1 expr2)
    'YOUR-CODE-HERE
    )

; Test
(expect (max -3 (+ 1 2)) 3)
(expect (max 1 1) 1)


(define-macro (max expr1 expr2)
    'YOUR-CODE-HERE
    )

; Test
(expect (max -3 (+ 1 2)) 3)
(expect (max 1 1) 1)



(define-macro (max expr1 expr2)
    'YOUR-CODE-HERE
    )

; Test
(expect (max -3 (+ 1 2)) 3)
(expect (max 1 1) 1)


(define-macro (multi-assign sym1 sym2 expr1 expr2)
    `(_________ (define ____________ ____________) (define ____________ ____________) undefined)
)

; Tests
(multi-assign x y 1 2)
(expect (= x 1) #t)
(expect (= y 2) #t)




(define-macro (multi-assign sym1 sym2 expr1 expr2)
    `(_________ (define ,sym2 (list ______________________________________))
            (define ___________ ____________________________________________)
            (define ___________ ____________________________________________)
            undefined)
)

; Tests
(multi-assign x y 1 2)
(expect (= x 1) #t)
(expect (= y 2) #t)
(multi-assign x y y x)
(expect (= x 2) #t)
(expect (= y 1) #t)



(define (replace-helper e o n)
  (if ___________________________________
      ___________________________________________________________________
      ___________________________________________________________________))
(define-macro (replace expr old new)
    (replace-helper expr old new))

; Tests
(expect (replace (define x 2) x y) y)
(expect (= y 2) #t)
(expect (replace (+ 1 2 (or 2 3)) 2 0) 1)