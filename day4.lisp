(in-package #:advent2022)

(defun parse-sched (sched)
  (let ( (ss (split "-" sched)))
    (list (parse-integer (first ss))
	  (parse-integer (second ss)))))

(defun read-schedule ()
  (loop for (s1 s2) in
		    (loop :for sched
			    :in (uiop:read-file-lines
				 (asdf:system-relative-pathname 'advent2022 "inputs/day4"))
			  collect (split "," sched))
	collect (list (parse-sched s1) (parse-sched s2)) ) )

(defun overlaps (sched)
   (let (
	 (1fr (first (first sched)))
	 (1to (second (first sched)))
	 (2fr (first (second sched)))
	 (2to (second (second sched)))
	 )
     (if (or (and (>= 1fr 2fr) (<= 1to 2to)) ; 1 in 2
	     (and (>= 2fr 1fr) (<= 2to 1to))); 2 in 1
	 1 0)  ) )

(defun partial-overlap (sched)
  (let (
	(1fr (first (first sched)))
	(1to (second (first sched)))
	(2fr (first (second sched)))
	(2to (second (second sched)))
	)
    (if (or
	 (and (>= 1fr 2fr) (<= 1fr 2to))  ; 1fr in 2
	 (and (>= 1to 2fr) (<= 1to 2to))  ; 1to in 2
	 (and (>= 2fr 1fr) (<= 2fr 1to))  ; 2fr in 1
	 (and (>= 2to 1fr) (<= 2to 1to))  ; 2to in 1
	 )  
	1 0)  ) )

;; sol 1
(defun day4/solution1 ()
  (loop :for sched :in (read-schedule)
	sum (overlaps sched))
  )
  
;; sol 2
(defun day4/solution2 ()
 (loop :for sched :in (read-schedule)
       sum (partial-overlap sched)))



