;;; config-lisp.el --- Common lisp config.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config, lisp

;; This file is not part of GNU Emacs.

;;; Commentary:
;; General lisp config file.

;;; Code:

(require 'config-programming)
(require 'rainbow-delimiters)

;; Completion on tab
(define-key lisp-mode-shared-map (kbd "M-TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

;; lisp hooks
(defun config/lisp-hook ()
  (rainbow-delimiters-mode +1))

(defun config/lisp-interactive-hook ()
  (rainbow-delimiters-mode +1))

(provide 'config-lisp)
;;; config-lisp.el ends here
