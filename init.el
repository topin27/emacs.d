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

;; =============================================================
;; UI
;; =============================================================

(global-font-lock-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(column-number-mode t)
(line-number-mode t)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(if (not (display-graphic-p))
    (progn
      (xterm-mouse-mode t)
      (menu-bar-mode -1))
  (progn
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)))

;; =============================================================
;; BASIC STUFF
;; =============================================================

(cond
 ((string-equal system-type "gnu/linux")
  (setenv "PATH" (concat "~/.local/bin" ":" (getenv "PATH"))))
 ((string-equal system-type "darwin")
  (setenv "PATH" (concat "~/Library/Python/2.7/bin" ":" "/usr/local/bin" ":" (getenv "PATH")))))

(use-package smex
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)
	 ("C-c C-c M-x" . execute-extended-command))
  :config (smex-initialize))

(setq make-backup-files nil)
(setq auto-save-default nil)

(winner-mode 1)

(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

(global-set-key (kbd "RET") 'newline-and-indent)

(use-package ido
  :config
  (ido-mode 1)
  :init
  (progn
    (setq ido-enable-flex-matching t)
    ;; (setq ido-use-filename-at-point 'guess)
    (setq ido-everywhere t)
    (setq ido-auto-merge-work-directories-length -1))
  :bind (("C-x b" . ido-switch-buffer)
	 ("C-x B" . ido-switch-buffer-other-window)))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode 1)
  :init
  (setq ido-vertical-show-count t))

(use-package electric-indent-mode
  :disabled t)

(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode))

(use-package projectile
  :config
  (projectile-global-mode)
  :diminish
  :bind-keymap ("C-c p" . projectile-command-map))

(global-set-key (kbd "<f10>") 'rename-buffer)

(use-package ztree)

(use-package which-key
  :config
  (which-key-mode))

;; =============================================================
;; SYSTEM
;; =============================================================

(use-package shell
  :config
  (progn
    (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
    (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
    (setq shell-file-name "/bin/bash")))

(use-package term
  :bind ("C-c t" . term))

(require 'dired)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'alway)
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)) ;; lazy-load
(setq dired-dwim-target t)

(cond
 ((string-equal system-type "gnu/linux")
  (add-to-list 'exec-path "~/.local/bin"))
 ((string-equal system-type "darwin")
  (add-to-list 'exec-path "/usr/local/bin")
  (add-to-list 'exec-path "~/Library/Python/2.7/bin/")))

;; =============================================================
;; DEV
;; =============================================================

(use-package company
  :config
  (global-company-mode)
  (setq company-backends (delete 'company-xcode company-backends))
  (setq company-show-numbers t
	company-idle-delay 0.2))

(use-package idomenu
  :config (semantic-mode t)
  :bind (:map prog-mode-hook
	      ("C-c C-j" . idomenu)))

(electric-indent-mode -1)

(use-package ace-jump-mode
  :bind ("C-z" . ace-jump-mode))

;; (use-package evil
;;   :init
;;   (setq evil-default-state 'emacs)
;;   (setq evil-want-C-i-jump nil)
;;   (evil-mode 1)
;;   :commands evil-mode
;;   :config
;;   (modify-syntax-entry ?_ "w")
;;   (add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;;   (loop for (mode . state) in '((python-mode . normal)
;; 				(emacs-lisp-mode . normal)
;; 				(c-common-mode . normal)
;; 				(markdown-mode . normal)
;; 				(org-mode . emacs)
;; 				(term-mode . emacs))
;; 	do (evil-set-initial-state mode state)))

;; (use-package evil-leader
;;   :config
;;   (global-evil-leader-mode)
;;   (evil-leader/set-leader "<SPC>")
;;   (evil-leader/set-key
;;    "w" 'ace-jump-mode
;;    "j i" 'idomenu))

(use-package sr-speedbar
  :bind ("C-\\" . sr-speedbar-toggle))

(use-package clean-aindent-mode
  :hook (prog-mode . clean-aindent-mode))

(use-package autopair
  :diminish
  :hook (prog-mode . autopair-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package yasnippet
  :after prog-mode
  :diminish yas-minor-mode
  ;; :bind (("C-c y d" . yas-load-directory)
  ;;        ("C-c y i" . yas-insert-snippet)
  ;;        ("C-c y f" . yas-visit-snippet-file)
  ;;        ("C-c y n" . yas-new-snippet)
  ;;        ("C-c y t" . yas-tryout-snippet)
  ;;        ("C-c y l" . yas-describe-tables)
  ;;        ("C-c y g" . yas/global-mode)
  ;;        ("C-c y m" . yas/minor-mode)
  ;;        ("C-c y a" . yas-reload-all)
  ;;        ("C-c y x" . yas-expand))
  ;; :bind (:map yas-keymap
  ;;             ("C-i" . yas-next-field-or-maybe-expand))
  :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
  :config
  (yas-global-mode 1))

(use-package python-mode
  :mode "\\.py\\'"
  :interpreter "python"
  :config
  (flymake-mode -1)
  :bind (:map python-mode-map
	      ("C-c c")
	      ("C-c C-z" . python-shell)))

(use-package pyvenv)

(use-package elpy
  :after company
  :init
  (setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
  :config
  (elpy-enable))

;; (use-package magit
;;   :bind (("C-x g" . magit-status)
;; 	 ("C-x G" . magit-status-with-prefix)))

;; =============================================================
;; WRITING & DOC
;; =============================================================

(use-package org
  :config
  (add-hook 'org-mode-hook
	    (lambda ()
	      (flyspell-mode -1)
	      (toggle-truncate-lines -1)))
  :bind (("C-c o c" . org-capture)
	 ("C-c o a" . org-agenda)
	 ("C-c o l" . org-store-link))
  :init
  (setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)"))
	org-todo-keyword-faces '(("DOING" . (:foreground "cyan" :weight bold)))))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  ;; :mode (("README\\.md\\" . gfm-mode)
  ;; 	 ("\\.md\\'" . markdown-mode)
  ;; 	 ("\\.markdown\\'" . markdown-mode)
  ;; 	 ("\\.mkd\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;; ** AUTO GENERATED CODE BELOW **
