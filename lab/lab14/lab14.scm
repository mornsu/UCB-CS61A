(define (split-at lst n)
  'YOUR-CODE-HERE
  (define (helper lst n new)
    (if (null? lst) (cons new nil)
        (if (= n 0) (cons new lst)
          (helper (cdr lst) (- n 1) (append new (list (car lst))))))
  )
  (helper lst n '()) 
)


(define (compose-all funcs)
  'YOUR-CODE-HERE
  (lambda (x)
          (if (null? funcs) 
              x
              ((compose-all (cdr funcs)) ((car funcs) x))
)))

