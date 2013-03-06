;;; config-python.el --- Python programming config

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 6 Mar 2013
;; Keywords: config, python, programming

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Python programming config.

;;; Code:

(setq jedi:setup-keys t)

(require 'config-programming)
(require 'python)
(require 'jedi)

(add-hook 'python-mode-hook (lambda ()
                              (jedi:setup)
                              (electric-indent-mode -1)))

(setq jedi:key-complete (kbd "M-TAB"))
(setq jedi:key-goto-definition (kbd "M-."))

(provide 'config-python)
;;; config-python.el ends here
