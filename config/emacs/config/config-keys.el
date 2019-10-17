(defconst *leader-key* "<SPC>")

(use-package general :ensure t
  :after evil helm
  :config
  (progn
    (general-evil-setup)

    ; emacs compatibility
    (general-define-key
      "M-x" 'helm-M-x)

    (general-imap
      "C-h" 'evil-delete-backward-char
      "C-j" 'config/evil-append-line
      "C-k" 'config/evil-prepend-line
      "C-l" 'evil-delete-char)

    (general-nmap
      "C-h" 'config/evil-window-left
      "C-j" 'config/evil-window-down
      "C-k" 'config/evil-window-up
      "C-l" 'config/evil-window-right)

    (general-nmap
      :prefix *leader-key*
      "q"     'evil-quit
      ; TODO: preferably this should run a multi-source search
      "<SPC>" 'helm-M-x
      "a"     'org-agenda

      ; files
      "f w"   'evil-write
      "f f"   'helm-find-files
      "f g"   'helm-grep-do-git-grep
      "f t"   'treemacs

      ; git
      "g s"   'magit-status
      "g c"   'magit-commit

      ; window management
      "w v"   'evil-window-vsplit
      "w s"   'evil-window-split
      "w h"   'config/evil-window-left
      "w j"   'config/evil-window-down
      "w k"   'config/evil-window-up
      "w l"   'config/evil-window-right

      ; buffers
      "b b"   'helm-mini
      "b n"   'evil-next-buffer
      "b p"   'evil-prev-buffer)

    ; escape quits helm
    (general-define-key
     :keymaps 'helm-map
     [escape] 'helm-keyboard-quit)

    ; company mini window key bindings
    (general-define-key
     :keymaps 'company-active-map
     [tab]    'company-complete
     "C-n"    'company-select-next
     "C-p"    'company-select-previous)

    ; org mode
    (general-nmap
      :keymaps  'org-mode-map
      "t"       'org-todo
      "C-<SPC>" 'org-toggle-checkbox
      "^"       'org-beginning-of-line
      "$"       'org-end-of-line
      ">"       'org-shiftmetaright
      "<"       'org-shiftmetaleft)
    (general-nmap
      :keymaps 'org-mode-map
      :prefix  *leader-key*
      "e s"    'org-edit-src-code
      "O"      'org-insert-heading
      "o"      'org-insert-heading-after-current
      "s"      'org-schedule)
    (general-nmap
      :keymaps 'org-src-mode-map
      :prefix  *leader-key*
      "e q"    'org-edit-src-exit)

    ; elisp mode                                    ;
    (general-nmap
      :keymaps 'emacs-lisp-mode-map
      :prefix  *leader-key*
      "e e"    'eval-last-sexp
      "e r"    'eval-region
      "e b"    'eval-buffer)))

(provide 'config-keys)
