;;; Helper function for asking a question and reading in input.
(defun prompt-read (prompt) 
    (format *query-io* "~a: " prompt)
    (read-line *query-io*))

;;; Calculates a tip from the product price and the desired tip percentage.
(defun get-tip (price percentage) 
    (* price (/ percentage 100)))

;;; Calculates the total to pay based on the product price and the calculated tip.
(defun calculate-tip-and-total (price percentage)
    (defvar tip (get-tip price percentage))
    (defvar total (+ price tip))
    (format t "Your tip is $~a ~%" tip)
    (format t "Your total is $~a" total))

;;; Reads in the price and desired tip percentage and sends them to `calculate-tip-and-total` for processing.
(defun user-input () (calculate-tip-and-total 
    (parse-integer (prompt-read "What was the price?")) 
    (parse-integer (prompt-read "What percentage would you like to leave?"))))