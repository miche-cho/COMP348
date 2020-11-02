(defun sub-list (lst a b)
    (setf diff (- b a))
    (cond 
        ((or(null lst)(null a)(null b) nil))
        ((< b a) nil)
        ((< 1 a) (sub-list (cdr lst) (- a 1) b))
        ((< 0 diff) (cons (car lst) (sub-list (cdr lst) a  (- diff 1) )))
        )
    )

(print(sub-list '(1 3 5 2 3) 2 2))