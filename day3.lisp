(in-package #:advent2022)

(defun get-first-char-code (str)
  (let (( cc (char-code (char str 0))) )
    (if (< cc 95)
	(- cc 38)
	(- cc 96))))

(defun read-ruck () 
  (loop :for ruck
	  :in (uiop:read-file-lines
	       (asdf:system-relative-pathname 'advent2022 "inputs/day3"))
	collect (mapcar #'get-first-char-code (split "" ruck))) )

;; dedup found on stack overflow, lispy way
(defun dedup (L)
  (cond ((null L) L)
        ((member (car L) (cdr L))
         (dedup (cdr L)))
        (t (cons (car L) (dedup (cdr L))))))

(defun dedup-split-list (lst)
  (let ((ll (/ (list-length lst) 2) ))
    (list  (dedup (subseq lst 0 ll)) (dedup (subseq lst ll))) )  )

;; sol 1
(defun day3/solution1 ()
  (loop for ruck in (read-ruck)
	sum (first  (intersection
		     (first (dedup-split-list ruck))
		     (second (dedup-split-list ruck))))))
  
;; sol 2
(defun day3/solution2 ()
  (loop
    :with rr = (read-ruck) 
    :for i
      :below (length rr)
    :when (= 0 (mod i 3))
      :sum (first (intersection
		   (dedup (nth (+ i 2) rr))
		   (intersection 
		    (dedup (nth i rr))
		    (dedup (nth (+ i 1) rr)))))
    )  )

;;;--------------------------------------------------------------------
;;;      stuff not used

;; not used, maybe useful another day. need to load iterate package
(use-package :iterate)
(defun bag-to-set (lst)
  (iter (for el in lst)
    (adjoining el)))

