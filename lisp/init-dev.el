;;; init-dev --- 和开发相关的配置

;;; Commentary:

;;; Code:

(require 'electric)
(electric-pair-mode t)
(electric-indent-mode t)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

(add-hook 'c-mode-common-hook
	  '(lambda()
	     (require 'xcscope)
	     (setq cscope-do-not-update-database t)
	     (cscope-setup)))

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
	"~/.emacs.d/site-lisp/yasnippet-snippets/snippets" ;; the yasnippet-snippets collection
        ))
;; (yas-global-mode 1)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load "company"
  '(setq company-backends (delete 'company-eclim (delete 'company-xcode company-backends))))
;; (eval-after-load "company"
;;   '(setq company-backends
;; 	 '((company-dabbrev
;; 	    company-dabbrev-code)
;; 	   (company-files
;; 	    company-keywords
;; 	    company-capf
;; 	    company-etags))))
(setq company-show-numbers t
      company-idle-delay 0.2)
(require 'company-yasnippet)
(global-set-key (kbd "C-c y") 'company-yasnippet)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'lsp-mode)
(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

(require 'company-lsp)
(add-hook 'python-mode-hook
	  '(lambda ()
	     (push 'company-lsp company-backends)))

(require 'pyvenv)
(require 'lsp-python)
(add-hook 'python-mode-hook #'lsp-python-enable)

(provide 'init-dev)

;;; init-dev ends here
