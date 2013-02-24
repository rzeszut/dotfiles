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

(defvar *root-dir* "~/.emacs.d"
  "Root directory of emacs config.")
(defvar *core-dir* (expand-file-name "core" *root-dir*)
  "Contains core modules.")
(defvar *modules-dir* (expand-file-name "modules" *root-dir*)
  "Contains additional modes, mainlt programming languages modes.")
(defvar *snippets-dir* (expand-file-name "snippets" *root-dir*)
  "Contains additional yasnippet snippets.")
(defvar *savefile-dir* (expand-file-name "savefile" *root-dir*)
  "Stores all the automatically generated history/save files.")
(defvar *themes-dir* (expand-file-name "themes" *root-dir*)
  "Contains theme files.")
(defvar *vendor-dir* (expand-file-name "vendor" *root-dir*)
  "Contains packages not available in (M)ELPA.")

;; create savefile directory if it doesn't exist
(unless (file-exists-p *savefile-dir*)
  (make-directory *savefile-dir*))

(defun config/add-subfolders-to-load-path (parent-dir)
  "Adds all first level `parent-dir' subdirs to the
Emacs load path. Borrowed from prelude."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(add-to-list 'load-path *core-dir*)
(add-to-list 'load-path *modules-dir*)
(add-to-list 'load-path *vendor-dir*)
(config/add-subfolders-to-load-path *vendor-dir*)

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
(require 'config-markdown)

;; config changes made through the customize UI will be store here
(setq custom-file (expand-file-name "custom.el" *root-dir*)) 

;;; init.el ends here
