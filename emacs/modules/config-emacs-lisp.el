;;; config-emacs-lisp.el --- Config for emacs lisp programming.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config, lisp

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Emacs lisp config.

;;; Code:

(require 'config-lisp)

(defun config/open-ielm ()
  "Splits a window and opens ielm console. Creates one if it doesn't already exist."
  (interactive)
  (if (not (get-buffer "*ielm*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ielm))
    (switch-to-buffer-other-window "*ielm*")))

(defun config/remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))


(add-hook 'emacs-lisp-mode-hook 'config/lisp-hook)
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (config/remove-elc-on-save)
                                  (turn-on-eldoc-mode)))

(add-hook 'ielm-mode-hook 'config/lisp-interactive-hook)
(add-hook 'ielm-mode-hook (lambda () 
                            (turn-on-eldoc-mode)))

(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)
(define-key emacs-lisp-mode-map (kbd "C-c C-z") 'config/open-ielm)
(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-last-sexp)
(define-key emacs-lisp-mode-map (kbd "C-c v") 'eval-current-buffer)

(provide 'config-emacs-lisp)
;;; config-emacs-lisp.el ends here
