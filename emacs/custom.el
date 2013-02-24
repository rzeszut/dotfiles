(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-font-lock-symbols (quote unicode))
 '(haskell-mode-hook
   (quote (capitalized-words-mode
           turn-on-haskell-decl-scan
           (lambda nil
             (subword-mode 1)
             (turn-on-haskell-indentation)
             (turn-on-haskell-doc-mode))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
