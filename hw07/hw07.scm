(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cdr (cdr s)))
)


(define (sign num)
  'YOUR-CODE-HERE
  (cond
    ((> num 0) 1)
    ((< num 0) -1)
    (else 0)
  )
)


(define (square x) (* x x))

(define (pow x y)
  'YOUR-CODE-HERE
  (cond
    ((= y 1) x)
    ((even? y) (square (pow x (/ y 2))))
    (else (* x (pow x (- y 1))))
  )
)


(define (unique s)
  'YOUR-CODE-HERE
  (if (null? s)
    nil
    (cons (car s) (unique (filter (lambda (x) (not (eq? x (car s)))) (cdr s))))
  )
)


(define (replicate x n)
  'YOUR-CODE-HERE
  (define (help x n ans)
    (if (= n 0)
      ans
      (help x (- n 1) (cons x ans))
    )
  )
  (help x n nil)
)
;  (if (= n 0)
;    nil
;    (if (= n 1)
;      (cond
;        ((pair? x) x)
;        (else (list x))
;      )
;      (if (not (pair? x))
;        (replicate (list x) n)
;        (replicate (append x (list (car x))) (- n 1))
;      )
;    )
;  )

(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (define (helper combiner start n term ans)
    (if (= n 0)
      (combiner start ans)
      (helper combiner start (- n 1) term (combiner ans (term n)))
    )
  )
  (helper combiner start (- n 1) term (term n))
)


(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (helper combiner start n term ans)
    (if (= n 0)
      (combiner start ans)
      (helper combiner start (- n 1) term (combiner ans (term n)))
    )
  )
  (helper combiner start (- n 1) term (term n))
)


(define-macro (list-of map-expr for var in lst if filter-expr)
  'YOUR-CODE-HERE
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
)

