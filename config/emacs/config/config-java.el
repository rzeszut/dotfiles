(use-package lsp-mode :ensure t
  :defer t)

(use-package company-lsp :ensure t
  :after (lsp-mode company)
  :defer t
  :config
  (progn
    (setq company-lsp-async t)))

(use-package lsp-ui :ensure t
  :after lsp-mode
  :defer t
  :hook (lsp-mode . lsp-ui-mode))

(use-package helm-lsp :ensure t
  :after (lsp-mode helm)
  :defer t)

(use-package lsp-java :ensure t
  :after lsp-mode
  :defer t
  :hook ((java-mode . lsp-mode)
         (java-mode . (lambda () (add-to-list (make-local-variable 'company-backends) 'company-lsp)))))

(provide 'config-java)
