;;; config-scala.el --- Config for Scala programming.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 27 Feb 2013
;; Keywords: config, programming, scala

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Scala config.

;;; Code:

(require 'config-programming)
(require 'scala-mode2)

(defun config/scala-hook ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "C-M-j") 'join-line)
  (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)
  (subword-mode +1))

(add-hook 'scala-mode-hook 'config/scala-hook)

(setq scala-indent:indent-value-expression t)
(setq scala-indent:align-parameters t)
(setq scala-indent:align-forms t)

(provide 'config-scala)
;;; config-scala.el ends here
