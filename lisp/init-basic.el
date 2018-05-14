(cond
 ((string-equal system-type "gnu/linux")
  (setenv "PATH" (concat "~/.local/bin" ":" (getenv "PATH")))
  )
 ((string-equal system-type "darwin")
  (setenv "PATH" (concat "~/Library/Python/2.7/bin" ":" (getenv "PATH")))
  )
 )

(use-package smex
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)
	 ("C-c C-c M-x" . execute-extended-command))
  :config (smex-initialize))

(setq make-backup-files nil)
(setq auto-save-default nil)

(winner-mode 1)

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

(global-set-key (kbd "RET") 'newline-and-indent)

(use-package ido
  :config
  (ido-mode 1)
  :init
  (progn
    (setq ido-enable-flex-matching t)
    ;; (setq ido-use-filename-at-point 'guess)
    (setq ido-everywhere t)
    (setq ido-auto-merge-work-directories-length -1))
  :bind (("C-x b" . ido-switch-buffer)
	 ("C-x B" . ido-switch-buffer-other-window)))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode 1)
  :init
  (setq ido-vertical-show-count t))

(use-package electric-indent-mode
  :disabled t)

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package projectile
  :config
  (projectile-global-mode)
  :diminish
  :bind-keymap ("C-c p" . projectile-command-map))

(global-set-key (kbd "<f10>") 'rename-buffer)

(provide 'init-basic)
