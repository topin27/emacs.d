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
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)"))
      org-todo-keyword-faces '(("DOING" . (:foreground "cyan" :weight bold))))
(setq org-src-fontify-natively t)

(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/Workspace/wiki/"
         :base-extension "org"
         :publishing-directory "~/Workspace/src/topin27.github.io/"
         :recursive t
         ;; :publishing-function org-publish-org-to-html
	 :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )
        ("org-static"
         :base-directory "~/Workspace/wiki/static/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Workspace/src/topin27.github.io/static/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))
	))

(provide 'init-org)

;;; init-org ends here
