;;; config-markdown.el --- Markdown mode settings.

;; Copyright (C) 2012 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 24 Feb 2013
;; Keywords: config, markdown

;; This file is not part of GNU Emacs.

;;; Commentary:
;; This file configures markdown mode for Emacs.

;;; Code:

(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'config-markdown)
;;; config-markdown.el ends here
