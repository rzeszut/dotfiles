(require 'ruby-tools)
(require 'ruby-end)
(require 'rinari)
(require 'rhtml-mode)

(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))

(setq rinari-tags-file-name "TAGS")

(defun config/ruby-hook ()
  (ruby-tools-mode +1)
  (subword-mode +1))

(add-hook 'ruby-mode-hook 'config/ruby-hook)
(add-hook 'rhtml-mode-hook (lambda ()
                             (rinari-launch)))

(provide 'config-ruby)
