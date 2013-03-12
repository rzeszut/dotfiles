;;; config-erc.el --- Emacs IRC configuration.

;; Copyright (C) 2012 Mateusz Rzeszutek
     
;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 10 Mar 2013
;; Keywords: irc

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Basic configuration for ERC.

;;; Code:

(defun erc-freenode ()
  "Connect to the freenode server."
  (interactive)
  (erc :server "irc.freenode.net" :port 8001 :nick "rzeszut"))

;; logging setttings
(setq erc-log-insert-log-on-open nil
      erc-log-channels t
      erc-log-channels-directory "~/.irclogs/"
      erc-save-buffer-on-part t
      erc-hide-timestamps nil)

(defadvice save-buffers-kill-emacs
  (before save-logs (arg) activate)
  (save-some-buffers t (lambda ()
                         (and (eq major-mode 'erc-mode)
                              (not (null buffer-file-name))))))

;; max buffer size
(setq erc-max-buffer-size 20000)

;; timestamps
(make-variable-buffer-local
 (defvar erc-last-datestamp nil))

(defun config/erc-timestamp (string)
  (erc-insert-timestamp-left string)
  (let ((datestamp (erc-format-timestamp (current-time) erc-datestamp-format)))
    (unless (string= datestamp erc-last-datestamp)
      (erc-insert-timestamp-right datestamp)
      (setq erc-last-datestamp datestamp))))

(setq erc-hide-timestamps nil
      erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "[%H:%M] "
      erc-datestamp-format "[%a, %e %b %Y]"
      erc-fill-prefix      "        "
      erc-insert-timestamp-function 'erc-insert-timestamp-left)

(provide 'config-erc)
;;; config-erc.el ends here
