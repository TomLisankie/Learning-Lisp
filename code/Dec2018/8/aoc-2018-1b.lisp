;; Dumps contents of a text file into a list.
(defun open-file (file-name)
  (with-open-file (file-stream file-name)
    (loop for line = (read-line file-stream nil)
          while line
       collect line)))

;; Takes a list containing string representations of integers and returns a parsed list of integers.
(defun find-first-duplicate (list-from-file)
  (let ((sum 0)
	(seen-sums (make-hash-table)))
    (dolist (an-int-string list-from-file)
      (setf sum (+ sum (parse-integer an-int-string)))
      (if (gethash an-int-string seen-sums)
	  (incf (gethash an-int-string seen-sums) 1)
	  (setf (gethash an-int-string seen-sums) 1))
      (if (> (gethash an-int-string seen-sums) 1)
        (format t (write-to-string sum))))))
      
      












