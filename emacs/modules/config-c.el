(require 'config-programming)
(require 'cc-mode)
(require 'cedet)
(require 'semantic)

;; Semantic
;(global-semantic-idle-completions-mode t)
;(global-semantic-decoration-mode t)
;(global-semantic-highlight-func-mode t)
;(global-semantic-show-unmatched-syntax-mode t)

(defun config/c-mode-hook ()
  (c-set-style "java")
  (setq c-basic-offset 4)
  (c-toggle-hungry-state 1)
; (add-to-list 'ac-sources 'ac-source-semantic)
; (semantic-mode t)
  )

(add-hook 'c-mode-common-hook 'config/c-mode-hook)

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(provide 'config-c)
