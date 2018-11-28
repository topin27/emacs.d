;;; init-basic --- 初始化日常操作相关包及绑定

;;; Commentary:

;;; Code:

(cond
 ((string-equal system-type "gnu/linux")
  (setenv "PATH" (concat "~/.local/bin" ":" (getenv "PATH"))))
 ((string-equal system-type "darwin")
  (setenv "PATH" (concat "~/Library/Python/2.7/bin" ":" "/usr/local/bin" ":" (getenv "PATH")))))

(cond
 ((string-equal system-type "gnu/linux")
  (add-to-list 'exec-path "~/.local/bin"))
 ((string-equal system-type "darwin")
  (add-to-list 'exec-path "~/Library/Python/2.7/bin/")
  (add-to-list 'exec-path "/usr/local/bin/")))

(setq make-backup-files nil)
(setq auto-save-default nil)

(winner-mode 1)

;; (setq default-buffer-file-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'dired)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'alway)
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)) ;; lazy-load
(setq dired-dwim-target t)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'projectile)
(projectile-mode +1)
(setq projectile-enable-caching t)
(add-to-list 'projectile-globally-ignored-directories "^\.*")

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(setq smex-save-file (expand-file-name "smex-items" user-emacs-directory))

(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
;; (setq ido-auto-merge-work-directories-length -1)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)
; (setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-show-count t)

(require 'idomenu)

(require 'ztree)

(require 'imenu-list)
(setq imenu-list-auto-resize t)

(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)
(setq evil-default-state 'normal)
(modify-syntax-entry ?_ "w")
(loop for (mode . state) in '((org-mode . normal)
			      (prog-mode . normal)
			      (term-mode . emacs))
      do (evil-set-initial-state mode state))
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'wgrep)
(setq wgrep-auto-save-buffer t)

(provide 'init-basic)

;;; init-basic ends here
