;;; config-latex.el --- Config for writing LaTeX documents.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 25 Feb 2013
;; Keywords: config, latex

;; This file is not part of GNU Emacs.

;;; Commentary:
;; LaTeX config.

;;; Code:

(require 'auctex)

(add-to-list 'ac-modes 'latex-mode)

(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq TeX-view-program-selection
      '((output-dvi "DVI Viewer")
        (output-pdf "PDF Viewer")
        (output-html "HTML Viewer")))

(setq TeX-view-program-(list )
      '(("DVI Viewer" "evince %o")
        ("PDF Viewer" "evince %o")
        ("HTML Viewer" "iceweasel %o")))

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(provide 'config-latex)
;;; config-latex.el ends here
