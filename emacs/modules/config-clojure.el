;;; config-clojure.el --- Config for clojure programming.

;; Copyright (C) 2013 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 25 Feb 2013
;; Keywords: config, lisp, clojure

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Clojure config.

;;; Code:

(require 'config-lisp)
(require 'clojure-mode)
(require 'clojure-test-mode)
(require 'nrepl)

(add-hook 'clojure-mode-hook (lambda ()
                               (subword-mode +1)
                               (clojure-test-mode +1)
                               (config/lisp-hook)))

(setq nrepl-lein-command "~/bin/lein")

(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook (lambda ()
                             (subword-mode +1)
                             (config/lisp-interactive-hook)))

(defun config/open-nrepl ()
  "Splits a window and opens nrepl. Calls nrepl-jack-in
if a nrepl instance doesn't already exist."
  (interactive)
  (if (not (get-buffer "*nrepl*"))
      (nrepl-jack-in)
    (switch-to-buffer-other-window "*nrepl*")))

(define-key clojure-mode-map (kbd "C-c C-z") 'config/open-nrepl)

(provide 'config-clojure)
;;; config-clojure.el ends here
