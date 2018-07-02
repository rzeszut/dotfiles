(use-package magit :ensure t
  :defer 2)

(use-package evil-magit :ensure t
  :after (evil magit))

(provide 'config-git)
