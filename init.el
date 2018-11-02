;;; init --- Initialize.

;;; Commentary:
;; 

;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/diminish" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/ace-jump-mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/undo-tree" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/projectile" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/smex" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/ido-vertical-mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/idomenu" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/ztree" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/evil" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/evil-leader" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/evil-surround" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/imenu-list" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/rainbow-delimiters" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/clean-aindent-mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/flycheck" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/markdown-mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/dash" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/company" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/f" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/s" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/pythonic" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/anaconda-mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/company-anaconda" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/xcscope" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/yasnippet" user-emacs-directory))

(setq user-full-name "Yang Tianping")
(setq user-mail-address "yangtianpingytp@163.com")

(require 'init-ui)
(require 'init-basic)
(require 'init-dev)
(require 'init-org)

(provide 'init)
;;; init.el ends here
