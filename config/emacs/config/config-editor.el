;; Always follow symlinks
(setq vc-follow-symlinks t)

;; No tabs, only spaces
(setq-default
 indent-tabs-mode nil
 tab-width 4)

(fset 'yes-or-no-p 'y-or-n-p)

;; Auto-closing parenthesis
(use-package rainbow-mode :ensure t
  :config
  (electric-pair-mode t))

;; Use helm for completion window
(use-package helm :ensure t
  :config
  (progn
    ; open helm in current window
    (setq helm-split-window-in-side-p t)

    ; autoresize
    (setq helm-autoresize-max-height 40
          helm-autoresize-min-height 20)
    (helm-autoresize-mode 1)

    ; ignore backup files
    (setq helm-ff-skip-boring-files t)
    (add-to-list 'helm-boring-file-regexp-list "~$")

    (helm-mode t)))

;; Auto completion
(use-package company :ensure t
  :defer 2
  :config
  (progn
    (global-company-mode)

    (setq company-idle-delay 0.2)
    ; cycle to the first selection after last
    (setq company-selection-wrap-around t)))

;; Syntax checking in programming languages
(use-package flycheck :ensure t
  :hook (prog-mode . flycheck-mode)
  :config
  (progn
    ; TODO: maybe move it somewhere else? manually define checkers or what not
    (setq flycheck-checkers (delete 'emacs-lisp-checkdoc flycheck-checkers))))

;; File manager
(use-package treemacs :ensure t
  :commands (treemacs)
  :bind (:map treemacs-mode-map ([mouse-1] . treemacs-single-click-expand-action))
  :config
  (progn
    (setq treemacs-silent-refresh t
          treemacs-silent-filewatch t
          treemacs-project-follow-cleanup t
          treemacs-python-executable (executable-find "python3"))

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-git-mode 'deferred)))

(use-package treemacs-evil :ensure t
  :after (treemacs evil))

(use-package treemacs-magit :ensure t
  :after (treemacs magit))

(provide 'config-editor)
