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
;; Key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "<f10>") 'rename-buffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defun prelude-smart-open-line (arg)
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode.
With a prefix ARG open line above the current line."
  (interactive "P")
  (if arg
      (prelude-smart-open-line-above)
    (progn
      (move-end-of-line nil)
      (newline-and-indent))))
(global-set-key (kbd "M-o") 'prelude-smart-open-line)

(defun prelude-smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key (kbd "M-O") 'prelude-smart-open-line-above)

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
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; (define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'projectile)
(projectile-mode +1)
(setq projectile-enable-caching t)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
(setq ido-auto-merge-work-directories-length -1) ;; 禁用ido的自动查找功能（在创建新文件时特烦）

(require 'ido-vertical-mode)
(ido-vertical-mode 1)
; (setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-show-count t)

(require 'idomenu)
(global-set-key (kbd "C-c j i") 'idomenu)

(require 'ztree)

(require 'imenu-list)
(global-set-key (kbd "C-\\") 'imenu-list-smart-toggle)
(setq imenu-list-auto-resize t)

(require 'evil)
(evil-mode 1)
(setq evil-default-state 'normal)
(modify-syntax-entry ?_ "w")
(loop for (mode . state) in '((org-mode . normal)
			      (prog-mode . normal)
			      (term-mode . emacs))
      do (evil-set-initial-state mode state))
(define-key evil-normal-state-map (kbd ",") 'ace-jump-mode)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")
(evil-leader/set-key
  "f" 'projectile-find-file
  "b" 'projectile-switch-to-buffer
  ;; "g g" 'xref-find-definitions
  ;; "g b" 'xref-pop-marker-stack
  ;; "g c" 'xref-find-references
  "j i" 'idomenu)

(require 'evil-surround)
(global-evil-surround-mode 1)

(provide 'init-basic)

;;; init-basic ends here
