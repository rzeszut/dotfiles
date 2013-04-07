;;; config-js.el --- Config for javascript programming.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 26 Mar 2013
;; Keywords: config, js

;; This file is not part of GNU Emacs.

;;; Commentary:
;; JS config.

;;; Code:

(require 'config-programming)
(require 'js2-mode)
(require 'js-comint)
(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(add-to-list 'ac-modes 'coffee-mode)

(setq inferior-js-program-command "node")

(defun config/js-mode-hook ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "C-c C-z") 'run-js)
  (local-set-key (kbd "C-c C-c") 'js-send-region)
  (local-set-key (kbd "C-c v") 'js-send-buffer)
  (local-set-key (kbd "C-c +") 'hs-hide-block)
  (local-set-key (kbd "C-c -") 'hs-show-block)
  (electric-layout-mode -1)
  (hs-minor-mode t))

(defun config/inferior-js-mode-hook ()
  (ansi-color-for-comint-mode-on)
  (add-to-list 'comint-preoutput-filter-functions
               (lambda (output)
                 (replace-regexp-in-string "\033\\[[0-9]+[GK]" "" output))))

(defun config/coffee-mode-hook ()
  (set (make-local-variable 'tab-width) 2))

(add-hook 'js2-mode-hook 'config/js-mode-hook)

(add-hook 'inferior-js-mode-hook 'config/inferior-js-mode-hook)

(add-hook 'coffee-mode-hook 'config/coffee-mode-hook)

(provide 'config-js)
;;; config-js.el ends here
