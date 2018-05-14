(use-package rust-mode :ensure t
  :mode "\\.rs\\'")

(use-package cargo :ensure t
  :after (rust-mode)
  :hook (rust-mode . cargo-minor-mode))

(use-package racer :ensure t
  :after (rust-mode)
  :hook (rust-mode . racer-mode)
  :config
  (setq racer-cmd "~/.cargo/bin/racer"
        racer-rust-src-path "~/tmp/rustsrc/rust-lang/src"))

(provide 'config-rust)
