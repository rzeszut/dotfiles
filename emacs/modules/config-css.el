;;; config-css.el --- CSS config.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 2 Apr 2013
;; Keywords: config, css

;; This file is not part of GNU Emacs.

;;; Commentary:
;; CSS config.

;;; Code:

(require 'less-css-mode)

(add-to-list 'ac-modes 'less-css-mode)

(defun config/less-css-mode
  (setq ac-sources (append '(ac-source-css-property ac-source-yasnippet) ac-sources)))

(add-hook 'less-css-mode 'config/less-css-mode)

(provide 'config-css)
;;; config-css.el ends here
