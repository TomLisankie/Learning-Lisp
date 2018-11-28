(defun make-cd (title artist rating ripped) (list :title title :artist artist :rating rating :ripped ripped))

(make-cd ("Watch The Throne" "Jay-Z and Kanye West" 4 T))

(make-cd "Watch The Throne" "Jay-Z and Kanye West" 4 T)

(defvar *db* nil) ; variables surrounded with asterisks are global variables.

(defun add-record (cd) (push cd *db*))

(add-record (make-cd "Dookie" "Green Day" 4.5 T))
(add-record (make-cd "Watch The Throne" "Jay-Z and Kanye West" 4 T))

;;; Shows all items in the database in a pretty way.
(defun dump-db () 
    (dolist (cd *db*) ;; this is a for loop
        (format t "~(~a:~10t~a~%~)~%" cd)
    )
)
(defun prompt-for-cd ()
    (make-cd
    (prompt-read "Title")
    (prompt-read "Artist")
    (or (parse-integer (prompt-read "Rating")) 0)
    (y-or-n-p (prompt-read "Ripped [y/n]")) ;; makes sure what the user types is 'y' or 'n'
    )
)

;;; Lets user enter many albums at a time.
(defun add-cds ()
    (loop (add-record (prompt-for-cd))
        (if (not (y-or-n-p "Another? [y/n]: ")) (return)
        )
    )
)

;;; Allows the user to save the current database for opening later.
(defun save-db (filename)
    (with-open-file (out filename
                :direction :output
                :if-exists :supersede)
        (with-standard-io-syntax
            (print *db* out)
        )
    )
)

;;; Allows the user to load in a previously saved database.
(defun load-db (filename)
    (with-open-file (in filename)
        (with-standard-io-syntax
        (setf *db* (read in))
        )
    )
)

;;; Allows a user to get all records by a specific artist
(defun select-by-artist (artist)
    (remove-if-not
    #' (lambda (cd) (equal (getf cd :artist) artist)) *db*
    )
)

;;; Generalizes selecting so that you can pass in an arbitrary function for selecting a specific property.
(defun select (selector-fn)
    (remove-if-not selector-fn *db*)
)

;;; Forget writing separate functions for returning lambdas for each property.
;;; Let's write a function that returns a lambda for whatever property you pass into it.
;;; We'll call it 'where' because it's supposed to represent a function and the function returns records *where* they match the criteria.
(defun where (&key title artist rating (ripped nil ripped-p))
    #' (lambda (cd) 
            (and 
                (if title (equal (getf cd :title) title) t)
                (if artist (equal (getf cd :artist) artist) t)
                (if rating (equal (getf cd :rating) rating) t)
                (if ripped-p (equal (getf cd :ripped) ripped) t)
            )
    )
)