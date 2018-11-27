;;; init-keymap --- 初始化键盘绑定相关

;;; Commentary:

;;; Code:

(require 'general)
(general-create-definer my-leader-def
			:prefix "\\")
(my-leader-def 'normal
	       "f" 'find-file
	       "b" 'ido-switch-buffer
	       "k" 'ido-kill-buffer
	       "p" 'projectile-switch-project
	       )
(general-create-definer my-local-leader-def
			;; :prefix my-local-leader
			  :prefix ",")
(my-local-leader-def 'normal
		     "f" 'projectile-find-file
		     "b" 'projectile-switch-to-buffer
		     "j i" 'idomenu
		     "g g" 'dumb-jump-go
		     "g b" 'dumb-jump-back
		     "g p" 'dumb-jump-quick-look
		     )
(general-define-key
 :prefix "C-c"
 "SPC" 'ace-jump-mode
 "p" 'projectile-command-map
 "j i" 'idomenu
 "\\" 'imenu-list-smart-toggle
 "o c" 'org-capture
 "o a" 'org-agenda
 "o l" 'org-store-link
 ;; "y" 'company-yasnippet
 "C-c M-x" 'execute-extended-command  ;; old M-x
 )
(general-define-key
 "M-x" 'smex
 "M-X" 'smex-major-mode-commands
 "C-x C-b" 'ibuffer
 "RET" 'newline-and-indent
 "<f10>" 'rename-buffer
 "<escape>" 'keyboard-escape-quit)

(provide 'init-keymap)

;;; init-keymap ends her
