; get the nth element (this is unused atm)
(defun get-nth-el (lst n)
    (cond 
        ((or (null lst) (< n 1)) nil)
        ((equal n 1) (car lst))
        (t  (get-n (cdr lst)(- n 1)))))




(defun sub-list (lst a b)
    (setf diff (- b a))   ; different btw to and from 
    (cond 
        ((or(null lst)(null a)(null b) nil)) ; if not list, and a and b are all empty return nil
        ((< b a) nil) ; return nil if a is bigger than b 
        ((< 1 a) (sub-list (cdr lst) (- a 1) b))  ; start a index a starting from 1 
        ((< 0 diff) (cons (car lst) (sub-list (cdr lst) a  (- diff 1) ))) ; add numbers from difference onwards
        )
    )


; testing
(print(sub-list '(1 3 5 2 3) 2 2))