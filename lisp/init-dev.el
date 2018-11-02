(require 'electric)
(electric-pair-mode t)
(electric-indent-mode t)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load "company"
  '(setq company-backends (delete 'company-eclim (delete 'company-xcode company-backends))))
(setq company-show-numbers t
      company-idle-delay 0.2)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook
	  (lambda ()
	    (add-to-list 'company-backends 'company-anaconda)
	    ;; (push 'company-anaconda company-backends)
	    (local-set-key (kbd "<f5>") 'anaconda-mode-find-definitions)
	    (local-set-key (kbd "<f6>") 'anaconda-mode-go-back)))

(require 'magit)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-dev)
