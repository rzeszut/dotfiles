(use-package company-shell :ensure t
  :hook ((eshell-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-shell company-shell-env))))
         (sh-mode     . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-shell company-shell-env))))))

(provide 'config-shell)
