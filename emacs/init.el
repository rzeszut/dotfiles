;;; init.el --- Main configuration file.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: init

;; This file is not part of GNU Emacs.

;;; Commentary:
;; This file sets up the default path and requires various modules.
;; Structure of this configuration is heavily based on prelude.

;;; Code:

(defvar *root-dir* "~/.emacs.d")
(defvar *core-dir* (expand-file-name "core" *root-dir*))
(defvar *modules-dir* (expand-file-name "modules" *root-dir*))
(defvar *snippets-dir* (expand-file-name "snippets" *root-dir*))
(defvar *savefile-dir* (expand-file-name "savefile" *root-dir*))
(defvar *themes-dir* (expand-file-name "themes" *root-dir*))

;; create savefile directory if it doesn't exist
(unless (file-exists-p *savefile-dir*)
  (make-directory *savefile-dir*))

(add-to-list 'load-path *core-dir*)
(add-to-list 'load-path *modules-dir*)

(add-to-list 'custom-theme-load-path *themes-dir*)

;; core
(require 'config-packages)
(require 'config-core)
(require 'config-ui)
(require 'config-editor)
(require 'config-keybindings)

;; modules
(require 'config-org)
(require 'config-emacs-lisp)
(require 'config-haskell)
(require 'config-octave)

;; config changes made through the customize UI will be store here
(setq custom-file (expand-file-name "custom.el" *root-dir*)) 

;;; init.el ends here
