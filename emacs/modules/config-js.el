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

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

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

(add-hook 'js2-mode-hook 'config/js-mode-hook)

(add-hook 'inferior-js-mode-hook 'config/inferior-js-mode-hook)

;(define-key 'js2-mode-map (kbd "RET") 'newline-and-indent)

(provide 'config-js)
;;; config-js.el ends here
