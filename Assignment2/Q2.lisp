; get the nth element helper function
(defun get-nth (lst n)
    (cond 
        ((or (null lst) (< n 1)) nil)
        ((equal n 1) (car lst)) ; base case, if n is 1 return head of list
        (t  (get-nth (cdr lst)(- n 1))))) ; recursion, if n isn't 1 return rest of list


; modified for reverse capabilities and having optional a and b parameters
(defun sub-list (lst &optional a b)
    (cond 
        ((or(null lst)(not(listp lst))) nil) ; if list empty return nil
        ((null b) (sub-list lst a (list-length lst))) ; if no b provided or nil take length of list as b
        ((null a) (sub-list lst (car lst) b)) ; if no a provided or nil, take head of list
        ((equal a b) (cons (get-nth lst b) '())) ; base case, return element for b
        ((< b a) ; if a is greater than b, go reverse
            (cond
                ((< (list-length lst) a) nil) ;  return nil if a is larger than size of list
                ((< b a)(cons (get-nth lst a) (sub-list lst (- a 1) b))) ; recursive for reverse, decrements a
                )                   
         ) 
        ((< a b) ; if b is greater than a, go forward
             (cond
                ((< (list-length lst) b) nil) ; return nil if b is bigger than list length
                ((< a b)(cons (get-nth lst a) (sub-list lst (+ 1 a) b))) ; recursive for forward, increments a
                )
         )  
     )
)


; testing cases and their results
(print(sub-list 12 )) ; NIL 12 is not a list
(print(sub-list '(1 3 5 2 3) )) ; (1 3 5 2 3) a and b not declared takes all 
(print(sub-list '(1 3 5 2 3) 3 )) ; (5 2 3) b not declared, 3rd to last
(print(sub-list '(1 3 5 2 3) 3 nil)) ; (5 2 3) b is nil, 3rd to last
(print(sub-list '(1 3 5 2 3) 5  1)) ; (3 2 5 3 1) reverse, last index to 1st
(print(sub-list '(1 3 5 2 3) 4  2)) ; (2 5 3) reverse, 4th to 2nd
(print(sub-list '(1 3 5 2 3) 7  1)) ; NIL out of bounds, reverse
(print(sub-list '(1 3 5 2 3) 1  7)) ; NIL out of bounds, forward
