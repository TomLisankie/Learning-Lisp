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
      (incf sum (parse-integer an-int-string))
      (if (> (incf (gethash sum seen-sums 0)) 1)
	(format t "~a " sum)))))
      
      












