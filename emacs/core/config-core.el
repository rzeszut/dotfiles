;;; config-core.el --- Core functions.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config, defuns

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Core function definitions.

;;; Code:
;(require 'minimap)

(defun config/toggle-fullscreen (&optional f)
  "Toggles fullscreen mode."
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(defun config/move-line-up ()
  "Swaps this line with the line above."
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(defun config/move-line-down ()
  "Swaps this line with the line below."
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

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

(defun config/minimap-toggle ()
  "Toggle minimap for current buffer."
  (interactive)
  (if (null minimap-bufname)
      (minimap-create)
    (minimap-kill)))

(provide 'config-core)
;;; config-core.el ends here
