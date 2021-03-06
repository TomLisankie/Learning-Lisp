(defun open-file (file-name)
  "Dumps contents of a text file into a list."
  (with-open-file (file-stream file-name)
    (loop for line = (read-line file-stream nil)
          while line
       collect line)))

(defun find-first-duplicate (list-from-file)
  "Takes a list containing string representations of integers and finds the first sum that is repeated twice."
  (let ((sum 0)
	(seen-sums (make-hash-table)))
    (dolist (an-int-string list-from-file)
      (setf sum (+ sum (parse-integer an-int-string)))
      (if (gethash an-int-string seen-sums)
	  (incf (gethash an-int-string seen-sums) 1)
	  (setf (gethash an-int-string seen-sums) 1))
      (if (> (gethash an-int-string seen-sums) 1)
        (format t (write-to-string sum))))))
      
      












