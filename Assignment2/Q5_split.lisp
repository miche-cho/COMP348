;Author: Amine Halimi 40112879
;This is the function the user will call, it calls the function separate 
(defun split (lst)
  (let ((firsthalf (list (car lst))) (size (length lst))) 
    (separate (cdr lst) size firsthalf)))

;This is the function that does the work. It recursively builds the first half of the list until its size is no longer smaller than half the original list's size
;After this, the first half is wrapped up with the second half.
(defun separate (lst size firsthalf)
  (if (> (/ size 2) (length firsthalf))
      (separate (cdr lst) size (append firsthalf (cons (car lst) '())))
      (cons firsthalf (cons lst '()))))
      
