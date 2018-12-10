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
      (incf (gethash (write-to-string sum) seen-sums 0))
      ;(format t "~a~%" (gethash (write-to-string sum) seen-sums))
      (if (> (gethash (write-to-string sum) seen-sums) 1)
	  (write-to-string sum)))))
      
      












