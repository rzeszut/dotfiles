;;; config-org.el --- Orgmode configuration.

;; Copyright (C) 2012 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: orgmode, org

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Basic configuration for org-mode.

;;; Code:

(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'config-org)
;;; config-org.el ends here
