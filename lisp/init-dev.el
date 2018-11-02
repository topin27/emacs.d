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

(require 'pythonic)

(require 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

(require 'xcscope)
(cscope-setup)

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
	"~/.emacs.d/site-lisp/yasnippet-snippets/snippets" ;; the yasnippet-snippets collection
        ))
(yas-global-mode 1)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load "company"
  '(setq company-backends (delete 'company-eclim (delete 'company-xcode company-backends))))
(setq company-show-numbers t
      company-idle-delay 0.2)
(global-set-key (kbd "C-c y") 'company-yasnippet)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-dev)

;;; init-dev ends here
