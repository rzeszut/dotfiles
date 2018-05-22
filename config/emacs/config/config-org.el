(use-package org-mode
  :mode "\\.org\\'"
  :init
  (setq org-agenda-files '("~/org/")
        org-todo-keywords '((sequence "TODO" "NEXT" "WAITING" "|" "DONE"))))

(use-package org-bullets :ensure t
  :hook (org-mode . org-bullets-mode))

(provide 'config-org)
