;;; init-ui --- 界面相关的设置

;;; Commentary:

;;; Code:

(global-font-lock-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(column-number-mode t)
(line-number-mode t)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

(delete-selection-mode t) ;; inserting text while the mark is active causes the selected text to be deleted first
(transient-mark-mode 1)
(setq select-enable-clipboard t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(setq cursor-type 'bar)

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(if (not (display-graphic-p))
    (progn
      (xterm-mouse-mode t)
      (menu-bar-mode -1))
  (progn
    ;; (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)))

(which-function-mode -1)
(add-hook 'prog-mode-hook 'linum-mode)

(require 'diminish)
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "company" '(diminish 'company-mode))
;; (diminish 'projectile-mode)

(provide 'init-ui)

;;; init-ui ends here
