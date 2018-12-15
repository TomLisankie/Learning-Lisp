(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun save-entry (file-path entry)
  "Saves journal entry to a file."
  (with-open-file (out (concatenate 'string file-path "journal.txt")
		       :direction :output
		       :if-exists :append)
    (with-standard-io-syntax
      (print entry out))))

(defun make-path-text-file (filepath)
  (with-open-file (out "journal-path.txt"
		       :direction :output
		       :if-exists :overwrite
		       :if-does-not-exist :create)
    (with-standard-io-syntax
      (progn
	(setf filepath (prompt-read "Where do you want to save today's entry?"))
	(print filepath out)))))
  

(defun run-journal ()
  "Allows user to enter save location for journal, write their entry, and then have it save to a file."
  (defvar filepath "")
  (if (probe-file "journal-path.txt")
      (setf filepath (uiop:read-file-string "./journal-path.txt"))
      (make-path-text-file filepath))
  (save-entry
   filepath
   (prompt-read "Write your journal entry here")))
