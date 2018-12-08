;; Dumps contents of a text file into a list.
(defun open-file (file-name)
  (with-open-file (file-stream file-name)
    (loop for line = (read-line file-stream nil)
          while line
       collect line)))

;; Takes a list containing string representations of integers and returns a parsed list of integers.
(defparameter int-list '(+))
(defun get-list-of-ints (list-from-file)
  (dolist (an-int-string list-from-file)
    (nconc int-list (list (parse-integer an-int-string)))))

(defun find-sum ()
  (get-list-of-ints (open-file "input.txt"))
  (format t (write-to-string (eval int-list))))










