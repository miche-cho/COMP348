;stand for not binary search tree. return head or null when it is a search tree and return true when it is not a search tree
(defun n-search-tree(lst)
	(if (null (car lst))
		nil
		(let (	(lr (n-search-tree (car (cdr lst))))
				(rr (n-search-tree(car(cdr(cdr lst)))))
				(h (car lst)))
			(cond ((or (eql lr t) (eql rr t)) t)
				((and (not (null lr)) (> lr h)) t)
				((and (not (null rr)) (< rr h)) t)
				(t h)
			))))
(defun is-search-tree(lst)
	(if (eql (n-search-tree lst)t)
		nil
		t))
		
; test :(print (is-search-tree '(8 (3 (1 () ()) (6 (4 () ())(7 () ()))) (10 () (14 (13 () ()) ())))))
; result t