(use-package magit :ensure t
  :commands (magit-status magit-commit)
  :defer 2)

(use-package evil-magit :ensure t
  :after (evil magit))

(provide 'config-git)
