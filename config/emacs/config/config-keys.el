(defconst *leader-key* "<SPC>")

(use-package general :ensure t
  :after evil helm
  :config
  (progn
    (general-evil-setup)

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

      ; files
      "f w"   'evil-write
      "f f"   'helm-find-files
      "f g"   'helm-grep-do-git-grep

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
      "b p"   'evil-prev-buffer)))


(provide 'config-keys)
