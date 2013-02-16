;;; config-ui.el --- UI configuration.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: ui, config

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Remove the menu bar, toolbar, and other useless graphical interface elements.
;; Set theme to tomorrow-night.

;;; Code:

;; remove toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; remove menubar: now and after loading each frame
(menu-bar-mode -1)
(add-hook 'after-make-frame-functions
	  (lambda (frame)
	    (menu-bar-mode -1)))

;; turn off blinking cursor
(blink-cursor-mode -1)

;; no scrollbars
(scroll-bar-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; soem scrolling improvements
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; add line numbers
;(global-linum-mode t)

;; set frame title
(setq frame-title-format "emacs - %b")

;; smaller fringes (from 8 to 4):
;; the things on the side of the screen
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; load tomorrow night theme
(load-theme 'tomorrow-night t)

(provide 'config-ui)
;;; config-ui.el ends here
