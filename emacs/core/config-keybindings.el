;;; config-keybindings.el --- Global keybindings.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config, keybindings

;; This file is not part of GNU Emacs.

;;; Commentary:
;; This file contains global keybindings.

;;; Code:

;; no Ctrl-Z
(global-unset-key "\C-z")

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key [f11] 'eshell)
(global-set-key [f12] 'config/toggle-fullscreen)

(provide 'config-keybindings)
;;; config-keybindings.el ends here
