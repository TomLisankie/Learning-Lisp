;; Dumps contents of a text file into a list.
(defun open-file (file-name)
  (with-open-file (file-stream file-name)
    (loop for line = (read-line file-stream nil)
          while line
       collect line)))

;; Takes a list containing string representations of integers and returns a parsed list of integers.
(defun find-sum (list-from-file)
  (let ((sum 0))
    (dolist (an-int-string list-from-file)
      (setf sum (+ sum (parse-integer an-int-string))))
    (format t (write-to-string sum))))










