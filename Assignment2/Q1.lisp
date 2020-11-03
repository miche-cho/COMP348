; get the nth element helper function
(defun get-nth (lst n)
    (cond 
        ((or (null lst) (< n 1)) nil)
        ((equal n 1) (car lst)) ; base case, if n is 1 return head of list
        (t  (get-nth (cdr lst)(- n 1))))) ; recursion, if n isn't 1 return rest of list


(defun sub-list (lst a b)
    (cond 
        ((or(null lst)(not(listp lst))(null a)(null b)) nil) ; if not list, and a and b are all empty return nil
        ((< (list-length lst) b) nil) ; return nil if b is bigger than list length
        ((< b a) nil) ; return nil if a is bigger than b 
        ((equal a b) (cons (get-nth lst b) '())) ; base case, return element for b
        ((< a b) (cons (get-nth lst a) (sub-list lst (+ 1 a) b)))  ; if a is smaller than b, add up indexes and increment a 
        )
    )


; testing cases and their results
(print(sub-list 12 1 2)) ; NIL 12 is not a list
(print(sub-list '(1 3 5 2 3) 2 4)) ; (3 5 2) second index to 4th
(print(sub-list '(1 3 5 2 3) 1 4)) ; (1 3 5 2) first to 4th
(print(sub-list '(1 3 5 2 3) 2 5)) ; (3 5 2 3) second to  5th
(print(sub-list '(1 3 5 2 3) 3 3)) ; (5) 3rd index
(print(sub-list '(1 3 5 2 3) 2 7)) ; NIL out of bounds
(print(sub-list '(1 3 5 2 3) 4 2)) ; NIL start is greater than final

