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

(defun run-journal ()
  "Allows user to enter save location for journal, write their entry, and then have it save to a file."
  (save-entry
   (prompt-read "Where do you want to save today's entry?")
   (prompt-read "Write your journal entry here")))
