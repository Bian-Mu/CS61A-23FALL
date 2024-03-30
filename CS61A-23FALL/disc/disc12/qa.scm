(define-macro (mystery expr)
    `(let ((/ (lambda (a b) (if (= b 0) 1 (/ a b))))) ,expr))

(define (letter-grade earned possible)
    (mystery
        (cond
        ((>= (/ earned possible) 0.9) 'A)
        ((>= (/ earned possible) 0.8) 'B)
        ((>= (/ earned possible) 0.7) 'C)
        ((>= (/ earned possible) 0.6) 'D)
        (else 'F))))
; Tests
(expect (letter-grade 100 0) A)
(expect (letter-grade 95 100) A)
(expect (letter-grade 85 100) B)
(expect (letter-grade 75 100) C)
(expect (letter-grade 65 100) D)
(expect (letter-grade 55 100) F)

;First, try using quasiquotation to implement this macro procedure.
(define-macro (max expr1 expr2)
    `(if (>= ,expr1 ,expr2) ,expr1 ,expr2)
    )

; Test
(expect (max -3 (+ 1 2)) 3)
(expect (max 1 1) 1)

;Now, try writing this macro using list.
(define-macro (max expr1 expr2)
    (list 'if (list '>= expr1 expr2)
        expr1
        expr2))

; Test
(expect (max -3 (+ 1 2)) 3)
(expect (max 1 1) 1)


;Finally, write this macro using cons.
(define-macro (max expr1 expr2)
     (cons 'if (cons (cons '> (cons expr1 (cons expr2 '())))
                  (cons expr1 (cons expr2 '())))))

; Test
(expect (max -3 (+ 1 2)) 3)
(expect (max 1 1) 1)


(define-macro (multi-assign sym1 sym2 expr1 expr2)
    `(begin (define ,sym1 ,expr1) (define ,sym2 ,expr2) undefined)
)

; Tests
(multi-assign x y 1 2)
(expect (= x 1) #t)
(expect (= y 2) #t)




(define-macro (multi-assign sym1 sym2 expr1 expr2)
    `(begin (define ,sym2 (list ,expr1 ,expr2))
            (define ,sym1 (car ,sym2))
            (define ,sym2 (car (cdr ,sym2)))
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
  (if (pair? e)
      (cons (replace-helper (car e) o n) (replace-helper (cdr e) o n))
      (if (eq? e o) n e)))
(define-macro (replace expr old new)
    (replace-helper expr old new))

; Tests
(expect (replace (define x 2) x y) y)
(expect (= y 2) #t)
(expect (replace (+ 1 2 (or 2 3)) 2 0) 1)