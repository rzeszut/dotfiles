(use-package evil-org :ensure t
  :after evil
  :hook (org-mode . evil-org-mode))

(use-package org-bullets :ensure t
  :hook (org-mode . org-bullets-mode))

(provide 'config-org)
