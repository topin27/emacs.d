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

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
	"~/.emacs.d/site-lisp/yasnippet-snippets/snippets" ;; the yasnippet-snippets collection
        ))
(yas-global-mode 1)
(yas-minor-mode-on)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)

(require 'company)
(setq company-show-numbers t
      company-idle-delay 0.1)
(eval-after-load "company"
  '(setq company-backends (delete 'company-eclim (delete 'company-xcode company-backends))))
;; (eval-after-load "company"
(add-hook 'after-init-hook 'global-company-mode)
;;   '(setq company-backends
;; 	 '(company-dabbrev
;; 	    company-dabbrev-code)
;; 	   (company-files
;; 	    company-keywords
;; 	    company-capf
;; 	    company-etags))))
(require 'company-yasnippet)

(require 'cython-mode)
(setq auto-mode-alist
      (cons '(".pyx" . cython-mode) auto-mode-alist))

(provide 'init-dev)

;;; init-dev ends here
