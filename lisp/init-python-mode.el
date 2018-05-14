(use-package company-jedi
  :after company
  :config
  (add-hook 'python-mode-hook '(add-to-list 'company-backends 'company-jedi)))

(use-package python-mode
  :mode "\\.py\\'"
  :interpreter "python"
  :bind (:map python-mode-map
	      ("C-c c")
	      ("C-c C-z" . python-shell)))

(provide 'init-python-mode)
