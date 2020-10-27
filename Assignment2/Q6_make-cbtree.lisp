;Amine Halimi 40112879 V1.0

;This function creates a leaf with the given element as its head
(defun make-bin-tree-leaf (E)
  (list E '() '()))

;This function creates a node with the given values
(defun make-bin-tree-node (E N1 N2)
  (list E N1 N2))

;This function inserts a newly created node as a subtree of a node.
(defun insert-node-leaf (elt node)
  (cond ((<= elt (first node))
         (if (null (second node)) (make-bin-tree-node (first node) (make-bin-tree-leaf elt) (third node))
             (make-bin-tree-node (first node) (insert-node-leaf elt (second node)) (third node))))
        ((> elt (first node))
         (if (null (third node)) (make-bin-tree-node (first node) (second node) (make-bin-tree-leaf elt))
             (make-bin-tree-node (first node) (second node) (insert-node-leaf elt (third node)))))))

(defun iterate-list (lst cbtree)
  (if (> (length lst) 0) (iterate-list (cdr lst) (insert-node-leaf (car lst) cbtree))
      (write cbtree)))

(defun make-cbtree (lst)
  (cond ((null lst) nil) 
        ((= 1 (length lst)) (make-bin-tree-leaf (car lst)))
        (t (iterate-list (cdr lst) (make-bin-tree-leaf (car lst))))))
