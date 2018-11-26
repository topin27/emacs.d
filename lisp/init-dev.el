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

(require 'xcscope)
(setq cscope-do-not-update-database t)
(add-hook 'c-mode-common-hook
	  '(lambda()
	     (cscope-setup)
	     (evil-leader/set-key "g g" 'cscope-find-global-definition-no-prompting)
	     (evil-leader/set-key "g b" 'cscope-pop-mark)
	     (evil-leader/set-key "g c" 'cscope-find-functions-calling-this-function)))

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

(require 'pyvenv)

(require 'company)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(require 'company-anaconda)
(eval-after-load "company"
   '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

(provide 'init-dev)

;;; init-dev ends here
