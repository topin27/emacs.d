(use-package idomenu
  :bind (:map prog-mode-hook
	      ("C-c C-j" . idomenu)))

(use-package linum
  :hook (prog-mode . linum-mode))

(electric-indent-mode -1)

(use-package ace-jump-mode
  :hook (prog-mode . ace-jump-mode)
  :bind ("C-z" . ace-jump-mode))

(use-package sr-speedbar
  :bind ("C-\\" . sr-speedbar-toggle))

(use-package clean-aindent-mode
  :hook (prog-mode . clean-aindent-mode))

(use-package autopair
  :hook (prog-mode . autopair-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-dev)

