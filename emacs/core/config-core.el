;;; config-core.el --- Core functions.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Core functions.

;;; Code:

(defun config/toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(defun config/move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(defun config/move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(provide 'config-core)
;;; config-core.el ends here
