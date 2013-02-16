;;; config-programming.el --- Prog-mode config.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config, programming

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Basic prog-mode config.

;;; Code:

;; show the name of the current function definition in the modeline
(require 'which-func)
(setq which-func-modes t)
(which-function-mode 1)

(defun config/auto-fill-only-comments ()
  "Breaks only comments, not code."
  (set (make-local-variable 'comment-auto-fill-only-comments) t))

(defun config/add-watchwords ()
  "Adds additional keywords like TODO, FIXME, and so on."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook (lambda ()
                            (config/add-watchwords)
                            (config/auto-fill-only-comments)))

(provide 'config-programming)
;;; config-programming.el ends here
