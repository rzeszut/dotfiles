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

(use-package company :ensure t
  :config
  (progn
    (global-company-mode)

    (setq company-idle-delay 0.2)
    ; cycle to the first selection after last
    (setq company-selection-wrap-around t)))

(provide 'config-editor)
