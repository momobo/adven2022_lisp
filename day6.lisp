(in-package #:advent2022)

(defun read-message ()
  (uiop:read-file-lines (asdf:system-relative-pathname 'advent2022 "inputs/day6")))

;; dedup found on stack overflow, lispy way
(defun dedup (L)
  (cond ((null L) L)
        ((member (car L) (cdr L))
         (dedup (cdr L)))
        (t (cons (car L) (dedup (cdr L))))))

;;1 based
(defun prev-n (pos str n)
  (subseq str (max 0 (- pos n)) pos))

(defun get-pos (elem ls &optional (n 1))
  (cond
    ((null ls) ls)
    ((equal (car ls) elem) n )
    (T (get-pos elem (cdr ls) (+ n 1)))))

(defun solve (cars)
  (let ((str (car (read-message))))
    (1- (get-pos cars (loop for d in
			     (loop for s in
					 (loop 
					   :for i below (length str)
					   :collect (prev-n i str cars))
				   :collect (dedup (mapcar 'read-from-string (split "" s))) )
		       :collect (length  d)
		       )))  )  )
  
;; sol 1
(defun day5/solution1 ()
  (solve 4))

;; sol 2
(defun day5/solution2 ()
   (solve 14) )

    
