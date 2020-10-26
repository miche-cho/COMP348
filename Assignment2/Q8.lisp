;return in a list of lucas in reversed order since the head is easier to operate
;the list passed to this function should be checked that length >=2 and n is a number
(defun process-sequence(lst n)
	(if(> n 1)
		(process-sequence (cons (+(car lst) (car(cdr lst))) lst) (- n 1))
		lst)) 



(defun lucas(n)
	(cond ((eql n 0) '(2))
		((> n 0) (reverse (process-sequence '(1 2) n))) 
		(t "invalid input")))
