(use-package org-mode
  :mode "\\.org\\'"
  :init
  (setq org-agenda-files '("~/org/")
        org-todo-keywords '((sequence "TODO" "NEXT" "WAITING" "|" "DONE"))
        org-export-html-postamble nil))

(use-package org-bullets :ensure t
  :hook (org-mode . org-bullets-mode))

(provide 'config-org)
