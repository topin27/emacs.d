(use-package company
  :diminish company-mode
  :config
  (global-company-mode)
  (setq company-show-numbers t)
  (setq company-idle-delay 0.2)
  (setq company-backends (delete 'company-eclim (delete 'company-xcode company-backends))))

(provide 'init-company)
