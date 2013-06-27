;;; bnf-mode.el --- Simple BNF mode for Emacs.

;; Copyright (C) 2013 Mateusz Rzeszutek

;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 20 May 2013
;; Keywords: mode, bnf, languages

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Simple Backus-Naur Form mode for Emacs.

;;; Code:

(define-generic-mode 'bnf-mode
  () ;; comment char: inapplicable because # must be at start of line
  nil ;; keywords
  '(
    ("^#.*" . 'font-lock-comment-face) ;; comments at start of line
    ("^<[^\t\n]*?>" . 'font-lock-function-name-face) ;; LHS nonterminals
    ("<[^\t\n]*?>" . 'font-lock-builtin-face) ;; other nonterminals
    ("::=" . 'font-lock-warning-face) ;; "goes-to" symbol
    ("\|" . 'font-lock-warning-face) ;; "OR" symbol
    ("[*+]" . 'font-lock-warning-face)
    ("\\.\\.\\." . 'font-lock-string-face)
    )
  '("\\.bnf$") ;; filename suffixes
  `(,(lambda () (setq mode-name "BNF")))
  "Major mode for BNF highlighting.")

(provide 'bnf-mode)
;;; bnf-mode.el ends here
