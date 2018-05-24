(use-package badger-theme :ensure t
  :config
  (load-theme 'badger t))

;; remove toolbar, menubar, scrollbars
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; disable startup screen
(setq inhibit-startup-screen t)

;; smooth scrolling
(setq scroll-margin 5
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; set frame title
(setq frame-title-format "emacs - %b")

;; smaller fringes (margins on the side of the screen)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

(show-paren-mode t)

(provide 'config-ui)
