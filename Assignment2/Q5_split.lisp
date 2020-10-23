(defun split (lst)
  (let ((firsthalf (list (car lst))) (size (length lst))) 
    (separate (cdr lst) size firsthalf)))

(defun separate (lst size firsthalf)
  (if (> (/ size 2) (length firsthalf))
      (separate (cdr lst) size (append firsthalf (cons (car lst) '())))
      (cons firsthalf (cons lst '()))))
      
