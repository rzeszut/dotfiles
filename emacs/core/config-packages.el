;;; config-packages.el --- Packages selection.

;; Copyright (C) 2012 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config, packages

;; This file is not part of GNU Emacs.

;;; Commentary:
;; This file automatically installs and loads chosen packages using elpa.

;;; Code:

(require 'package)
(require 'config-utils)

;; adds melpa repo
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-user-dir (expand-file-name "elpa" *root-dir*))
(package-initialize)

(defvar *packages*
  '(yasnippet
    undo-tree
    volatile-highlights
    haskell-mode
    markdown-mode
    rainbow-delimiters
    clojure-mode
    clojure-test-mode
    nrepl
    scala-mode2
    org-bullets)
  "A list of packages that need to be installed.")

(defun all-packages-installed-p ()
  "Checks whether all packages are installed."
  (config/all (mapcar #'package-installed-p *packages*)))

(unless (all-packages-installed-p)
  ;; check for new packages
  (message "%s" "Updating package database...")
  (package-refresh-contents)
  (message "%s" "done")
  ;; install missing packages
  (dolist (p *packages*)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'config-packages)
;;; config-packages.el ends here
