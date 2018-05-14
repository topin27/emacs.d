(require 'package)
(setq package-enable-at-startup nil)

;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(setq package-archives '(("gnu-china"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("marmalade-china" . "http://elpa.emacs-china.org/marmalade/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(use-package diminish)
(use-package bind-key)

(require 'diminish)
(require 'bind-key)

(add-to-list 'load-path (expand-file-name "lisp" "~/.emacs.d/"))

(require 'init-ui)
(require 'init-basic)
(require 'init-dired)
(require 'init-terminal)
(require 'init-dev)
(require 'init-company)
(require 'init-yasnippet)
(require 'init-python-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-delimiters autopair clean-aindent-mode sr-speedbar idomenu dired ido-vertical-mode use-package smex diminish company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
