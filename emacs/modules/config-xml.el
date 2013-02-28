;;; config-xml.el --- Config for xml editing.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: config, xml

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Simple xml editing config.

;;; Code:

(push '("<\\?xml" . nxml-mode) magic-mode-alist)
(add-to-list 'auto-mode-alist '("\\.pom$" . nxml-mode))

(setq nxml-attribute-indent 4)
(setq nxml-child-indent 4)
(setq nxml-auto-insert-xml-declaration-flag t)
(setq nxml-bind-meta-tab-to-complete-flag t)
(setq nxml-slash-auto-complete-flag t)

(provide 'config-xml)
;;; config-xml.el ends here
