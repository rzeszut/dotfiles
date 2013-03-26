;;; config-c.el --- Config for C/C++ programming.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Mar 2013
;; Keywords: config, c, c++

;; This file is not part of GNU Emacs.

;;; Commentary:
;; C/C++ config.

;;; Code:

(require 'config-programming)
(require 'cc-mode)
(require 'cedet)
(require 'semantic)
(require 'semantic/db)
(require 'semantic/bovine/gcc)
(require 'srecode)
(require 'srecode/cpp)
(require 'doc-mode)

;; Semantic
(global-semanticdb-minor-mode t)
(global-semantic-idle-local-symbol-highlight-mode t)
(global-semantic-idle-scheduler-mode t)
(global-semantic-idle-completions-mode nil)
(global-semantic-decoration-mode nil)

(setq semanticdb-default-save-directory "~/.semantic")

(c-add-style "my-style" '("java"
                          (c-basic-offset . 4)
                          (c-offsets-alist (access-label . -)
                                           (innamespace . 0)
                                           (topmost-intro-cont . 0))))

(defun config/c-mode-hook ()
  (c-set-style "my-style")
  (c-toggle-hungry-state 1)
  (subword-mode t)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (semantic-mode t)
  (srecode-minor-mode 1))

(setq doc-mode-template-keyword-char "\\")

(setq srecode-map-save-file "~/.emacs.d/savefile/srecode-map.el")

(add-hook 'c-mode-common-hook 'config/c-mode-hook)
(add-hook 'c-mode-common-hook 'doc-mode)

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(define-key c-mode-base-map (kbd "C-c -") 'senator-fold-tag)
(define-key c-mode-base-map (kbd "C-c +") 'senator-unfold-tag)
(define-key c-mode-base-map (kbd "C-c d") 'doc-mode-fix-tag-doc)
(define-key c-mode-base-map (kbd "C-c r") 'doc-mode-remove-tag-doc)

(provide 'config-c)
;;; config-c.el ends here
