(defun cons-nd(h lst)
	(if (or  (null h)(member h lst))
		lst
		(cons h lst)))
;return cons of head and list without duplicate

(defun flatten-numbers(lst)
	(cond ((null lst) '());deal with null
		((numberp (car lst)) (cons-nd(car lst) (flatten-numbers (cdr lst))));deal with number
		((listp (car lst))(flatten-numbers(append (car lst)(cdr lst))));deal with list
		(t (flatten-numbers(cdr lst)))
		))
; test : (print (flatten-numbers '(1 2 3 1.4 (1 1.5))))
; output: (2 3 1.4 1 1.5)

; given example:  (flatten-numbers '(1 2 (3 1) (a 2.5) (2 4.5) ((1 2))))
;output (3 2.5 4.5 1 2)  order are different but have same numbers 