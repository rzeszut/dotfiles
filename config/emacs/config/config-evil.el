(use-package evil :ensure t
  :config
  (progn
    (evil-mode t)

    (defun config/evil-prepend-line ()
      "Evil mode: adds a new line above, considering indentation."
      (interactive)
      (evil-normal-state)
      (evil-previous-line)
      (evil-append-line 1)
      (newline-and-indent))

    (defun config/evil-append-line ()
      "Evil mode: adds a new line below, considering indentation."
      (interactive)
      (newline-and-indent))

    (defun config/evil-window-left ()
      "Evil window management: change active window to the one on the left"
      (interactive)
      (evil-window-left 1))
    (defun config/evil-window-down ()
      "Evil window management: change active window to the one down"
      (interactive)
      (evil-window-down 1))
    (defun config/evil-window-up ()
      "Evil window management: change active window to the one up"
      (interactive)
      (evil-window-up 1))
    (defun config/evil-window-right ()
      "Evil window management: change active window to the one right"
      (interactive)
      (evil-window-right 1))))

(use-package evil-numbers :ensure t
  :after (evil))

(provide 'config-evil)
