;;; config-utils.el --- Utility functions.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: utility, utils

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Utility functions, used by some of the files.

;;; Code:

(defun config/all (lst)
  (if lst
      (let ((head (car lst))
	    (tail (cdr lst)))
	(when head
	  (config/all tail)))
    t))

(defun config/some (lst)
  (if lst
      (let ((head (car lst))
	    (tail (cdr lst)))
	(if head
	    t
	  (config/some lst)))
    nil))

(provide 'config-utils)
;;; config-core.el ends here
