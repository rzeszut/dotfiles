;; Basic
(defvar *root-dir* "~/.emacs.d")
;;; Make emacs write all generated code to custom.el file
(setq custom-file (expand-file-name "custom.el" *root-dir*))

;; Package management
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package)
  (require 'use-package))

;; Editor
;;; No tabs, only spaces
(setq-default
 indent-tabs-mode nil
 tab-width 4)

;;; Vim simulation
(defun evil/prepend-line ()
  (interactive)
  (evil-normal-state)
  (evil-insert-newline-above)
  (evil-insert-state))

(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char)
  (define-key evil-insert-state-map (kbd "C-k") 'evil/prepend-line)
  ; C-j is set by default
  (define-key evil-insert-state-map (kbd "C-l") 'evil-delete-char))

(use-package evil-leader
  :ensure t
  :after evil
  :config
  (global-evil-leader-mode t)
  (evil-leader/set-leader ",")
  (evil-leader/set-key "q" `evil-quit)
  (evil-leader/set-key "w" `evil-write-all))

(use-package evil-org
  :ensure t
  :after org evil
  :config
  (add-hook 'org-mode-hook 'evil-org-mode))

;;; Auto-closing parenthesis
(use-package rainbow-mode
  :ensure t
  :config
  (electric-pair-mode t))

;; UI
(use-package darcula-theme
  :ensure t
  :config
  (load-theme 'darcula t))
