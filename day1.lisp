
(in-package #:advent2022)

(defun read-snacks ()
  (uiop:read-file-lines (asdf:system-relative-pathname 'advent2022 "inputs/day1")))

(defun get-snacks ()
  (loop with sublist = (list 0)
    :for el in
	   (loop
	     :for snack in
			(loop
			  :for i :from 0  :below (length  (read-snacks))
			  :collect (parse-integer
				    (nth i (read-snacks))
				    :junk-allowed T))
	     :collect (or snack 0))
	if (= el 0)
	  collect (nreverse sublist) and do (setf sublist nil)
	else
	  do (push el sublist)))

(defun get-grp ()
  (loop for grp in  (get-snacks)
		    collect (apply '+ grp)) )

( defun day1/solution1 ()
  (apply 'max (get-grp))  )


( defun day1/solution2 ()
 (apply '+ (subseq (sort (get-grp) #'>) 0 3))  )
