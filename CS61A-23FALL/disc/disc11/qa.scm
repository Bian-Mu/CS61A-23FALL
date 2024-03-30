(define (reverse lst)
    (if (null? lst)
        nil
        (append (reverse (cdr lst)) (list (car lst))
        )))


; helper function
; returns the values of lst that are bigger than x
; e.g., (larger-values 3 '(1 2 3 4 5 1 2 3 4 5)) --> (4 5 4 5)
(define (larger-values x lst)
    (if (null? lst)
        nil
        (if (< x (car lst))
            (cons (car lst) (larger-values x (cdr lst)))
            (larger-values x (cdr lst)))))

(define (longest-increasing-subsequence lst)
    (if (null? lst)
        nil
        (begin
            (define first (car lst))
            (define rest (cdr lst))
            (define large-values-rest
                (larger-values first rest))
            (define with-first
                (cons first (longest-increasing-subsequence large-values-rest)))
            (define without-first
                (longest-increasing-subsequence rest))
            (if (> (length with-first) (length without-first))
                with-first
                without-first)))

(expect (longest-increasing-subsequence '()) ())
(expect (longest-increasing-subsequence '(1)) (1))
(expect (longest-increasing-subsequence '(1 2 3)) (1 2 3))
(expect (longest-increasing-subsequence '(1 9 2 3)) (1 2 3))
(expect (longest-increasing-subsequence '(1 9 8 7 6 5 4 3 2 3)) (1 2 3))
(expect (longest-increasing-subsequence '(1 9 8 7 2 3 6 5 4 5)) (1 2 3 4 5))
(expect (longest-increasing-subsequence '(1 2 3 4 9 3 4 1 10 5)) (1 2 3 4 9 10))


(define (cons-all first rests)
    (define (add-first first lst)
        (if (null? lst)
            (list first)
            (append (lst first)))
    (map (add-first first) rests)) 
)


;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  (if (= total 0)
      (list '())
      (if (null? denoms)
          '()
          (let ((first-denom (car denoms))
                (rest-denoms (cdr denoms)))
            (append
             (if (>= total first-denom)
                 (map (lambda (way) (cons first-denom way))
                      (list-change (- total first-denom) denoms))
                 '())
             (list-change total rest-denoms)))))
)
