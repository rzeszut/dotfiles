;;; config-scheme.el --- Scheme config.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 16 May 2013
;; Keywords: config, lisp, scheme

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Scheme config file.

;;; Code:

(require 'config-lisp)

(setq scheme-program-name "guile")

(add-hook 'scheme-mode-hook 'config/lisp-hook)

(provide 'config-scheme)
;;; config-scheme.el ends here
