(define (ascending? s) 
    (if (or (null? s) (null? (cdr s)))
        #t
        (if (> (car s) (car (cdr s)))
            #f
            (ascending? (cdr s)))))

(define (my-filter pred s) 
    (if (null? s)
        nil
        (if (pred(car s))
            (cons (car s) (my-filter pred (cdr s)))
            (my-filter pred (cdr s)))))

(define (interleave lst1 lst2) 
    (if (null? lst1)
        lst2
        (cons (car lst1) (interleave lst2 (cdr lst1)))))

(define (no-repeats s) 
    (define (added item lst)
        (if (null? lst)
            (list item)
            (if (not (= item (car lst)))
                (cons (car lst) (added item (cdr lst)))
                lst)))
    (define (process-items s result)
        (if (null? s)
            result
            (process-items (cdr s) (added (car s) result))))
  (process-items s '()))