;;; config-haskell.el --- Config for haskell.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config, haskell

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Simple haskell config.

;;; Code:

(require 'config-programming)
(require 'haskell-mode)

(add-hook 'haskell-mode-hook (lambda ()
                               (subword-mode +1)
                               (turn-on-haskell-indentation)
                               (turn-on-haskell-doc-mode)))

(setq haskell-font-lock-symbols 'unicode)

(define-key haskell-mode-map (kbd "C-c v") 'inferior-haskell-load-file)

(provide 'config-haskell)
;;; config-haskell.el ends here
