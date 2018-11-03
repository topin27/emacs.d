;;; init-org --- 写作相关的设置

;;; Commentary:

;;; Code:

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(add-hook 'org-mode-hook
    (lambda ()
      (flyspell-mode -1)
      (toggle-truncate-lines -1)))
(setq org-html-postamble nil)
(global-set-key (kbd "C-c o c") 'org-capture)
(global-set-key (kbd "C-c o a") 'org-agenda)
(global-set-key (kbd "C-c o l") 'org-store-link)
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)"))
      org-todo-keyword-faces '(("DOING" . (:foreground "cyan" :weight bold))))

(provide 'init-org)

;;; init-org ends here
