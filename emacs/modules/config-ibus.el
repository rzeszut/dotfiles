;;; config-clojure.el --- Ibus config.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 27 Feb 2013
;; Keywords: config, ibus, i18n

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Ibus config.

;;; Code:

(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(ibus-define-common-key ?\C-\s nil)
(ibus-define-common-key ?\C-/ nil)
(global-set-key (kbd "s-i") 'ibus-toggle)

(provide 'config-ibus)
;;; config-ibus.el ends here
