(use-package evil-org :ensure t
  :after org evil
  :config
  (add-hook 'org-mode-hook 'evil-org-mode))

(use-package org-bullets :ensure t
  :config
  (add-hook 'org-mode-hook
            (lambda () (org-bullets-mode 1))))

(provide 'config-org)
