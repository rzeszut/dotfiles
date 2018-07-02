(defconst *root-dir* "~/.emacs.d")
(defconst *config-dir* (expand-file-name "config" *root-dir*))

;; Package management
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(eval-when-compile
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
    (require 'use-package)))

;; Add custom configs to load path
(add-to-list 'load-path *config-dir*)

(require 'config-editor)
(require 'config-evil)
(require 'config-keys)
(require 'config-ui)
(require 'config-org)
(require 'config-rust)
(require 'config-yaml)
(require 'config-adoc)
(require 'config-git)

;; Make emacs write all generated code to custom.el file
(setq custom-file (expand-file-name "custom.el" *root-dir*))
