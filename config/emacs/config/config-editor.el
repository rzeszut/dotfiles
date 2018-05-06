;; Always follow symlinks
(setq vc-follow-symlinks t)

;; No tabs, only spaces
(setq-default
 indent-tabs-mode nil
 tab-width 4)

;; Auto-closing parenthesis
(use-package rainbow-mode :ensure t
  :config
  (electric-pair-mode t))

;; Use helm for completion
(use-package helm :ensure t
  :config
  (helm-mode t))

(provide 'config-editor)
