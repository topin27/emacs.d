(use-package shell
  :config
  (progn
    (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
    (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
    (setq shell-file-name "/bin/bash")))

(use-package term
  :bind ("C-c t" . term))

(provide 'init-terminal)
