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
      "w"     'evil-write-all
      "<SPC>" 'helm-M-x
      "b"     'helm-mini
      "f"     'helm-find-files)))


(provide 'config-keys)
