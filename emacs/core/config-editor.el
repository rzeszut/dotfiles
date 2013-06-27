;;; config-editor.el --- Base editing config.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config, editor

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Core functions.

;;; Code:

;; no tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; delete the selection with a keypress
(delete-selection-mode t)
;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" , temporary-file-directory t)))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; abbrev config
(add-hook 'text-mode-hook 'abbrev-mode)

;; auto closing parens, braces, etc.
(electric-pair-mode t)

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-separator ":")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; saveplace remembers your location in a file when saving files
(setq save-place-file (expand-file-name "saveplace" *savefile-dir*))
;; activate it for all buffers
(setq-default save-place t)
(require 'saveplace)

;; savehist keeps track of some history
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (expand-file-name "savehist" *savefile-dir*))
(savehist-mode t)

;; save recent files
(setq recentf-save-file (expand-file-name "recentf" *savefile-dir*)
      recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode t)

;; bookmarks
(setq bookmark-default-file (expand-file-name "bookmarks" *savefile-dir*)
      bookmark-save-flag 1)

;; show-paren-mode: subtle highlighting of matching parens (global-mode)
(show-paren-mode +1)
(setq show-paren-style 'parenthesis)

;; highlight the current line
(global-hl-line-mode +1)

;; highlights things like undoed, copied, yanked text, etc.
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; undo tree
(global-undo-tree-mode)

;; ido
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" *savefile-dir*)
      ido-default-file-method 'selected-window)

;; incremental auto-completion in minibuffer
(icomplete-mode t)

;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)

;; yasnippet
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs *snippets-dir*)
(yas-global-mode 1)

;; autocomplete
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-comphist-file (expand-file-name "ac-comphist.dat" *savefile-dir*))

;; eshell
(require 'eshell)
(setq eshell-directory-name (expand-file-name "eshell" *savefile-dir*))

;; minimap
(require 'minimap)

;; tramp settings
(setq tramp-default-method "ssh")

(provide 'config-editor)
;;; config-editor.el ends here
